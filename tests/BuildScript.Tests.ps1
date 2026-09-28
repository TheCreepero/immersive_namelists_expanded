<#
.SYNOPSIS
    Pester unit tests for build.ps1 helper functions and packaging configurations.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:BuildScriptPath = Join-Path $script:RepoRoot "build.ps1"

    # Read build.ps1 script content to extract functions without executing the full script
    $script:BuildContent = [System.IO.File]::ReadAllText($script:BuildScriptPath, [System.Text.Encoding]::UTF8)

    # Dot-source Get-ModMetadata and New-LauncherModContent definitions safely
    $metaFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function Get-ModMetadata\s*\{.*?\n\})')
    $launcherFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function New-LauncherModContent\s*\{.*?\n\})')

    if ($metaFuncMatch.Success) {
        . ([ScriptBlock]::Create($metaFuncMatch.Groups[1].Value))
    }
    if ($launcherFuncMatch.Success) {
        . ([ScriptBlock]::Create($launcherFuncMatch.Groups[1].Value))
    }

    $auditFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function Get-NamelistAuditData\s*\{.*?\n\})')
    if ($auditFuncMatch.Success) {
        . ([ScriptBlock]::Create($auditFuncMatch.Groups[1].Value))
    }

    # Dot-source Write-* terminal helpers and Invoke-Validation (used together, so extract as a block)
    $writeHelpersMatch = [regex]::Match($script:BuildContent, '(?s)(function Write-Step.*?function Write-Err\s*\{.*?\n\})')
    if ($writeHelpersMatch.Success) {
        . ([ScriptBlock]::Create($writeHelpersMatch.Groups[1].Value))
    }
    $validationFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function Invoke-Validation\s*\{.*?\n\})\r?\n\r?\n# --- Helper: Find or Install SteamCMD')
    if ($validationFuncMatch.Success) {
        . ([ScriptBlock]::Create($validationFuncMatch.Groups[1].Value))
    }
}

Describe "build.ps1 Helper: Get-ModMetadata" {
    It "Parses mod metadata correctly from descriptor file" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.5.0"
tags={
	"Historical"
	"Military"
}
name="Test Mod"
supported_version="1.14.*"
remote_file_id="1234567890"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $meta = Get-ModMetadata -Path $tempFile
            $meta.Version | Should -Be "1.5.0"
            $meta.Name | Should -Be "Test Mod"
            $meta.SupportedVersion | Should -Be "1.14.*"
            $meta.RemoteFileId | Should -Be "1234567890"
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Helper: New-LauncherModContent" {
    It "Normalizes backslashes to forward slashes in target mod path" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.0"
name="Test Mod"
supported_version="1.14.*"
remote_file_id="99999"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $result = New-LauncherModContent -DescriptorPath $tempFile -TargetModPath "C:\Users\User\Documents\Paradox Interactive\Hearts of Iron IV\mod\test_mod"
            $result | Should -Match 'path="C:/Users/User/Documents/Paradox Interactive/Hearts of Iron IV/mod/test_mod"'
            $result | Should -Not -Match '\\\\'
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }

    It "Places path before remote_file_id" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.0"
name="Test Mod"
supported_version="1.14.*"
remote_file_id="99999"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $result = New-LauncherModContent -DescriptorPath $tempFile -TargetModPath "mod/test_mod"
            $result | Should -Match '(?s)path="mod/test_mod".*remote_file_id="99999"'
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Packaging & Staging Exclusions" {
    It "Build script must exclude tests directory from packages and deployment" {
        # Check that 'tests' is present in excludeDirs in build.ps1
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]tests['`"]" -Because "tests directory must be excluded from release staging"
    }

    It "Build script must exclude wiki directory from packages and deployment" {
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]wiki['`"]" -Because "wiki directory must be excluded from release staging"
    }

    It "Build script must exclude .git and dev tools from packaging" {
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]\.git['`"]"
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]\.github['`"]"
    }

    It "All excludeDirs definitions in build.ps1 must include wiki and tests" {
        $matches = [regex]::Matches($script:BuildContent, 'excludeDirs\s*=\s*@\([^)]+\)')
        $matches.Count | Should -BeGreaterOrEqual 3
        foreach ($m in $matches) {
            $m.Value | Should -Match "['`"]wiki['`"]" -Because "Every staging and deployment step must exclude wiki"
            $m.Value | Should -Match "['`"]tests['`"]" -Because "Every staging and deployment step must exclude tests"
        }
    }

    It "All excludeDirs definitions in build.ps1 must exclude agent skill directories" {
        $defs = [regex]::Matches($script:BuildContent, 'excludeDirs\s*=\s*@\([^)]+\)')
        foreach ($d in $defs) {
            $d.Value | Should -Match "['`"]\.claude['`"]" -Because "Claude Code skills and settings must not ship with the mod"
            $d.Value | Should -Match "['`"]\.agents['`"]" -Because "Antigravity skills must not ship with the mod"
        }
    }
}

