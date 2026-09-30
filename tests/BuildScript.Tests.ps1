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

    foreach ($fn in 'Get-NamelistAuditData', 'Get-OrderedEntryStats', 'Compare-NamelistAuditData', 'Get-GitFileText', 'Get-NameVariantKey', 'Resolve-GroupTag', 'Get-GroupSections', 'Get-OrphanHeaderLines', 'Edit-NamelistGroupText', 'Compare-NamelistGroupSets', 'Format-NamelistDiff', 'Get-CountryName', 'Format-PlanChangeTable', 'Set-PlanChangeTable', 'New-AuditPlanText', 'Format-AuditSummaryLine', 'Update-WikiGroupRows', 'Find-WikiProseMentions') {
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

    It "Rejects a namelist file containing focus checks (has_completed_focus)" {
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
'@
        $file = Join-Path $script:ValidationFixtureDir "common\units\names_divisions\INEX_TST_names_divisions.txt"
        $raw = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
        $rawWithFocus = $raw -replace 'for_countries = \{ TST \}', "for_countries = { TST }`r`n`tcan_use = { has_completed_focus = TST_my_focus }"
        [System.IO.File]::WriteAllText($file, $rawWithFocus, [System.Text.Encoding]::UTF8)
        Invoke-FixtureValidation | Should -BeFalse
    }

    It "Rejects a malformed ordered entry even when its double quotes balance" {
        # Regression test: '7 = { 5a Divisione Alpina GL S.Tosa"" }' (name outside the quotes) has
        # an even quote count, so the parity check passed it and the entry silently vanished.
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First Division" }
		2 = { Second Division"" }
'@
        Invoke-FixtureValidation | Should -BeFalse
    }

    It "Rejects an ordered entry with text between two quoted strings" {
        New-ValidationFixtureFile -OrderedBody @'
		1 = { "First" Division" }
'@
        Invoke-FixtureValidation | Should -BeFalse
    }

    It "Accepts ordered entries with optional description/URL arguments, bare strings and trailing comments" {
        New-ValidationFixtureFile -OrderedBody @'
		# Section header
		1 = { "First Division" "A tooltip description" }
		2 = { "Second Division" "Tooltip" "https://example.org/wiki" }
		3 = "Third Division"
		4 = { "Fourth Division 'Nick'" }	# trailing comment
		5 = { "Fifth Division \"Escaped\"" }
'@
        Invoke-FixtureValidation | Should -BeTrue
    }
}

Describe "build.ps1 Helper: Format-AuditSummaryLine" {
    It "Totals authored/ordered entries and file + group flags as evaluated numbers" {
        # Regression test: -AuditPlan built this line inline with a missing '$' before the second
        # subexpression, writing the object's type dump into the plan instead of the ordered total.
        $data = [PSCustomObject]@{
            FileFlags = @('HEADER_BOILERPLATE')
            Groups    = @(
                [PSCustomObject]@{ AuthoredCount = 5; OrderedCount = 8; Flags = @('LOW_DEPTH', 'SELECTOR_SINGULAR') },
                [PSCustomObject]@{ AuthoredCount = 3; OrderedCount = 3; Flags = @() }
            )
        }
        Format-AuditSummaryLine -Key 'TST' -Data $data | Should -Be 'AUDIT SUMMARY TST: GROUPS=2 AUTHORED=8/11 FLAGS=3'
    }

    It "Is used by both -Audit and -AuditPlan instead of an inline summary string" {
        ([regex]::Matches($script:BuildContent, 'Format-AuditSummaryLine -Key')).Count | Should -BeGreaterOrEqual 2
        ([regex]::Matches($script:BuildContent, 'AUDIT SUMMARY \$\{')).Count | Should -Be 1
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
	can_use = { has_completed_focus = TST_my_focus }
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

    It "Flags duplicate selectors, TODO comments, and focus locks" {
        $g = & $script:AuditGroup 'TST_GAR_01'
        $g.Flags | Should -Contain 'SELECTOR_DUPLICATE'
        $g.Flags | Should -Contain 'TODO_COMMENT'
        $g.Flags | Should -Contain 'FOCUS_LOCKED'
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

Describe "build.ps1 Helper: Get-NameVariantKey" {
    It "Normalizes case, diacritics and whitespace" {
        (Get-NameVariantKey "K$([char]0x0101)rlis") | Should -Be (Get-NameVariantKey 'Karlis')
        (Get-NameVariantKey "J$([char]0x0101)nis   $([char]0x010C)akste") | Should -Be (Get-NameVariantKey 'Janis Cakste')
    }

    It "Maps roman numerals to digits" {
        (Get-NameVariantKey 'Karl XII') | Should -Be (Get-NameVariantKey 'Karl 12')
        (Get-NameVariantKey 'Division IV') | Should -Be (Get-NameVariantKey 'Division 4')
    }

    It "Keeps distinct numbers apart" {
        (Get-NameVariantKey 'Division IV') | Should -Not -Be (Get-NameVariantKey 'Division V')
        (Get-NameVariantKey '1. Divisioona') | Should -Not -Be (Get-NameVariantKey '2. Divisioona')
    }
}

Describe "build.ps1 Helper: Resolve-GroupTag" {
    BeforeAll {
        $script:KnownTags = @('TST_INF_01', 'TST_INF_02', 'TST_MOT_01', 'TST_ARM_01')
    }

    It "Resolves exact tags" {
        Resolve-GroupTag -Tag 'TST' -Name 'TST_INF_01' -Known $script:KnownTags | Should -Be 'TST_INF_01'
    }

    It "Resolves shorthand with or without prefix and index" {
        Resolve-GroupTag -Tag 'TST' -Name 'INF_01' -Known $script:KnownTags | Should -Be 'TST_INF_01'
        Resolve-GroupTag -Tag 'TST' -Name 'MOT' -Known $script:KnownTags | Should -Be 'TST_MOT_01'
        Resolve-GroupTag -Tag 'TST' -Name 'ARM_01' -Known $script:KnownTags | Should -Be 'TST_ARM_01'
    }

    It "Returns null for unknown group names" {
        Resolve-GroupTag -Tag 'TST' -Name 'XYZ' -Known $script:KnownTags | Should -BeNullOrEmpty
    }
}

Describe "build.ps1 Helper: Get-GroupSections" {
    It "Splits ordered entries into comment-headed sections" {
        $block = @"
TST_INF_01 = {
	name = "Infantry Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Divisioona"
	ordered = {
		# Line Infantry
		1 = { "1. Divisioona" }
		2 = { "2. Divisioona" }
		# Border Jaeger
		10 = { "10. Rajajääkäripataljoona" }
	}
}
"@
        $sections = Get-GroupSections -RawBlock $block
        $sections.Count | Should -Be 2
        $sections[0].Header | Should -Be "Line Infantry"
        $sections[0].Names | Should -Be @("1. Divisioona", "2. Divisioona")
        $sections[1].Header | Should -Be "Border Jaeger"
        $sections[1].Names | Should -Be @("10. Rajajääkäripataljoona")
    }
}

Describe "build.ps1 Helper: Edit-NamelistGroupText" {
    BeforeAll {
        $script:SampleNamelist = @"
TST_INF_01 = {
	name = "Infantry Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Divisioona"
	ordered = {
		# Frontline
		1 = { "1. Divisioona" }
		2 = { "2. Divisioona" }
		3 = { "3. Divisioona" }
		# Reserve
		4 = { "4. Divisioona" }
	}
}

TST_CAV_01 = {
	name = "Cavalry Divisions"
	division_types = { "cavalry" }
	fallback_name = "%d. Ratsuväkidivisioona"
	ordered = {
		1 = { "Hämeen Ratsurykmentti" }
	}
}
"@
    }

    It "Renames an entry in place" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Rename @('1. Divisioona=1. Jalkaväkidivisioona')
        $edited | Should -Match '1 = \{ "1\. Jalkaväkidivisioona" \}'
        $edited | Should -Not -Match '"1\. Divisioona"'
    }

    It "Removes an entry by name or index" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Remove @('2. Divisioona')
        $edited | Should -Not -Match '"2\. Divisioona"'
        $edited2 = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Remove @('2')
        $edited2 | Should -Not -Match '2 = \{ "2\. Divisioona" \}'
    }

    It "Sets an entry by key=value" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Set @('3=3. Karjalan Divisioona')
        $edited | Should -Match '3 = \{ "3\. Karjalan Divisioona" \}'
        $edited | Should -Not -Match '3 = \{ "3\. Divisioona" \}'
    }

    It "Adds entries under an existing or new section header" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Add @('5. Divisioona') -Section 'Reserve'
        $edited | Should -Match '(?s)# Reserve.*4 = \{ "4\. Divisioona" \}.*5 = \{ "5\. Divisioona" \}'

        $editedNewSec = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Add @('10. Prikaati') -Section 'Brigades'
        $editedNewSec | Should -Match '# Brigades'
        $editedNewSec | Should -Match '10 = \{ "10\. Prikaati" \}'
    }

    It "Drops an emptied section header when its entries are removed" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Remove @('4. Divisioona')
        $edited | Should -Not -Match '# Reserve'
    }

    It "Throws errors on invalid operations" {
        { Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Remove @('NonExistent') } | Should -Throw
        { Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Add @('1. Divisioona') } | Should -Throw
        { Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_CAV_01' -Remove @('Hämeen Ratsurykmentti') } | Should -Throw
    }

    It "Updates selector name in place" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -Selector 'Rifle Divisions'
        $edited | Should -Match 'name = "Rifle Divisions"'
        $edited | Should -Not -Match 'name = "Infantry Divisions"'
    }

    It "Adds and removes division types in place" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -AddTypes @('motorized')
        $edited | Should -Match 'division_types = \{ "infantry" "motorized" \}'

        $edited2 = Edit-NamelistGroupText -Text $edited -GroupTag 'TST_INF_01' -RemoveTypes @('infantry')
        $edited2 | Should -Match 'division_types = \{ "motorized" \}'
    }

    It "Throws on invalid division type tokens" {
        { Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -AddTypes @('invalid_armor') } | Should -Throw
    }

    It "Sets can_use condition and rejects focus locks" {
        $edited = Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -CanUse 'has_government = democratic'
        $edited | Should -Match 'can_use = \{ has_government = democratic \}'

        { Edit-NamelistGroupText -Text $script:SampleNamelist -GroupTag 'TST_INF_01' -CanUse 'has_completed_focus = my_focus' } | Should -Throw
    }
}

