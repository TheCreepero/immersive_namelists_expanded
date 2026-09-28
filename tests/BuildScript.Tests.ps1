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

    foreach ($fn in 'Get-NamelistAuditData', 'Get-OrderedEntryStats', 'Compare-NamelistAuditData', 'Get-GitFileText') {
        $fnMatch = [regex]::Match($script:BuildContent, "(?s)(function $fn\s*\{.*?\n\})")
        if ($fnMatch.Success) {
            . ([ScriptBlock]::Create($fnMatch.Groups[1].Value))
        }
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

TST_MOT_02 = {
	name = "Motorized Brigades"
	for_countries = { TST }
	division_types = { "motorized" }
	fallback_name = "%d. Moottoroitu Prikaati"
	ordered = {
		1 = { "1. Moottoroitu Prikaati 'Karjala'" }
		2 = { "2. Moottoroitu Prikaati 'Kuninkaallinen Uudenmaan ja Hämeen Perinneosasto'" }
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

TST_MEC_01 = {
	name = "Mechanised Divisions"
	for_countries = { TST }
	division_types = { "mechanized" }
	link_numbering_with = { TST_MOT_01 }
	fallback_name = "%d. Panssarijääkäridivisioona"
}

TST_MEC_02 = {
	name = "Mechanised Divisions (Named)"
	for_countries = { TST }
	division_types = { "mechanized" }
	link_numbering_with = { TST_MOT_01 }
	fallback_name = "%d. Panssarijääkäridivisioona"
	ordered = {
		1 = { "1. Panssarijääkäridivisioona 'Hamina'" }
		2 = { "2. Panssarijääkäridivisioona 'Kouvola'" }
		3 = { "3. Panssarijääkäridivisioona 'Mikkeli'" }
		4 = { "4. Panssarijääkäridivisioona 'Kuopio'" }
		5 = { "5. Panssarijääkäridivisioona 'Joensuu'" }
		6 = { "6. Panssarijääkäridivisioona 'Kajaani'" }
		7 = { "7. Panssarijääkäridivisioona 'Oulu'" }
		8 = { "8. Panssarijääkäridivisioona 'Tampere'" }
		9 = { "9. Panssarijääkäridivisioona 'Turku'" }
		10 = { "10. Panssarijääkäridivisioona 'Lahti'" }
	}
}

TST_MEC_03 = {
	name = "Mechanised Brigades"
	for_countries = { TST }
	division_types = { "mechanized" }
	link_numbering_with = { TST_MOT_01 }
	fallback_name = "%d. Panssarijääkäriprikaati"
	ordered = {
		1 = { "%d. Panssarijääkäriprikaati" }
		2 = { "%d. Panssarijääkäriprikaati" }
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
        @($script:AuditData.Groups | ForEach-Object { $_.Tag }) | Should -Be @('TST_INF_01', 'TST_GAR_01', 'TST_MOT_01', 'TST_MOT_02', 'TST_ARM_01', 'TST_MEC_01', 'TST_MEC_02', 'TST_MEC_03')
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
        (& $script:AuditGroup 'TST_MOT_02').Flags | Should -Contain 'UNLINKED_MOBILE'
    }

    It "Does not flag a mobile numbering anchor that other groups link to" {
        (& $script:AuditGroup 'TST_MOT_01').Flags | Should -Not -Contain 'UNLINKED_MOBILE'
    }

    It "Flags only outlier-length names (over 60 characters)" {
        (& $script:AuditGroup 'TST_MOT_02').Flags | Should -Contain 'NAME_LONG'
        (& $script:AuditGroup 'TST_ARM_01').Flags | Should -Not -Contain 'NAME_LONG'
    }

    It "Reports an identity reused under different division numbers once per file" {
        $script:AuditData.FileFlags | Should -Contain 'IDENTITY_REPEAT'
        $shared = @($script:AuditData.SharedIdentities | Where-Object { $_.Identity -eq 'Karjala' })
        $shared.Count | Should -Be 1
        $shared[0].Groups | Should -Be @('TST_MOT_02', 'TST_ARM_01')
        # The escaped-quote form must not be counted as a separate identity
        @($script:AuditData.SharedIdentities | Where-Object { $_.Identity -match '\\' }).Count | Should -Be 0
    }

    It "Raises no flags on a modern group with escaped nickname quotes" {
        $g = & $script:AuditGroup 'TST_ARM_01'
        $g.OrderedCount | Should -Be 11
        $g.AuthoredCount | Should -Be 10
        $g.LinkTargets | Should -Be @('TST_INF_01')
        $g.Flags.Count | Should -Be 0
    }

    It "Exempts a fallback-only plain variant that shares numbering with a named sibling" {
        $plain = & $script:AuditGroup 'TST_MEC_01'
        $plain.OrderedCount | Should -Be 0
        $plain.PlainVariantOf | Should -Be 'TST_MEC_02'
        $plain.Flags.Count | Should -Be 0
        (& $script:AuditGroup 'TST_MEC_02').Flags.Count | Should -Be 0
    }

    It "Does not treat a placeholder group without a numbering-sharing sibling as a plain variant" {
        $g = & $script:AuditGroup 'TST_INF_01'
        $g.PlainVariantOf | Should -BeNullOrEmpty
        $g.Flags | Should -Contain 'LOW_DEPTH'
    }

    It "Keeps placeholder flags on a group with ordered entries even when a named sibling shares its numbering" {
        $g = & $script:AuditGroup 'TST_MEC_03'
        $g.PlainVariantOf | Should -BeNullOrEmpty
        $g.Flags | Should -Contain 'PLACEHOLDER_ENTRIES'
        $g.Flags | Should -Contain 'LOW_DEPTH'
    }
}

Describe "build.ps1 Helper: Get-OrderedEntryStats" {
    It "Counts every entry in a multi-entry block and reports malformed ones" {
        # Comment-stripped vanilla-style block, including a missing opening quote (as in vanilla FIN_GAR_02)
        $block = @'
TST_GAR_02 = {
	name = "Suojeluskunta Divisions"
	fallback_name = "%d. Suojeluskuntapiiri"
	ordered = {
		1 = { "Helsingin Suojeluskuntapiiri" }
		2 = { "Turunmaan Suojeluskuntapiiri" "Tooltip text" }
		3 = { Lahden suojeluskuntapiiri" }
		4 = "Oulun Suojeluskuntapiiri"
	}
}
'@
        $stats = Get-OrderedEntryStats -CleanBlock $block
        $stats.Count | Should -Be 4
        $stats.Malformed | Should -Be 1
        $stats.Samples[0] | Should -Be '1=Helsingin Suojeluskuntapiiri'
    }

    It "Returns zero counts for a fallback-only group" {
        $stats = Get-OrderedEntryStats -CleanBlock 'TST_INF_02 = { name = "Legions" fallback_name = "%d. Legioona" }'
        $stats.Count | Should -Be 0
        $stats.Malformed | Should -Be 0
    }
}

Describe "build.ps1 Helper: Get-GitFileText" {
    It "Returns null instead of throwing for an unknown ref, even under ErrorActionPreference Stop" {
        $ErrorActionPreference = 'Stop'
        { Get-GitFileText -RepoPath $script:RepoRoot -Ref 'no-such-ref-inex' -RelPath 'build.ps1' } | Should -Not -Throw
        Get-GitFileText -RepoPath $script:RepoRoot -Ref 'no-such-ref-inex' -RelPath 'build.ps1' | Should -BeNullOrEmpty
    }

    It "Returns null for a path that does not exist at the ref" {
        Get-GitFileText -RepoPath $script:RepoRoot -Ref 'HEAD' -RelPath 'no/such/file.txt' | Should -BeNullOrEmpty
    }

    It "Returns the file text at a valid ref with diacritics intact" {
        $text = Get-GitFileText -RepoPath $script:RepoRoot -Ref 'HEAD' -RelPath 'common/units/names_divisions/INEX_FIN_names_divisions.txt'
        $text | Should -Match 'FIN_INF_01'
        # Built from char codes: Windows PowerShell reads this BOM-less test file as ANSI
        $a = [char]0x00E4
        $text | Should -Match "J${a}${a}k${a}ridivisioona"
    }
}

Describe "build.ps1 Helper: Get-NamelistAuditData identity parsing" {
    BeforeAll {
        $script:IdFixture = [System.IO.Path]::GetTempFileName()
        $fixture = @'
TST_GUA_01 = {
	name = "Guards Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Guards Division"
	ordered = {
		1 = { "1st Royal Guard 'The King's Own'" }
		2 = { "2nd Royal Guard 'Panssaridivisioona 'Lagus''" }
	}
}

TST_GUA_02 = {
	name = "Guards Brigades"
	division_types = { "infantry" }
	fallback_name = "%d. Guards Brigade"
	ordered = {
		3 = { "3rd Guards Brigade 'The King's Own'" }
		4 = { "Guards Brigade 'Unnumbered'" }
	}
}

TST_GUA_03 = {
	name = "Guards Regiments"
	division_types = { "infantry" }
	fallback_name = "%d. Guards Regiment"
	ordered = {
		1 = { "Guards Regiment 'Unnumbered'" }
	}
}
'@
        [System.IO.File]::WriteAllText($script:IdFixture, $fixture, (New-Object System.Text.UTF8Encoding($false)))
        $script:IdData = Get-NamelistAuditData -Path $script:IdFixture
    }

    AfterAll {
        if (Test-Path $script:IdFixture) { Remove-Item -Force $script:IdFixture }
    }

    It "Keeps apostrophes inside a single-quoted nickname" {
        $ids = @($script:IdData.SharedIdentities | ForEach-Object { $_.Identity })
        $ids | Should -Contain "The King's Own"
        $ids | Should -Not -Contain 'The King'
    }

    It "Does not report identities whose entries carry no comparable number" {
        @($script:IdData.SharedIdentities | Where-Object { $_.Identity -eq 'Unnumbered' }).Count | Should -Be 0
    }
}

Describe "build.ps1 Helper: Compare-NamelistAuditData" {
    BeforeAll {
        $mk = { param($tag, $sel, $fb, $links, $entries)
            [PSCustomObject]@{ Tag = $tag; Selector = $sel; DivisionTypes = @('infantry'); Fallback = $fb; LinkTargets = @($links); Entries = @($entries) } }
        $old = [PSCustomObject]@{ Groups = @(
            (& $mk 'TST_INF_01' 'Infantry Divisions' '%d. Divisioona' @() @('%d. Divisioona', '%d. Divisioona')),
            (& $mk 'TST_DET_02' 'Separate Groups' 'Ryhmä %s' @() @('Ryhmä Talvela', 'Ryhmä Airo')),
            (& $mk 'TST_OLD_01' 'Old Groups' '%d. Vanha' @() @('Vanha 1'))
        ) }
        $new = [PSCustomObject]@{ Groups = @(
            (& $mk 'TST_INF_01' 'Infantry Divisions' '%d. Divisioona' @() @()),
            (& $mk 'TST_INF_05' 'Infantry Divisions (Named)' '%d. Divisioona' @('TST_INF_01') @("12. Divisioona 'Kollaa'")),
            (& $mk 'TST_DET_02' 'Separate Groups' 'Ryhmä %s.' @() @('Ryhmä Talvela', 'Ryhmä Pajari'))
        ) }
        $script:Diff = Compare-NamelistAuditData -Old $old -New $new
    }

    It "Reports removed and added tags" {
        $script:Diff.RemovedTags | Should -Be @('TST_OLD_01')
        $script:Diff.AddedTags | Should -Be @('TST_INF_05')
    }

    It "Reports field changes on kept tags" {
        $script:Diff.FieldChanges | Should -Contain "[TST_DET_02] fallback: 'Ryhmä %s' -> 'Ryhmä %s.'"
        @($script:Diff.FieldChanges).Count | Should -Be 1
    }

    It "Lists only added or changed names and counts removed ones" {
        @($script:Diff.NewNames | ForEach-Object { "$($_.Tag)|$($_.Name)" }) | Should -Be @("TST_INF_05|12. Divisioona 'Kollaa'", 'TST_DET_02|Ryhmä Pajari')
        # 2 INF placeholders + Ryhmä Airo + the removed tag's 1 entry
        $script:Diff.RemovedNameCount | Should -Be 4
    }
}