Describe "build.ps1 Helper: Invoke-Validation" {
    BeforeAll {
        # Invoke-Validation reads script-scoped $RepoDir / $DescriptorPath, so build a minimal
        # standalone mod directory to run it against instead of touching the real repo.
        $script:ValidationFixtureDir = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_validate_" + [System.Guid]::NewGuid().ToString("N"))
        $namelistFixtureDir = Join-Path $script:ValidationFixtureDir "common\units\names_divisions"
        New-Item -ItemType Directory -Path $namelistFixtureDir -Force | Out-Null

        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText((Join-Path $script:ValidationFixtureDir "descriptor.mod"), @'
version="1.0.0"
name="Test Mod"
supported_version="1.19.*"
tags={
	"Historical"
}
'@, $utf8NoBom)
        [System.IO.File]::WriteAllBytes((Join-Path $script:ValidationFixtureDir "thumbnail.png"), [byte[]]@(0x89, 0x50, 0x4E, 0x47))

        function Set-ValidationFixtureReadme {
            param([string]$Content)
            [System.IO.File]::WriteAllText((Join-Path $script:ValidationFixtureDir "README.md"), $Content, $utf8NoBom)
        }
        Set-ValidationFixtureReadme "| TST | Test Nation | INEX_TST_names_divisions.txt |`n"

        function New-ValidationFixtureFile {
            param([string]$OrderedBody)
            $content = @"
TST_INF_01 = {
	name = "Infantry Divisions"
	for_countries = { TST }
	division_types = { "infantry" }
	fallback_name = "%d. Test Division"
	ordered = {
$OrderedBody
	}
}
"@
            [System.IO.File]::WriteAllText((Join-Path $namelistFixtureDir "INEX_TST_names_divisions.txt"), $content, $utf8NoBom)
        }

        function Invoke-FixtureValidation {
            $script:RepoDir = $script:ValidationFixtureDir
            $script:DescriptorPath = Join-Path $script:ValidationFixtureDir "descriptor.mod"
            Invoke-Validation
        }
    }

    AfterAll {
        if (Test-Path $script:ValidationFixtureDir) { Remove-Item -Recurse -Force $script:ValidationFixtureDir }
    }

    It "Passes a namelist file with unique brace-wrapped ordered entries (N = { `"...`" })" {
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
		2 = { "Second Division" }
		3 = { "Third Division" }
'@
        Invoke-FixtureValidation | Should -BeTrue
    }

    It "Detects a duplicate ordered key even when entries use brace-wrapped 'N = { `"...`" }' syntax" {
        # Regression test: the duplicate-index regex previously required 'N = "...' directly (no
        # brace), and captured 'ordered' block content with [^}]*, which stops at the first nested
        # '}' and never scans past the first entry. Both bugs meant real INEX-style files (which
        # always wrap entries in braces) were never actually checked for duplicate keys.
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
		2 = { "Second Division" }
		2 = { "Duplicate Second Division" }
'@
        Invoke-FixtureValidation | Should -BeFalse
    }

    It "Flags a nation tag implemented in namelists but missing from README.md" {
        # Regression test: the README doc-sync regex previously used "[`]?" inside a double-quoted
        # PowerShell string, where the backtick escapes the following ']' into a literal character
        # instead of producing an optional-backtick pattern. The resulting character class combined
        # with \s* (which matches newlines) let it match across two unrelated table rows using no
        # actual tag text at all - so it silently reported EVERY tag as documented, even ones not in
        # the file. Rebuild the fixture without a "| TST |" row anywhere and confirm it is now caught.
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
'@
        Set-ValidationFixtureReadme "| Other Nation |`n| :--- |`n| Another Row |`n"
        Invoke-FixtureValidation | Should -BeFalse
    }

    It "Accepts a nation tag documented in README.md with markdown code backticks" {
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
'@
        Set-ValidationFixtureReadme "| ``TST`` | Test Nation | ``INEX_TST_names_divisions.txt`` |`n"
        Invoke-FixtureValidation | Should -BeTrue
    }
}