Describe "build.ps1 Helper: Compare-NamelistGroupSets and Format-NamelistDiff" {
    BeforeAll {
        $mk = { param($tag, $sel, $types, $fb, $entries)
            [PSCustomObject]@{ Tag = $tag; Selector = $sel; DivisionTypes = @($types); Fallback = $fb; LinkTargets = @(); Entries = @($entries) }
        }
        $script:OldGroups = @(
            (& $mk 'TST_INF_01' 'Infantry' @('infantry') '%d. Div' @('1. Div', '2. Div', '3. Div')),
            (& $mk 'TST_CAV_01' 'Cavalry' @('cavalry') '%d. Cav' @('1. Cav', '2. Cav')),
            (& $mk 'TST_OLD_01' 'Old' @('infantry') '%d. Old' @('Old 1'))
        )
        $script:NewGroups = @(
            (& $mk 'TST_INF_01' 'Infantry Divisions' @('infantry') '%d. Divisioona' @('1. Div', '3. Div', '2. Cav')),
            (& $mk 'TST_CAV_01' 'Cavalry' @('cavalry') '%d. Cav' @('1. Cav')),
            (& $mk 'TST_ARM_01' 'Armor' @('light_armor') '%d. Arm' @('1. Arm'))
        )
        $script:Diff = Compare-NamelistGroupSets -Old $script:OldGroups -New $script:NewGroups
    }

    It "Identifies added, removed, and modified groups" {
        ($script:Diff | Where-Object GroupTag -eq 'TST_ARM_01').Status | Should -Be 'added'
        ($script:Diff | Where-Object GroupTag -eq 'TST_OLD_01').Status | Should -Be 'removed'
        ($script:Diff | Where-Object GroupTag -eq 'TST_INF_01').Status | Should -Be 'modified'
        ($script:Diff | Where-Object GroupTag -eq 'TST_CAV_01').Status | Should -Be 'modified'
    }

    It "Formats diff lines with move tracking" {
        $lines = Format-NamelistDiff -Diff $script:Diff -Tag 'TST' -BaseLabel 'HEAD'
        $lines[0] | Should -Match 'Name diff TST \(HEAD -> working tree\): 4 changed, 0 unchanged'
        $lines | Should -Contain 'Moved: 2. Cav (CAV_01->INF_01)'
    }
}