Describe "build.ps1 Helper: Get-NamelistAuditData" {
    BeforeAll {
        $script:AuditFixture = [System.IO.Path]::GetTempFileName()
        $fixture = @'
# Division template historical names system. Is a new method of naming the divisions based on the names-group assigned to it's template.

TST_INF_01 =
{
	name = "Infantry Division"
	for_countries = { TST }
	division_types = { "infantry" }
	#link_numbering_with = { TST_INF_01 }
	fallback_name = "%d. Divisioona"
	ordered =
	{
		1 = { "%d. Divisioona" }
		2 = { "%d. Divisioona" }
		3 = { "%d. Divisioona" }
		4 = { "%d. Divisioona" }
	}
}

TST_GAR_01 = {
	name = "Infantry Division" # TODO find real names
	for_countries = { TST }
	division_types = { "infantry" }
	fallback_name = "%d. Varuskunta"
	ordered = {
		1 = { "Helsingin Varuskunta" }
		2 = { "Turun Varuskunta" }
	}
}

TST_MOT_01 = {
	name = "Motorized Divisions"
	for_countries = { TST }
	division_types = { "motorized" }
	fallback_name = "%d. Moottoroitu Divisioona"
	ordered = {
		1 = { "1. Moottoroitu Divisioona" }
	}
}

TST_ARM_01 = {
	name = "Armored Divisions"
	for_countries = { TST }
	division_types = { "light_armor" "medium_armor" }
	link_numbering_with = { TST_INF_01 }
	fallback_name = "%d. Panssaridivisioona"
	ordered = {
		1 = { "1. Panssaridivisioona \"Hakkapeliitta\"" }
		2 = { "2. Panssaridivisioona \"Karjala\"" }
		3 = { "3. Panssaridivisioona \"Savo\"" }
		4 = { "4. Panssaridivisioona \"Kymi\"" }
		5 = { "5. Panssaridivisioona \"Uusimaa\"" }
		6 = { "6. Panssaridivisioona \"Pohjanmaa\"" }
		7 = { "7. Panssaridivisioona \"Lappi\"" }
		8 = { "8. Panssaridivisioona \"Kainuu\"" }
		9 = { "9. Panssaridivisioona \"Satakunta\"" }
		10 = { "10. Panssaridivisioona \"Ahvenanmaa\"" }
		11 = { "%d. Panssaridivisioona" }
	}
}
'@
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($script:AuditFixture, $fixture, $utf8NoBom)
        $script:AuditData = Get-NamelistAuditData -Path $script:AuditFixture
        $script:AuditGroup = { param($tag) $script:AuditData.Groups | Where-Object { $_.Tag -eq $tag } }
    }

    AfterAll {
        if (Test-Path $script:AuditFixture) { Remove-Item -Force $script:AuditFixture }
    }

    It "Parses every root group" {
        @($script:AuditData.Groups | ForEach-Object { $_.Tag }) | Should -Be @('TST_INF_01', 'TST_GAR_01', 'TST_MOT_01', 'TST_ARM_01')
    }

    It "Flags the vanilla boilerplate header" {
        $script:AuditData.FileFlags | Should -Contain 'HEADER_BOILERPLATE'
    }

    It "Flags a placeholder-only group with a singular selector and dead self-link comment" {
        $g = & $script:AuditGroup 'TST_INF_01'
        $g.OrderedCount | Should -Be 4
        $g.AuthoredCount | Should -Be 0
        $g.Flags | Should -Contain 'PLACEHOLDER_ENTRIES'
        $g.Flags | Should -Contain 'LOW_DEPTH'
        $g.Flags | Should -Contain 'SELECTOR_SINGULAR'
        $g.Flags | Should -Contain 'DEAD_SELF_LINK_COMMENT'
    }

    It "Flags duplicate selectors and TODO comments" {
        $g = & $script:AuditGroup 'TST_GAR_01'
        $g.Flags | Should -Contain 'SELECTOR_DUPLICATE'
        $g.Flags | Should -Contain 'TODO_COMMENT'
        (& $script:AuditGroup 'TST_INF_01').Flags | Should -Contain 'SELECTOR_DUPLICATE'
    }

    It "Flags motorized groups that do not share numbering with field infantry" {
        (& $script:AuditGroup 'TST_MOT_01').Flags | Should -Contain 'UNLINKED_MOBILE'
    }

    It "Raises no flags on a modern group with escaped nickname quotes" {
        $g = & $script:AuditGroup 'TST_ARM_01'
        $g.OrderedCount | Should -Be 11
        $g.AuthoredCount | Should -Be 10
        $g.LinkTargets | Should -Be @('TST_INF_01')
        $g.Flags.Count | Should -Be 0
    }
}