Describe "build.ps1 Helper: Format-PlanChangeTable and Set-PlanChangeTable" {
    It "Formats markdown change table with move annotations" {
        $table = Format-PlanChangeTable -Diff $script:Diff -Tag 'TST'
        $table[0] | Should -Be '| Group | Count | Added | Removed | Other |'
        $table | Should -Contain '| CAV_01 | 2 -> 1 | - | 2. Cav (to INF_01) | - |'
        $table | Should -Contain "| INF_01 | 3 -> 3 | 2. Cav (from CAV_01) | 2. Div | selector: 'Infantry' -> 'Infantry Divisions'; fallback: '%d. Div' -> '%d. Divisioona' |"
        $table | Should -Contain '| ARM_01 | new, 1 | 1. Arm | - | - |'
    }

    It "Sets plan change table between markers" {
        $plan = @"
# Audit Plan
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| old | table |
<!-- END CHANGE TABLE -->
## Next Section
"@
        $updated = Set-PlanChangeTable -PlanText $plan -TableLines @('| new | table |')
        $updated | Should -Match '\| new \| table \|'
        $updated | Should -Not -Match '\| old \| table \|'
        $updated | Should -Match '## Next Section'
    }
}

Describe "build.ps1 Helper: Update-WikiGroupRows and Find-WikiProseMentions" {
    It "Updates wiki table rows with selector, types, and fallback changes" {
        $wiki = @"
# Testland
| Tag | Name | Type | Fallback | Examples |
|---|---|---|---|---|
| ``TST_INF_01`` | Infantry | infantry | ``%d. Div`` | 1. Div, 2. Div |
| ``TST_OLD_01`` | Old | infantry | ``%d. Old`` | Old 1 |
"@
        $groups = @(
            [PSCustomObject]@{ Tag = 'TST_INF_01'; Selector = 'Infantry Divisions'; DivisionTypes = @('infantry'); Fallback = '%d. Divisioona'; Entries = @('1. Div') }
        )
        $res = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag 'TST'
        $res.Text | Should -Match '\| Infantry Divisions \|'
        $res.Text | Should -Match '`%d\. Divisioona`'
        $res.Stale | Should -Be @('TST_OLD_01')
    }

    It "Finds prose lines mentioning names" {
        $wiki = @"
# Testland
The division was commanded by General Mannerheim.
| ``TST_INF_01`` | Name | Type | Fallback | Mannerheim |
Other notes.
"@
        $hits = Find-WikiProseMentions -WikiText $wiki -Names @('Mannerheim') -Tag 'TST'
        $hits.Count | Should -Be 1
        $hits[0] | Should -Be 'L2: Mannerheim'
    }

    It "Synchronizes wiki group headings with new selector while preserving native parenthetical" {
        $dash = [char]0x2014
        $wiki = @"
# Testland
## Group Details
### ``TST_INF_01`` $dash Old Infantry (Jalkaväki)
Description of infantry.
### ``TST_CAV_01`` $dash Cavalry
Description of cavalry.
"@
        $groups = @(
            [PSCustomObject]@{ Tag = 'TST_INF_01'; Selector = 'Infantry Divisions'; DivisionTypes = @('infantry'); Fallback = '%d. Div'; Entries = @('1. Div') },
            [PSCustomObject]@{ Tag = 'TST_CAV_01'; Selector = 'Cavalry Brigades'; DivisionTypes = @('cavalry'); Fallback = '%d. Cav'; Entries = @('1. Cav') }
        )
        $res = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag 'TST'
        $res.Text | Should -Match "### ``TST_INF_01`` $dash Infantry Divisions \(Jalkaväki\)"
        $res.Text | Should -Match "### ``TST_CAV_01`` $dash Cavalry Brigades"
    }
}

Describe "build.ps1 -EditNames action and -Audit CLI flags" {
    It "Audits an implemented nation with -NamesOnly" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit LAT -NamesOnly 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01 \(\d+/\d+\)'
        $output | Should -Not -Match 'ordered = \{'
    }

    It "Audits a single group with -Group and -NamesOnly" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit LAT -Group INF_01 -NamesOnly 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01 \(\d+/\d+\)'
        $output | Should -Not -Match 'LAT_CAV_01'
    }

    It "Audits multiple groups with comma-separated -Group" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit LAT -Group INF_01,CAV_01 -NamesOnly 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01'
        $output | Should -Match 'LAT_CAV_01'
        $output | Should -Not -Match 'LAT_REG_01'
    }

    It "Fails with exit 1 and leaves file untouched when -EditNames misses" {
        $path = Join-Path $script:RepoRoot 'common\units\names_divisions\INEX_LAT_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $output = & powershell -NoProfile -File $script:BuildScriptPath -EditNames LAT -Group INF_01 -Remove 'NonExistentDivisionName' 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 1
        $output | Should -Match 'NonExistentDivisionName'
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }
}
