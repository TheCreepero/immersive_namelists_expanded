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

    # Script-level list of valid division_types tokens, read by Invoke-Validation and Edit-NamelistGroupText
    $typesMatch = [regex]::Match($script:BuildContent, '(?s)\$ValidDivisionTypes = @\(.*?\)')
    if ($typesMatch.Success) {
        . ([ScriptBlock]::Create($typesMatch.Value))
    }

    foreach ($fn in 'Get-NamePatternKey', 'Test-FallbackStub', 'Get-NamelistAuditData', 'Get-OrderedEntryStats', 'Compare-NamelistAuditData', 'Get-GitFileText', 'Get-NameVariantKey', 'Resolve-GroupTag', 'Get-GroupSections', 'Format-EntryList', 'Get-OrphanHeaderLines', 'Set-NamelistGroupComment', 'Set-NamelistHeader', 'Edit-NamelistGroupText', 'Get-NamelistGroupEnd', 'Add-NamelistGroupText', 'ConvertTo-NamelistEditOp', 'Invoke-NamelistEditOps', 'Get-PlanBatchBlocks', 'Get-PlanReadinessWarnings', 'Read-NamelistEditBatch', 'Get-WorkshopDocStats', 'Get-VanillaOverlap', 'Find-WikiLinkMismatches', 'Compare-NamelistGroupSets', 'Format-NamelistDiff', 'Get-CountryName', 'Format-PlanChangeTable', 'Set-PlanChangeTable', 'New-AuditPlanText', 'Format-AuditSummaryLine', 'Update-WikiGroupRows', 'Find-WikiProseMentions') {
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

    It "Puts the change table last in a new plan skeleton so a resumed session can skip it" {
        $text = New-AuditPlanText -Country 'Testland' -Tag 'TST' -Date '2026-01-01' -FindingLines @() -Summary 's' -TableLines @('| Group | Count |', '| A | 1 |')
        $headings = @([regex]::Matches($text, '(?m)^## (.+)$') | ForEach-Object { $_.Groups[1].Value })
        $headings[-1] | Should -Be 'Per-group changes'
        $text.TrimEnd() | Should -Match '<!-- END CHANGE TABLE -->$'
        { Set-PlanChangeTable -PlanText $text -TableLines @('| Group | Count |', '| B | 2 |') } | Should -Not -Throw
    }

    It "Gives a new plan skeleton the hand-off sections, with the edit batch after everything the implementer reads" {
        $text = New-AuditPlanText -Country 'Testland' -Tag 'TST' -Date '2026-01-01' -FindingLines @() -Summary 's' -TableLines @('| Group | Count |')
        $text | Should -Match '(?m)^Status: PLANNING$'
        $headings = @([regex]::Matches($text, '(?m)^## (.+)$') | ForEach-Object { $_.Groups[1].Value })
        foreach ($h in 'For the implementer', 'Implementation steps', 'Docs payload', 'Stop conditions', 'Edit batch') { $headings | Should -Contain $h }
        $headings[-2] | Should -Be 'Edit batch'
        $text | Should -Match '-EditNames TST -Batch'
        # The skeleton describes the fence but holds no batch block yet, and what the implementer fills is not a planner TODO
        (Get-PlanBatchBlocks -PlanText $text).Count | Should -Be 0
        $text | Should -Match '## Outcome\n<!-- TODO\(implementer\):'
        $warnings = Get-PlanReadinessWarnings -PlanText $text
        ($warnings -join '; ') | Should -Match 'PLANNING'
        ($warnings -join '; ') | Should -Match '\d+ planner TODO'
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

Describe "build.ps1 Helper: Format-EntryList" {
    It "Joins distinct names and collapses consecutive duplicates with a count" {
        Format-EntryList -Names @('A', 'B', 'B', 'B', 'C') | Should -Be 'A; B (x3); C'
    }

    It "Does not collapse identical names that are not adjacent" {
        Format-EntryList -Names @('A', 'B', 'A') | Should -Be 'A; B; A'
    }

    It "Prefixes keys, using ranges for contiguous runs" {
        Format-EntryList -Names @('A', 'B', 'B', 'B', 'C') -Keys @(1, 2, 3, 4, 9) -ShowKeys | Should -Be '1=A; 2-4=B (x3); 9=C'
    }

    It "Lists the keys of a collapsed run that has gaps" {
        Format-EntryList -Names @('B', 'B', 'B') -Keys @(2, 4, 6) -ShowKeys | Should -Be '2,4,6=B (x3)'
    }

    It "Returns an empty string for no names" {
        Format-EntryList -Names @() | Should -Be ''
    }
}

Describe "build.ps1 Helper: structural namelist edits" {
    BeforeAll {
        $script:Structural = @"
# Vanilla header line
# second header line

# ===== Infantry =====

# Overrides vanilla TST_INF_01.
TST_INF_01 = {
	name = "Infantry Divisions"
	can_use = { always = yes }
	division_types = { "infantry" }

	# Number reservation system will tie to another group.
	link_numbering_with = { TST_CAV_01 }

	fallback_name = "%d. Divisioona"

	# Names with numbers (only one number per entry).
	# It's okay to have gaps in numbering.
	ordered = {
		# Frontline
		1 = { "1. Divisioona" }
		2 = { "2. Divisioona" }
	}
}

TST_CAV_01 = {
	name = "Cavalry Divisions"
	division_types = { "cavalry" }
	fallback_name = "%d. Ratsuvaki"
	ordered = {
		1 = { "Hameen Ratsurykmentti" }
	}
}

TST_NOFB_01 = {
	name = "No fallback"
	division_types = { "infantry" }
	ordered = {
		1 = { "Only Name" }
	}
}
"@
    }

    Context "Doubled line endings" {
        It "Does not emit CR CR LF when adding a new section to a CRLF file" {
            $crlf = $script:Structural -replace "`r?`n", "`r`n"
            $edited = Edit-NamelistGroupText -Text $crlf -GroupTag 'TST_INF_01' -Add @('3. Divisioona', '4. Divisioona') -Section 'Reserve'
            $edited | Should -Match '# Reserve'
            $edited | Should -Not -Match "`r`r"
            ([regex]::Matches($edited, "(?<!`r)`n")).Count | Should -Be 0
        }
    }

    Context "-RemoveAll and '# Header' items" {
        It "Rewrites the entries of a group in one edit" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -RemoveAll -Add @('7=7. Uusi')
            $edited | Should -Match '7 = \{ "7\. Uusi" \}'
            $edited | Should -Not -Match '"1\. Divisioona"'
            $edited | Should -Not -Match '# Frontline'
        }

        It "Refuses -RemoveAll without anything to add" {
            { Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -RemoveAll } | Should -Throw '*empty ordered block*'
        }

        It "Creates several sections from '# Header' items" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -RemoveAll -Add @('# First', '1=1. A', '2=2. B', '# Second', '10=10. C')
            $edited | Should -Match '(?s)# First.*1 = \{ "1\. A" \}.*2 = \{ "2\. B" \}.*# Second.*10 = \{ "10\. C" \}'
        }

        It "Rejects '# Header' items combined with -Section" {
            { Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -Add @('# H', '5=5. X') -Section 'Frontline' } | Should -Throw '*cannot be combined*'
        }
    }

    Context "-ClearOrdered" {
        It "Leaves a fallback-only group and removes the introducing comments" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -ClearOrdered
            $block = [regex]::Match($edited, '(?s)TST_INF_01 = \{.*?\n\}').Value
            $block | Should -Not -Match 'ordered'
            $block | Should -Not -Match 'Names with numbers'
            $block | Should -Match 'fallback_name = "%d\. Divisioona"'
            $block | Should -Match 'link_numbering_with = \{ TST_CAV_01 \}'
            $edited | Should -Match 'TST_CAV_01 = \{'
        }

        It "Keeps the file parseable by the audit" {
            $tmp = [System.IO.Path]::GetTempFileName()
            try {
                $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -ClearOrdered
                [System.IO.File]::WriteAllText($tmp, $edited, (New-Object System.Text.UTF8Encoding($false)))
                $data = Get-NamelistAuditData -Path $tmp
                @($data.Groups | ForEach-Object { $_.Tag }) | Should -Be @('TST_INF_01', 'TST_CAV_01', 'TST_NOFB_01')
                ($data.Groups | Where-Object { $_.Tag -eq 'TST_INF_01' }).OrderedCount | Should -Be 0
            } finally { Remove-Item -Force $tmp }
        }

        It "Refuses a group without fallback_name and combinations with entry edits" {
            { Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_NOFB_01' -ClearOrdered } | Should -Throw '*fallback_name*'
            { Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -ClearOrdered -Add @('9=9. X') } | Should -Throw '*cannot be combined*'
        }
    }

    Context "-RemoveGroup" {
        It "Removes the group and the comments directly above it, keeping its neighbours" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -RemoveGroup
            $edited | Should -Not -Match 'TST_INF_01'
            $edited | Should -Not -Match 'Overrides vanilla TST_INF_01'
            $edited | Should -Match '# ===== Infantry ====='
            $edited | Should -Match 'TST_CAV_01 = \{'
            $edited | Should -Not -Match "(\r?\n){3}"
        }

        It "Removes a group in the middle of the file without touching the next one" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_CAV_01' -RemoveGroup
            $edited | Should -Not -Match 'TST_CAV_01 = \{'
            $edited | Should -Not -Match 'Hameen Ratsurykmentti'
            $edited | Should -Match 'TST_NOFB_01 = \{'
            $edited | Should -Match '"2\. Divisioona"'
        }

        It "Cannot be combined with other edits" {
            { Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_CAV_01' -RemoveGroup -Selector 'X' } | Should -Throw '*cannot be combined*'
        }
    }

    Context "-Comment" {
        It "Replaces the comment lines directly above a group" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_INF_01' -Comment 'Plain variant; fallback names only.'
            $edited | Should -Match "# Plain variant; fallback names only\.\r?\nTST_INF_01 = \{"
            $edited | Should -Not -Match 'Overrides vanilla TST_INF_01'
            $edited | Should -Match '# ===== Infantry ====='
        }

        It "Adds a comment (with a banner and a blank line) above an uncommented group" {
            $edited = Edit-NamelistGroupText -Text $script:Structural -GroupTag 'TST_CAV_01' -Comment '# ===== Cavalry =====\n\nOverrides vanilla TST_CAV_01.'
            $edited | Should -Match "(?s)\}\r?\n\r?\n# ===== Cavalry =====\r?\n\r?\n# Overrides vanilla TST_CAV_01\.\r?\nTST_CAV_01 = \{"
        }
    }

    Context "Set-NamelistHeader" {
        It "Replaces the header but keeps comments attached to the first group" {
            $text = "# old 1`n# old 2`n`n# attached`nTST_A = {`n`tname = `"A`"`n}`n"
            $edited = Set-NamelistHeader -Text $text -Header 'INEX test header\nsecond line'
            $edited | Should -Match '^# INEX test header\n# second line\n\n# attached\nTST_A = \{'
            $edited | Should -Not -Match 'old 1'
        }

        It "Keeps a section banner that sits between the header and the first group" {
            $text = "# old 1`n`n# ===== Infantry =====`n`n# Overrides vanilla.`nTST_A = {`n`tname = `"A`"`n}`n"
            $edited = Set-NamelistHeader -Text $text -Header 'New header'
            $edited | Should -Match '^# New header\n\n# ===== Infantry =====\n\n# Overrides vanilla\.\nTST_A = \{'
            $edited | Should -Not -Match 'old 1'
        }

        It "Clears the boilerplate flag in the audit" {
            $tmp = [System.IO.Path]::GetTempFileName()
            try {
                $boiler = "# Division template historical names system. Is a new method of naming the divisions based on the names-group assigned to it's template.`n`nTST_A = {`n`tname = `"A`"`n`tfallback_name = `"%d. A`"`n}`n"
                [System.IO.File]::WriteAllText($tmp, $boiler, (New-Object System.Text.UTF8Encoding($false)))
                (Get-NamelistAuditData -Path $tmp).FileFlags | Should -Contain 'HEADER_BOILERPLATE'
                [System.IO.File]::WriteAllText($tmp, (Set-NamelistHeader -Text $boiler -Header 'INEX - Test (TST)'), (New-Object System.Text.UTF8Encoding($false)))
                (Get-NamelistAuditData -Path $tmp).FileFlags | Should -Not -Contain 'HEADER_BOILERPLATE'
            } finally { Remove-Item -Force $tmp }
        }
    }
}

Describe "build.ps1 Helper: audit gating, ordinal and vanilla-overlap lints" {
    BeforeAll {
        $script:LintFixture = [System.IO.Path]::GetTempFileName()
        $e = [char]0x00E8
        $fixture = @"
TST_MIL_01 = {
	name = "Home Militia"
	division_types = { "militia" }
	fallback_name = "%d. Milicja"
	ordered = {
		1 = { "Milicja Wawelska" }
	}
}

TST_MIL_02 = {
	name = "Party Militia"
	can_use = { has_government = fascism }
	division_types = { "militia" }
	fallback_name = "%d. Milicja"
	ordered = {
		1 = { "Milicja Partyjna" }
	}
}

TST_MIL_03 = {
	name = "Mixed Gate"
	can_use = { OR = { has_government = fascism has_government = neutrality } }
	division_types = { "infantry" }
	fallback_name = "%d. Dywizja"
}

TST_FR_01 = {
	name = "Divisions"
	division_types = { "infantry" }
	fallback_name = "%d${e}me Division"
	ordered = {
		1 = { "%d${e}re Division" }
		5 = { "%d${e}re Division" }
	}
}

TST_EN_01 = {
	name = "English"
	division_types = { "infantry" }
	fallback_name = "%dth Division"
	ordered = {
		1 = { "%dst Division" }
		2 = { "%dnd Division" }
		3 = { "%drd Division" }
		11 = { "%dth Division" }
		12 = { "%dth Division" }
		21 = { "%dst Division" }
	}
}

TST_EN_02 = {
	name = "English wrong"
	division_types = { "infantry" }
	fallback_name = "%dth Division"
	ordered = {
		1 = { "%dst Division" }
		2 = { "%dst Division" }
	}
}
"@
        [System.IO.File]::WriteAllText($script:LintFixture, $fixture, (New-Object System.Text.UTF8Encoding($false)))
        $script:LintData = Get-NamelistAuditData -Path $script:LintFixture
        $script:LintGroup = { param($tag) $script:LintData.Groups | Where-Object { $_.Tag -eq $tag } }
    }

    AfterAll {
        if (Test-Path $script:LintFixture) { Remove-Item -Force $script:LintFixture }
    }

    It "Parses can_use, including nested blocks, and entry keys" {
        (& $script:LintGroup 'TST_MIL_01').CanUse | Should -BeNullOrEmpty
        (& $script:LintGroup 'TST_MIL_02').CanUse | Should -Be 'has_government = fascism'
        (& $script:LintGroup 'TST_MIL_03').CanUse | Should -Be 'OR = { has_government = fascism has_government = neutrality }'
        (& $script:LintGroup 'TST_EN_01').EntryKeys | Should -Be @(1, 2, 3, 11, 12, 21)
    }

    It "Flags a militia or political group that any government may use" {
        (& $script:LintGroup 'TST_MIL_01').Flags | Should -Contain 'UNGATED_POLITICAL'
    }

    It "Does not flag a gated political group" {
        (& $script:LintGroup 'TST_MIL_02').Flags | Should -Not -Contain 'UNGATED_POLITICAL'
        (& $script:LintGroup 'TST_MIL_03').Flags | Should -Not -Contain 'UNGATED_POLITICAL'
    }

    It "Flags a French feminine first ordinal at a key other than 1" {
        (& $script:LintGroup 'TST_FR_01').Flags | Should -Contain 'ORDINAL_MISMATCH'
    }

    It "Accepts English ordinal suffixes that match their key" {
        (& $script:LintGroup 'TST_EN_01').Flags | Should -Not -Contain 'ORDINAL_MISMATCH'
    }

    It "Flags an English ordinal suffix that does not match its key" {
        (& $script:LintGroup 'TST_EN_02').Flags | Should -Contain 'ORDINAL_MISMATCH'
    }

    Context "Get-VanillaOverlap" {
        BeforeAll {
            $script:FakeHoi4 = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_hoi4_" + [guid]::NewGuid().ToString('N'))
            $dir = Join-Path $script:FakeHoi4 'common\units\names_divisions'
            New-Item -ItemType Directory -Force -Path $dir | Out-Null
            $e = [char]0x00E8
            $vanilla = @"
TST_FR_01 = {
	name = "Divisions"
	fallback_name = "%d${e}me Division"
	ordered = {
		1 = { "%d${e}re Division" }
		5 = { "%d${e}re Division" }
		6 = { "Sixieme" }
	}
}
"@
            [System.IO.File]::WriteAllText((Join-Path $dir 'TST_names_divisions.txt'), $vanilla, (New-Object System.Text.UTF8Encoding($false)))
        }

        AfterAll {
            if (Test-Path $script:FakeHoi4) { Remove-Item -Recurse -Force $script:FakeHoi4 }
        }

        It "Counts entries identical in key and name to the vanilla group with the same tag" {
            $o = Get-VanillaOverlap -Groups $script:LintData.Groups -Key 'TST' -Hoi4Dir $script:FakeHoi4
            $o['TST_FR_01'].Matches | Should -Be 2
            $o['TST_FR_01'].Total | Should -Be 2
            $o.ContainsKey('TST_EN_01') | Should -BeFalse
        }

        It "Returns nothing when HOI4 is not installed" {
            (Get-VanillaOverlap -Groups $script:LintData.Groups -Key 'TST' -Hoi4Dir $null).Count | Should -Be 0
        }
    }
}

Describe "build.ps1 Helper: wiki heading and link-claim checks" {
    BeforeAll {
        $script:LinkGroups = @(
            [PSCustomObject]@{ Tag = 'TST_INF_01'; LinkTargets = @() },
            [PSCustomObject]@{ Tag = 'TST_MOT_01'; LinkTargets = @('TST_INF_01') },
            [PSCustomObject]@{ Tag = 'TST_MNT_01'; LinkTargets = @('TST_INF_01') }
        )
    }

    It "Does not append a native parenthetical that the selector already contains" {
        $groups = @([PSCustomObject]@{ Tag = 'TST_GN_01'; Selector = 'National Guard Divisions'; DivisionTypes = @('infantry'); Fallback = '%d. Garde'; LinkTargets = @() })
        $wiki = "### ``TST_GN_01`` $([char]0x2014) Garde Nationale (National Guard)`n"
        $r = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag 'TST'
        $r.Text | Should -Match 'National Guard Divisions\s*$'
        $r.Text | Should -Not -Match 'Divisions \(National Guard\)'
    }

    It "Still keeps a native-name parenthetical that adds information" {
        $groups = @([PSCustomObject]@{ Tag = 'TST_MOT_01'; Selector = 'Motorized Divisions'; DivisionTypes = @('motorized'); Fallback = '%d. DIM'; LinkTargets = @() })
        $wiki = "### ``TST_MOT_01`` $([char]0x2014) Motorized Division (Division d'Infanterie Motorisee)`n"
        $r = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag 'TST'
        $r.Text | Should -Match "Motorized Divisions \(Division d'Infanterie Motorisee\)"
    }

    It "Reports a section claim that names the wrong numbering partner" {
        $wiki = "### ``TST_MOT_01`` Motorized`nShares numbering with ``TST_MNT_01`` via link_numbering_with.`n"
        $r = Find-WikiLinkMismatches -WikiText $wiki -Groups $script:LinkGroups
        $r.Count | Should -Be 1
        $r[0] | Should -Match 'TST_MOT_01 is said to share numbering with TST_MNT_01'
        $r[0] | Should -Match 'TST_INF_01'
    }

    It "Accepts a claim that matches the namelist, in either direction" {
        $wiki = "### ``TST_MOT_01`` Motorized`nShares numbering with ``TST_INF_01``.`n### ``TST_INF_01`` Infantry`nShares numbering with ``TST_MOT_01``.`n"
        (Find-WikiLinkMismatches -WikiText $wiki -Groups $script:LinkGroups).Count | Should -Be 0
    }

    It "Uses the bullet's own tag as the subject inside a multi-tag section" {
        $wiki = "### ``TST_INF_01`` / ``TST_MOT_01`` Mixed`n- ``TST_MOT_01`` shares numbering with ``TST_MNT_01``.`n"
        $r = Find-WikiLinkMismatches -WikiText $wiki -Groups $script:LinkGroups
        $r.Count | Should -Be 1
        $r[0] | Should -Match '^L2: TST_MOT_01'
    }
}

Describe "build.ps1 -Audit -Keys and -EditNames CLI safety" {
    It "Prints keys and collapses duplicate runs with -NamesOnly -Keys" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit LAT -Group INF_01 -NamesOnly -Keys 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01 \(\d+/\d+\)'
        $output | Should -Match '(?m)\b\d+(-\d+)?='
    }

    It "Refuses -RemoveGroup while another group links to it, leaving the file untouched" {
        # FRA_INF_01 is the numbering anchor of FRA_INF_02, FRA_MOT_01, FRA_MNT_01 and FRA_GAR_01
        $path = Join-Path $script:RepoRoot 'common\units\names_divisions\INEX_FRA_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $output = & powershell -NoProfile -File $script:BuildScriptPath -EditNames FRA -Group INF_01 -RemoveGroup 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 1
        $output | Should -Match 'link_numbering_with'
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }

    It "Fails -ClearOrdered on a group that is already fallback-only, leaving the file untouched" {
        $path = Join-Path $script:RepoRoot 'common\units\names_divisions\INEX_FRA_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $null = & powershell -NoProfile -File $script:BuildScriptPath -EditNames FRA -Group INF_01 -ClearOrdered 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 1
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }
}

Describe "build.ps1: valid division_types list" {
    It "Is defined once and shared by validation and -EditNames" {
        ([regex]::Matches($script:BuildContent, "'super_heavy_armor'")).Count | Should -Be 1
        $ValidDivisionTypes | Should -Contain 'infantry'
        $ValidDivisionTypes | Should -Contain 'penal_battalion'
        $ValidDivisionTypes | Should -Not -Contain 'armor'
    }

    It "Names the valid tokens when -EditNames rejects one" {
        $text = "TST_INF_01 = {`n`tname = `"Infantry`"`n`tdivision_types = { `"infantry`" }`n`tfallback_name = `"%d. Div`"`n}`n"
        { Edit-NamelistGroupText -Text $text -GroupTag 'TST_INF_01' -AddTypes @('armor') } | Should -Throw '*medium_armor*'
    }
}

Describe "build.ps1 Helper: collapsed diff output" {
    BeforeAll {
        $mk = { param($tag, $fb, $entries)
            [PSCustomObject]@{ Tag = $tag; Selector = 'Sel'; DivisionTypes = @('infantry'); Fallback = $fb; LinkTargets = @(); Entries = @($entries) }
        }
        $stubs = @(1..6 | ForEach-Object { "$_. Div" })
        $script:DupOld = @(
            (& $mk 'TST_INF_01' '%d. Div' (@('Keep') + $stubs + @('Old Guard'))),
            (& $mk 'TST_CAV_01' '%d. Cav' @('1. Cav', 'Moved Name'))
        )
        $script:DupNew = @(
            (& $mk 'TST_INF_01' '%d. Div' @('Keep', 'New A', '%d. Div', 'New B', '%d. Div', '%d. Div', 'Moved Name')),
            (& $mk 'TST_CAV_01' '%d. Cav' @('1. Cav'))
        )
        $script:DupDiff = Compare-NamelistGroupSets -Old $script:DupOld -New $script:DupNew
    }

    It "Format-EntryList -Distinct counts every repeat of a name, adjacent or not" {
        Format-EntryList -Names @('A', 'B', 'A', 'A', 'C') -Distinct | Should -Be 'A (x3); B; C'
    }

    It "Format-EntryList takes a separator and per-name notes" {
        Format-EntryList -Names @('A', 'B', 'B') -Distinct -Separator ', ' -Notes @{ B = ' (to X)' } | Should -Be 'A, B (x2) (to X)'
    }

    It "Keeps the fallback of both sides on each compared group" {
        $inf = $script:DupDiff | Where-Object GroupTag -eq 'TST_INF_01'
        $inf.OldFallback | Should -Be '%d. Div'
        $inf.NewFallback | Should -Be '%d. Div'
    }

    It "Format-NamelistDiff collapses a repeated added name and loses no distinct name" {
        $lines = Format-NamelistDiff -Diff $script:DupDiff -Tag 'TST' -BaseLabel 'HEAD'
        $inf = $lines | Where-Object { $_ -match '^INF_01 ' }
        $inf | Should -Match '\+ New A; %d\. Div \(x3\); New B; Moved Name \|'
        ([regex]::Matches($inf, '%d\. Div')).Count | Should -Be 1
        foreach ($n in @('1. Div', '6. Div', 'Old Guard')) { $inf | Should -Match ([regex]::Escape($n)) }
    }

    It "Test-FallbackStub matches numbered and ordinal forms of the fallback only" {
        Test-FallbackStub -Name '12. Div' -Fallback '%d. Div' | Should -BeTrue
        Test-FallbackStub -Name '%d. Div' -Fallback '%d. Div' | Should -BeTrue
        Test-FallbackStub -Name '1st Infantry Division' -Fallback '%dth Infantry Division' | Should -BeTrue
        Test-FallbackStub -Name "12$([char]0x00E8)me Division" -Fallback "%d$([char]0x00E8)me Division" | Should -BeTrue
        Test-FallbackStub -Name 'XII. Div' -Fallback '%s. Div' | Should -BeTrue
        Test-FallbackStub -Name '12. Karelian Div' -Fallback '%d. Div' | Should -BeFalse
        Test-FallbackStub -Name 'Old Guard' -Fallback $null | Should -BeFalse
    }

    It "Format-PlanChangeTable prints removed fallback stubs as a count and keeps authored and moved names" {
        $table = Format-PlanChangeTable -Diff $script:DupDiff -Tag 'TST'
        $table | Should -Contain '| INF_01 | 8 -> 7 | New A, %d. Div (x3), New B, Moved Name (from CAV_01) | Old Guard, 6 fallback stubs | - |'
        $table | Should -Contain '| CAV_01 | 2 -> 1 | - | Moved Name (to INF_01) | - |'
    }
}

Describe "build.ps1 Helper: duplicate, stale-comment and political-entry lints" {
    BeforeAll {
        $script:NewLintFixture = [System.IO.Path]::GetTempFileName()
        $fixture = @"
TST_DUP_01 = {
	name = "Artillery Divisions"
	division_types = { "artillery" }
	fallback_name = "%d. Artillery Division"
	ordered = {
		1 = { "Alpha Artillery Division" }
		2 = { "Beta Artillery Division" }
		3 = { "Alpha Artillery Division" }
		4 = { "%d. Breakthrough Division" }
		5 = { "%d. Breakthrough Division" }
	}
}

TST_STALE_01 = {
	name = "Marine Divisions"
	division_types = { "marine" }
	fallback_name = "%d. Marine Division"
	ordered = {
		1 = { "First Marine Division" }
		# Fictional divisions start here
		2 = { "Second Marine Division" }
	}
}

TST_POL_01 = {
	name = "Grenadier Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Grenadier-Division"
	ordered = {
		1 = { "1. Grenadier-Division" }
		2 = { "2. Volks-Sturm Division" }
		3 = { "3. Waffen-Grenadier-Division" }
	}
}

TST_POL_02 = {
	name = "Grenadier Divisions B"
	can_use = { has_government = fascism }
	division_types = { "infantry" }
	fallback_name = "%d. Grenadier-Division"
	ordered = {
		1 = { "2. Volks-Sturm Division" }
	}
}

TST_POL_03 = {
	name = "People's Militia"
	division_types = { "infantry" }
	fallback_name = "%d. Volkssturm-Division"
	ordered = {
		1 = { "1. Volkssturm-Division" }
	}
}

TST_CLEAN_01 = {
	name = "Mountain Divisions"
	division_types = { "mountaineers" }
	fallback_name = "%d. Gebirgs-Division"
	ordered = {
		# Alpine corps
		1 = { "1. Gebirgs-Division 'Edelweiss'" }
		2 = { "2. Gebirgs-Division 'Enzian'" }
		3 = { "3. Luftwaffen-Sturm-Division" }
	}
}
"@
        [System.IO.File]::WriteAllText($script:NewLintFixture, $fixture, (New-Object System.Text.UTF8Encoding($false)))
        $script:NewLintData = Get-NamelistAuditData -Path $script:NewLintFixture
        $script:NewLintGroup = { param($tag) $script:NewLintData.Groups | Where-Object { $_.Tag -eq $tag } }
    }

    AfterAll {
        if (Test-Path $script:NewLintFixture) { Remove-Item -Force $script:NewLintFixture }
    }

    It "Flags a literal name authored twice in one group and lists it" {
        $g = & $script:NewLintGroup 'TST_DUP_01'
        $g.Flags | Should -Contain 'DUPLICATE_NAME'
        @($g.FlagDetails['DUPLICATE_NAME']) | Should -Be @('Alpha Artillery Division')
    }

    It "Does not count repeated %d patterns as duplicate names" {
        @((& $script:NewLintGroup 'TST_DUP_01').FlagDetails['DUPLICATE_NAME']) | Should -Not -Contain '%d. Breakthrough Division'
    }

    It "Flags a stale comment inside a group" {
        $g = & $script:NewLintGroup 'TST_STALE_01'
        $g.Flags | Should -Contain 'STALE_COMMENT'
        @($g.FlagDetails['STALE_COMMENT']) | Should -Be @('Fictional divisions start here')
    }

    It "Flags political entries in an ungated group and lists them" {
        $g = & $script:NewLintGroup 'TST_POL_01'
        $g.Flags | Should -Contain 'POLITICAL_ENTRY'
        @($g.FlagDetails['POLITICAL_ENTRY']) | Should -Be @('2. Volks-Sturm Division', '3. Waffen-Grenadier-Division')
    }

    It "Does not flag political entries in a gated group" {
        (& $script:NewLintGroup 'TST_POL_02').Flags | Should -Not -Contain 'POLITICAL_ENTRY'
    }

    It "Leaves a group already flagged UNGATED_POLITICAL to that flag alone" {
        $g = & $script:NewLintGroup 'TST_POL_03'
        $g.Flags | Should -Contain 'UNGATED_POLITICAL'
        $g.Flags | Should -Not -Contain 'POLITICAL_ENTRY'
    }

    It "Raises none of the three on a clean group with an ordinary section header and a Luftwaffe name" {
        $g = & $script:NewLintGroup 'TST_CLEAN_01'
        foreach ($f in 'DUPLICATE_NAME', 'STALE_COMMENT', 'POLITICAL_ENTRY') { $g.Flags | Should -Not -Contain $f }
    }

    It "Parses namelist text passed directly instead of a path" {
        $text = [System.IO.File]::ReadAllText($script:NewLintFixture, [System.Text.Encoding]::UTF8)
        $data = Get-NamelistAuditData -Text $text
        @($data.Groups | ForEach-Object { $_.Tag }) | Should -Be @($script:NewLintData.Groups | ForEach-Object { $_.Tag })
    }
}

Describe "build.ps1 Helper: Add-NamelistGroupText" {
    BeforeAll {
        $script:AddGroupBase = @"
# Header

TST_INF_01 = {
	name = "Infantry Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Divisioona"
	ordered = {
		1 = { "1. Divisioona" }
	}
}

TST_CAV_01 = {
	name = "Cavalry Brigades"
	division_types = { "cavalry" }
	fallback_name = "%d. Ratsuprikaati"
}
"@ -replace "`r`n", "`n"
        $script:AddGroupArgs = @{ Country = 'TST'; Selector = 'Motorized Divisions'; Types = @('motorized'); Fallback = '%d. Moottoroitu Divisioona' }
    }

    It "Appends a fallback-only group in the file template layout" {
        $args1 = $script:AddGroupArgs
        $new = Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @args1
        $new | Should -Match '(?s)TST_CAV_01 = \{.*\}\n\nTST_MOT_01 = \n\{\n\tname = "Motorized Divisions"\n\n\tfor_countries = \{ TST \}\n\n\tcan_use = \{ always = yes \}\n\n\tdivision_types = \{ "motorized" \}\n\n\tfallback_name = "%d\. Moottoroitu Divisioona"\n\}\n$'
        $new | Should -Not -Match 'TST_MOT_01[^}]*ordered'
    }

    It "Inserts after a named group with gate, link, entries and comment, and stays parseable" {
        $args1 = $script:AddGroupArgs
        $new = Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @args1 -AfterGroup 'TST_INF_01' -Link 'TST_INF_01' -CanUse 'has_government = fascism' -Add @('# Elite', "1. Moottoroitu 'Salama'", '2. Moottoroitu') -Comment 'Shares numbering with TST_INF_01.'
        $data = Get-NamelistAuditData -Text $new
        @($data.Groups | ForEach-Object { $_.Tag }) | Should -Be @('TST_INF_01', 'TST_MOT_01', 'TST_CAV_01')
        $g = $data.Groups | Where-Object { $_.Tag -eq 'TST_MOT_01' }
        $g.Entries | Should -Be @("1. Moottoroitu 'Salama'", '2. Moottoroitu')
        $g.LinkTargets | Should -Be @('TST_INF_01')
        $g.CanUse | Should -Be 'has_government = fascism'
        $new | Should -Match '\}\n\n# Shares numbering with TST_INF_01\.\nTST_MOT_01 = '
        $new | Should -Match '\t\t# Elite\n\t\t1 = \{ "1\. Moottoroitu ''Salama''" \}'
        $new | Should -Match '\}\n\nTST_CAV_01 = \{'
    }

    It "Keeps CRLF line endings" {
        $crlf = $script:AddGroupBase -replace "`n", "`r`n"
        $args1 = $script:AddGroupArgs
        $new = Add-NamelistGroupText -Text $crlf -GroupTag 'TST_MOT_01' @args1 -AfterGroup 'TST_INF_01' -Add @('1. Moottoroitu')
        ([regex]::Matches($new, "(?<!`r)`n")).Count | Should -Be 0
        $new | Should -Not -Match "`r`r"
    }

    It "Refuses an existing or taken tag, bad tokens, a bad fallback and bad references" {
        $a = $script:AddGroupArgs
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_INF_01' @a } | Should -Throw '*already exists*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @a -TakenTags @('TST_MOT_01') } | Should -Throw '*another namelist file*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'tst mot' @a } | Should -Throw '*tag*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' -Country TST -Selector 'X' -Types @('armor') -Fallback '%d. X' } | Should -Throw '*armor*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' -Country TST -Selector 'X' -Types @() -Fallback '%d. X' } | Should -Throw '*division type*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' -Country TST -Selector 'X' -Types @('motorized') -Fallback 'Plain' } | Should -Throw '*%d*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' -Country TST -Types @('motorized') -Fallback '%d. X' } | Should -Throw '*Selector*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @a -Link 'TST_NOPE_01' } | Should -Throw '*TST_NOPE_01*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @a -AfterGroup 'TST_NOPE_01' } | Should -Throw '*TST_NOPE_01*'
        { Add-NamelistGroupText -Text $script:AddGroupBase -GroupTag 'TST_MOT_01' @a -CanUse 'has_completed_focus = TST_x' } | Should -Throw '*Focus*'
    }
}

Describe "build.ps1 Helper: ConvertTo-NamelistEditOp and Invoke-NamelistEditOps" {
    BeforeAll {
        $script:OpsBase = @"
TST_INF_01 = {
	name = "Infantry Divisions"
	division_types = { "infantry" }
	fallback_name = "%d. Divisioona"
	ordered = {
		1 = { "1. Divisioona" }
		2 = { "2. Divisioona" }
	}
}

TST_MOT_01 = {
	name = "Motorized Divisions"
	division_types = { "motorized" }
	link_numbering_with = { TST_INF_01 }
	fallback_name = "%d. Moottoroitu Divisioona"
	ordered = {
		1 = { "1. Moottoroitu" }
	}
}
"@ -replace "`r`n", "`n"
    }

    It "Splits strings on ';', keeps array items whole and maps the CLI names" {
        $op = ConvertTo-NamelistEditOp ([PSCustomObject]@{ group = 'INF_01, CAV_01'; add = 'A; B'; remove = @('C; D', '7'); addType = 'motorized'; removeAll = $true; canUse = 'has_government = fascism' })
        $op.Groups | Should -Be @('INF_01', 'CAV_01')
        $op.Add | Should -Be @('A', 'B')
        $op.Remove | Should -Be @('C; D', '7')
        $op.AddTypes | Should -Be @('motorized')
        $op.RemoveAll | Should -BeTrue
        $op.ClearOrdered | Should -BeFalse
        $op.CanUse | Should -Be 'has_government = fascism'
    }

    It "Accepts a hashtable and rejects a misspelled key" {
        (ConvertTo-NamelistEditOp @{ group = 'INF_01'; selector = 'Rifle Divisions' }).Selector | Should -Be 'Rifle Divisions'
        { ConvertTo-NamelistEditOp ([PSCustomObject]@{ group = 'INF_01'; adds = 'A' }) } | Should -Throw "*'adds'*"
    }

    It "Applies operations in order, including edits to a group added earlier in the batch" {
        $ops = @(
            (ConvertTo-NamelistEditOp @{ group = 'INF_01'; rename = '1. Divisioona=1. Divisioona ''Karhu'''; add = @('3. Divisioona') }),
            (ConvertTo-NamelistEditOp @{ addGroup = $true; group = 'CAV_01'; selector = 'Cavalry Brigades'; addType = 'cavalry'; fallback = '%d. Ratsuprikaati'; after = 'INF_01' }),
            (ConvertTo-NamelistEditOp @{ group = 'CAV_01'; canUse = 'has_government = neutrality' }),
            (ConvertTo-NamelistEditOp @{ group = 'MOT_01'; removeGroup = $true })
        )
        $r = Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops $ops
        $data = Get-NamelistAuditData -Text $r.Text
        @($data.Groups | ForEach-Object { $_.Tag }) | Should -Be @('TST_INF_01', 'TST_CAV_01')
        ($data.Groups | Where-Object { $_.Tag -eq 'TST_INF_01' }).Entries | Should -Be @("1. Divisioona 'Karhu'", '2. Divisioona', '3. Divisioona')
        ($data.Groups | Where-Object { $_.Tag -eq 'TST_CAV_01' }).CanUse | Should -Be 'has_government = neutrality'
        $r.Summaries.Count | Should -Be 4
        $r.Summaries[0] | Should -Match '^Edited TST_INF_01: \+1 -0 ~1'
        $r.Summaries[1] | Should -Match '^Added TST_CAV_01'
        $r.Summaries[3] | Should -Be 'Removed TST_MOT_01'
        $r.Edited | Should -Be @('TST_INF_01', 'TST_CAV_01')
    }

    It "Names the failing operation and applies nothing from a failed batch" {
        $ops = @(
            (ConvertTo-NamelistEditOp @{ group = 'INF_01'; add = 'New Name' }),
            (ConvertTo-NamelistEditOp @{ group = 'INF_01'; remove = 'Missing Name' })
        )
        { Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops $ops } | Should -Throw '*op 2*Missing Name*'
    }

    It "Refuses to remove a group that another group links to, an unknown group and an empty operation" {
        { Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops @(ConvertTo-NamelistEditOp @{ group = 'INF_01'; removeGroup = $true }) } | Should -Throw '*link_numbering_with*'
        { Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops @(ConvertTo-NamelistEditOp @{ group = 'NOPE_01'; add = 'A' }) } | Should -Throw '*NOPE_01*not found*'
        { Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops @(ConvertTo-NamelistEditOp @{ group = 'INF_01' }) } | Should -Throw '*Nothing to do*'
    }

    It "Refuses a new group whose tag another file of the mod already uses" {
        $op = ConvertTo-NamelistEditOp @{ addGroup = $true; group = 'MIL_01'; selector = 'Militia'; addType = 'militia'; fallback = '%d. Miliisi' }
        { Invoke-NamelistEditOps -Text $script:OpsBase -Tag 'TST' -Ops @($op) -TakenTags @('TST_MIL_01') } | Should -Throw '*TST_MIL_01*another namelist file*'
    }
}

Describe "build.ps1 Helper: Get-WorkshopDocStats" {
    BeforeAll {
        $script:GuideFor = { param([string]$Block, [string]$Nation = 'Testland')
            @"
| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| ``INEX_TST_names_divisions.txt`` | $Nation | ``TST`` | Included |

``````bbcode
Intro line.

[h1]Included nations:[/h1]

$Block

[b]Otherland[/b]
- Other bullet ([i]X[/i], [i]Y[/i])
- Second bullet
``````
"@
        }
    }

    It "Counts the bullets and italic examples of the nation's own block" {
        $s = Get-WorkshopDocStats -GuideText (& $script:GuideFor "[b]Testland[/b]`n- Infantry ([i]1. Divisioona[/i], [i]2. Divisioona[/i])`n- Cavalry ([i]Ratsuprikaati[/i])") -Key 'TST'
        $s.Nation | Should -Be 'Testland'
        $s.Bullets | Should -Be 2
        $s.Examples | Should -Be 3
        $s.Emojis | Should -Be 0
        $s.Length | Should -BeGreaterThan 100
        $s.Warnings.Count | Should -Be 0
    }

    It "Reads the nation from the cross-reference row without its parenthetical or alias" {
        (Get-WorkshopDocStats -GuideText (& $script:GuideFor "[b]Testland[/b]`n- A ([i]x[/i], [i]y[/i])`n- B" 'Testland (Extra)') -Key 'TST').Bullets | Should -Be 2
        (Get-WorkshopDocStats -GuideText (& $script:GuideFor "[b]Testland[/b]`n- A ([i]x[/i], [i]y[/i])`n- B" 'Testland / Testia') -Key 'TST').Bullets | Should -Be 2
    }

    It "Warns about a thin block, a missing block and emojis" {
        $thin = Get-WorkshopDocStats -GuideText (& $script:GuideFor "[b]Testland[/b]`n- Infantry ([i]1. Divisioona[/i])") -Key 'TST'
        ($thin.Warnings -join '|') | Should -Match '1 bullet'
        ($thin.Warnings -join '|') | Should -Match '1 \[i\] example'
        $missing = Get-WorkshopDocStats -GuideText (& $script:GuideFor '[b]Elsewhere[/b]') -Key 'TST'
        ($missing.Warnings -join '|') | Should -Match 'no \[b\]Testland\[/b\] block'
        $emoji = Get-WorkshopDocStats -GuideText (& $script:GuideFor "[b]Testland[/b]`n- A $([char]::ConvertFromUtf32(0x1F600)) ([i]x[/i], [i]y[/i])`n- B") -Key 'TST'
        $emoji.Emojis | Should -Be 1
        ($emoji.Warnings -join '|') | Should -Match 'emoji'
    }

    It "Warns when the description passes 17,000 characters" {
        $long = Get-WorkshopDocStats -GuideText (& $script:GuideFor ("[b]Testland[/b]`n- A ([i]x[/i], [i]y[/i])`n- " + ('B' * 17000))) -Key 'TST'
        ($long.Warnings -join '|') | Should -Match '17000'
    }
}

Describe "build.ps1 CLI on a fixture repo: -Batch, -AddGroup, quiet -EditNames, -Audit details, -Check" {
    BeforeAll {
        $script:CliDir = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_cli_" + [System.Guid]::NewGuid().ToString("N"))
        $script:CliNamelistDir = Join-Path $script:CliDir "common\units\names_divisions"
        New-Item -ItemType Directory -Path $script:CliNamelistDir -Force | Out-Null
        $script:CliBuild = Join-Path $script:CliDir 'build.ps1'
        $script:CliFile = Join-Path $script:CliNamelistDir 'INEX_TST_names_divisions.txt'
        $script:Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        Copy-Item $script:BuildScriptPath $script:CliBuild
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'descriptor.mod'), "version=`"1.0.0`"`nname=`"Test Mod`"`nsupported_version=`"1.19.*`"`n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllBytes((Join-Path $script:CliDir 'thumbnail.png'), [byte[]]@(0x89, 0x50, 0x4E, 0x47))
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'README.md'), "| Tag | Nation | Source File |`n| :--- | :--- | :--- |`n| ``TST`` | Testland | ``INEX_TST_names_divisions.txt`` |`n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'WORKSHOP_DESCRIPTION_GUIDELINES.md'), "| ``INEX_TST_names_divisions.txt`` | Testland | ``TST`` | Included |`n`n``````bbcode`n[h1]Included nations:[/h1]`n`n[b]Testland[/b]`n- Infantry ([i]1. Divisioona 'Karhu'[/i])`n```````n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllText((Join-Path $script:CliNamelistDir 'INEX_TST_EXTRA_names_divisions.txt'), "TST_MIL_01 = {`r`n`tname = `"Militia`"`r`n`tfor_countries = { TST }`r`n`tcan_use = { has_government = fascism }`r`n`tdivision_types = { `"militia`" }`r`n`tfallback_name = `"%d. Miliisi`"`r`n}`r`n", $script:Utf8NoBom)

        $script:CliNamelist = @"
# Test header

TST_INF_01 =
{
	name = "Infantry Divisions"

	for_countries = { TST }

	can_use = { always = yes }

	division_types = { "infantry" }

	fallback_name = "%d. Divisioona"

	ordered =
	{
		1 = { "1. Divisioona 'Karhu'" }
		2 = { "2. Divisioona 'Susi'" }
		3 = { "Alpha Division" }
		4 = { "Alpha Division" }
	}
}

TST_CAV_01 =
{
	name = "Cavalry Brigades"

	for_countries = { TST }

	division_types = { "cavalry" }

	fallback_name = "%d. Ratsuprikaati"

	ordered =
	{
		1 = { "Uudenmaan Ratsuprikaati" }
	}
}
"@ -replace "`r`n", "`n" -replace "`n", "`r`n"
        function Reset-CliNamelist { [System.IO.File]::WriteAllText($script:CliFile, $script:CliNamelist + "`r`n", $script:Utf8NoBom) }
        function Invoke-CliBuild {
            $script:CliOutput = (& powershell -NoProfile -File $script:CliBuild @args 2>&1 | Out-String)
            $script:CliExit = $LASTEXITCODE
        }
        Reset-CliNamelist

        # -DiffNames, -AuditPlan and -Check compare against a git revision, so the fixture is its own repository
        $prevEap = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        & git -C $script:CliDir init -q 2>$null | Out-Null
        & git -C $script:CliDir add -A 2>$null | Out-Null
        & git -C $script:CliDir -c user.name=inex -c user.email=inex@example.invalid -c core.autocrlf=false commit -q -m fixture 2>$null | Out-Null
        $ErrorActionPreference = $prevEap

        $e = [char]0x00E8
        $script:CliEliteName = "1${e}re Division d'Elite"
        $script:CliBatchPath = Join-Path $script:CliDir 'ops.json'
        $batch = @"
[
  { "group": "INF_01", "rename": ["1. Divisioona 'Karhu'=1. Divisioona 'Ilves'"], "remove": "4", "add": ["5. Divisioona 'Hirvi'", "$($script:CliEliteName)"] },
  { "addGroup": true, "group": "MOT_01", "selector": "Motorized Divisions", "addType": "motorized; mechanized", "fallback": "%d. Moottoroitu Divisioona",
    "link": "INF_01", "after": "INF_01", "comment": "Shares numbering with TST_INF_01.", "add": ["1. Moottoroitu Divisioona 'Salama'"] },
  { "group": "MOT_01", "add": "2. Moottoroitu Divisioona 'Ukkonen'" },
  { "group": "CAV_01", "canUse": "has_government = neutrality" }
]
"@
        [System.IO.File]::WriteAllText($script:CliBatchPath, $batch, $script:Utf8NoBom)
    }

    AfterAll {
        if (Test-Path $script:CliDir) { Remove-Item -Recurse -Force $script:CliDir }
    }

    It "Round-trips a batch with a new group: one line per group, CRLF, no BOM, and the result validates" {
        Reset-CliNamelist
        Invoke-CliBuild -EditNames TST -Batch $script:CliBatchPath
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $lines = @($script:CliOutput -split '\r?\n' | Where-Object { $_.Trim() })
        $lines.Count | Should -Be 4
        $lines[0] | Should -Match '^Edited TST_INF_01: \+2 -1 ~1'
        $lines[1] | Should -Match '^Added TST_MOT_01'
        $lines[2] | Should -Match '^Edited TST_MOT_01: \+1'
        $lines[3] | Should -Match '^Edited TST_CAV_01:.*CanUse'

        $bytes = [System.IO.File]::ReadAllBytes($script:CliFile)
        $bytes[0] | Should -Not -Be 0xEF
        $text = [System.Text.Encoding]::UTF8.GetString($bytes)
        ([regex]::Matches($text, "(?<!`r)`n")).Count | Should -Be 0
        $text | Should -Not -Match "`r`r"
        $text.Contains("{ `"$($script:CliEliteName)`" }") | Should -BeTrue
        $text | Should -Match '(?s)TST_INF_01 =.*# Shares numbering with TST_INF_01\.\r\nTST_MOT_01 = .*link_numbering_with = \{ TST_INF_01 \}.*Ukkonen.*TST_CAV_01 =.*for_countries = \{ TST \}\r\n\r\n\tcan_use = \{ has_government = neutrality \}\r\n\r\n\tdivision_types'

        Invoke-CliBuild -ValidateOnly
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
    }

    It "Leaves the file untouched when one operation of a batch fails" {
        Reset-CliNamelist
        $before = [System.IO.File]::ReadAllBytes($script:CliFile)
        $bad = Join-Path $script:CliDir 'bad.json'
        [System.IO.File]::WriteAllText($bad, '[ { "group": "INF_01", "add": "New Name" }, { "group": "CAV_01", "remove": "Missing Name" } ]', $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $bad
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'op 2'
        $script:CliOutput | Should -Match 'Missing Name'
        [System.IO.File]::ReadAllBytes($script:CliFile) | Should -Be $before
    }

    It "Rejects a batch file that is missing or is not JSON" {
        { Read-NamelistEditBatch -Path (Join-Path $script:CliDir 'nope.json') } | Should -Throw '*not found*'
        $notJson = Join-Path $script:CliDir 'notjson.json'
        [System.IO.File]::WriteAllText($notJson, '[ { "group": ', $script:Utf8NoBom)
        { Read-NamelistEditBatch -Path $notJson } | Should -Throw '*not valid JSON*'
        $ops = Read-NamelistEditBatch -Path $script:CliBatchPath
        $ops.Count | Should -Be 4
        $ops[1].AddGroup | Should -BeTrue
    }

    It "Rejects -Batch combined with other edit switches" {
        Invoke-CliBuild -EditNames TST -Batch $script:CliBatchPath -Add 'X'
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match '-Batch cannot be combined with -Add'
    }

    It "Creates a group with -AddGroup and refuses a tag used in another file of the mod" {
        Reset-CliNamelist
        Invoke-CliBuild -EditNames TST -AddGroup -Group MNT_01 -Selector 'Mountain Brigades' -AddType 'mountaineers' -Fallback '%d. Vuoristoprikaati' -After CAV_01 -Add "1. Vuoristoprikaati 'Halti'"
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Added TST_MNT_01'
        $text = [System.IO.File]::ReadAllText($script:CliFile, [System.Text.Encoding]::UTF8)
        $text | Should -Match '(?s)TST_CAV_01 =.*TST_MNT_01 = \r\n\{\r\n\tname = "Mountain Brigades".*Halti'
        $before = [System.IO.File]::ReadAllBytes($script:CliFile)
        Invoke-CliBuild -EditNames TST -AddGroup -Group MIL_01 -Selector 'Militia' -AddType 'militia' -Fallback '%d. Miliisi'
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'TST_MIL_01'
        [System.IO.File]::ReadAllBytes($script:CliFile) | Should -Be $before
    }

    It "Prints only the summary line from -EditNames unless -Verbose is given" {
        Reset-CliNamelist
        Invoke-CliBuild -EditNames TST -Group CAV_01 -Add 'Karjalan Ratsuprikaati'
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        @($script:CliOutput -split '\r?\n' | Where-Object { $_.Trim() }).Count | Should -Be 1
        $script:CliOutput | Should -Not -Match 'Uudenmaan'
        # -Quiet stays accepted for older command lines
        Invoke-CliBuild -EditNames TST -Group CAV_01 -Add 'Savon Ratsuprikaati' -Verbose -Quiet
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'TST_CAV_01 \(3/\d+\) "Cavalry Brigades": Uudenmaan Ratsuprikaati; Karjalan Ratsuprikaati; Savon Ratsuprikaati'
    }

    It "Lists the entries behind a flag, the workshop block stats and a wrong French ordinal in -Audit" {
        # Regression test for the ordinal: build.ps1 has no BOM, so Windows PowerShell 5.1 reads a non-ASCII literal
        # in it as ANSI. The accented pattern never matched outside the tests, which load the function text as UTF-8.
        $withOrdinal = $script:CliNamelist -replace '(1 = \{ "Uudenmaan Ratsuprikaati" \})', "`$1`r`n`t`t5 = { `"%d$([char]0x00E8)re Brigade`" }"
        [System.IO.File]::WriteAllText($script:CliFile, $withOrdinal + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Audit TST
        $script:CliOutput | Should -Match 'DUPLICATE_NAME: Alpha Division'
        $script:CliOutput | Should -Match 'Workshop: \[b\]Testland\[/b\] 1 bullet\(s\), 1 \[i\] example\(s\); description \d+/17000 chars'
        $script:CliOutput | Should -Match '\[WARN\] Docs: .*1 bullet'
        $script:CliOutput | Should -Match 'ORDINAL_MISMATCH'
    }

    It "Summarizes validation, tests, audit, plan and diff in at most 15 lines with -Check" {
        $withAdded = $script:CliNamelist -replace '(1 = \{ "Uudenmaan Ratsuprikaati" \})', "`$1`r`n`t`t2 = { `"Karjalan Ratsuprikaati`" }"
        [System.IO.File]::WriteAllText($script:CliFile, $withAdded + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Check TST
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $lines = @($script:CliOutput -split '\r?\n' | Where-Object { $_.Trim() })
        $lines.Count | Should -BeLessOrEqual 15
        $script:CliOutput | Should -Match 'Validate: OK'
        $script:CliOutput | Should -Match 'Tests: skipped'
        $script:CliOutput | Should -Match 'AUDIT SUMMARY TST: GROUPS=2 AUTHORED=\d+/6 FLAGS=\d+'
        $script:CliOutput | Should -Match 'Flags: .*DUPLICATE_NAME'
        $script:CliOutput | Should -Match '\[WARN\] Docs: '
        $script:CliOutput | Should -Match 'Plan: no audit plan in progress'
        $script:CliOutput | Should -Match 'Diff vs HEAD: 1 group\(s\) changed, \+1 -0 name\(s\)'
        $script:CliOutput | Should -Not -Match 'Uudenmaan'
    }

    It "Refreshes an audit plan that is in progress and reports its open TODO sections with -Check" {
        Reset-CliNamelist
        Invoke-CliBuild -AuditPlan TST
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $withAdded = $script:CliNamelist -replace '(1 = \{ "Uudenmaan Ratsuprikaati" \})', "`$1`r`n`t`t2 = { `"Karjalan Ratsuprikaati`" }"
        [System.IO.File]::WriteAllText($script:CliFile, $withAdded + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Check TST
        $script:CliOutput | Should -Match 'Refreshed change table in docs/superpowers/plans/\d{4}-\d{2}-\d{2}-testland-audit\.md: 1 changed group\(s\) vs HEAD; \d+ TODO section\(s\) left'
        $plan = Get-ChildItem (Join-Path $script:CliDir 'docs\superpowers\plans') -Filter '*-testland-audit.md' | Select-Object -First 1
        [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8) | Should -Match '\| CAV_01 \| 1 -> 2 \| Karjalan Ratsuprikaati \|'

        # Once the audit is committed the diff is empty; a refresh must not wipe the recorded table
        Reset-CliNamelist
        Invoke-CliBuild -AuditPlan TST
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Kept the change table'
        [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8) | Should -Match '\| CAV_01 \| 1 -> 2 \| Karjalan Ratsuprikaati \|'
        Remove-Item -Recurse -Force (Join-Path $script:CliDir 'docs')
    }

    It "Exits 1 from -Check and prints the validation error in full" {
        [System.IO.File]::WriteAllText($script:CliFile, ($script:CliNamelist -replace '2 = \{ "2\. Divisioona ''Susi''" \}', '1 = { "2. Divisioona ''Susi''" }') + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Check TST
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'Validate: FAILED'
        $script:CliOutput | Should -Match '\[ERROR\] INEX_TST_names_divisions\.txt: Duplicate index 1'
        Reset-CliNamelist
    }

    It "Applies the json batch blocks of a plan file in document order and ignores other fences" {
        Reset-CliNamelist
        $fence = '```'
        $plan = @"
# Testland (TST) Namelist Audit

Status: READY

## Decisions
Example of the format, not an operation:
${fence}json
{ "group": "CAV_01", "add": "Never applied" }
${fence}

## Edit batch
${fence}json batch
{ "group": "INF_01", "add": ["5. Divisioona 'Hirvi'"] }
${fence}

${fence}json batch
[
  { "addGroup": true, "group": "MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d. Moottoroitu Divisioona", "link": "INF_01",
    "add": ["1. Moottoroitu Divisioona 'Salama'"] },
  { "group": "MOT_01", "canUse": "has_government = neutrality" }
]
${fence}
"@ -replace "`r`n", "`n" -replace "`n", "`r`n"
        $planPath = Join-Path $script:CliDir 'plan.md'
        [System.IO.File]::WriteAllText($planPath, $plan, $script:Utf8NoBom)

        $ops = Read-NamelistEditBatch -Path $planPath
        $ops.Count | Should -Be 3
        $ops[0].Groups | Should -Be @('INF_01')
        $ops[1].AddGroup | Should -BeTrue

        Invoke-CliBuild -EditNames TST -Batch $planPath
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $text = [System.IO.File]::ReadAllText($script:CliFile, [System.Text.Encoding]::UTF8)
        $text | Should -Match 'Hirvi'
        $text | Should -Match 'Salama'
        $text | Should -Not -Match 'Never applied'
    }

    It "Rejects a plan without batch blocks and names the block that is not JSON" {
        $fence = '```'
        $empty = Join-Path $script:CliDir 'empty.md'
        [System.IO.File]::WriteAllText($empty, "# Plan`n`n${fence}json`n{ `"group`": `"INF_01`", `"add`": `"A`" }`n${fence}`n", $script:Utf8NoBom)
        { Read-NamelistEditBatch -Path $empty } | Should -Throw '*no*json batch*'
        $broken = Join-Path $script:CliDir 'broken.md'
        [System.IO.File]::WriteAllText($broken, "${fence}json batch`n{ `"group`": `"INF_01`", `"add`": `"A`" }`n${fence}`n`n${fence}json batch`n{ `"group`": `n${fence}`n", $script:Utf8NoBom)
        { Read-NamelistEditBatch -Path $broken } | Should -Throw '*block 2*not valid JSON*'
    }

    It "Leaves the file untouched with -DryRun and warns about a plan that is not ready" {
        Reset-CliNamelist
        $before = [System.IO.File]::ReadAllBytes($script:CliFile)
        $fence = '```'
        $planPath = Join-Path $script:CliDir 'draft.md'
        $plan = "# Plan`n`nStatus: PLANNING`n`n## Decisions`n<!-- TODO: fill -->`n`n## Review`n<!-- TODO(implementer): self-check -->`n`n## Edit batch`n${fence}json batch`n{ `"group`": `"CAV_01`", `"add`": [`"Karjalan Ratsuprikaati`"] }`n${fence}`n"
        [System.IO.File]::WriteAllText($planPath, $plan, $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $planPath -DryRun
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Edited TST_CAV_01: \+1'
        $script:CliOutput | Should -Match 'Dry run OK: 1 operation\(s\); the file would hold 2 group\(s\), 6 name\(s\)\. Nothing written\.'
        $script:CliOutput | Should -Match '\[WARN\] Plan: Status is still PLANNING'
        $script:CliOutput | Should -Match '\[WARN\] Plan: 1 planner TODO section\(s\) left unfilled'
        [System.IO.File]::ReadAllBytes($script:CliFile) | Should -Be $before

        [System.IO.File]::WriteAllText($planPath, ($plan -replace 'Status: PLANNING', 'Status: READY' -replace '<!-- TODO: fill -->', 'Decided.'), $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $planPath -DryRun
        $script:CliOutput | Should -Not -Match '\[WARN\]'
    }

    It "Creates a new nation's file from a newFile operation, and refuses it when the file exists or is not first" {
        $newFile = Join-Path $script:CliNamelistDir 'INEX_NEW_names_divisions.txt'
        $json = Join-Path $script:CliDir 'new.json'
        [System.IO.File]::WriteAllText($json, '[ { "newFile": true, "header": "Division names for Newland (NEW).\nImmersive Namelists Expanded (INEX)" }, { "addGroup": true, "group": "INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. Division", "add": ["1. Division ''Alpha''"] } ]', $script:Utf8NoBom)

        Invoke-CliBuild -EditNames NEW -Batch $json -DryRun
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Dry run OK: 2 operation\(s\); the file would hold 1 group\(s\), 1 name\(s\)'
        (Test-Path $newFile) | Should -BeFalse

        Invoke-CliBuild -EditNames NEW -Batch $json
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Created INEX_NEW_names_divisions\.txt'
        $bytes = [System.IO.File]::ReadAllBytes($newFile)
        $bytes[0] | Should -Not -Be 0xEF
        $text = [System.Text.Encoding]::UTF8.GetString($bytes)
        $text | Should -Match '(?s)^# Division names for Newland \(NEW\)\.\r?\n# Immersive Namelists Expanded \(INEX\)\r?\n\r?\nNEW_INF_01 = .*for_countries = \{ NEW \}.*Alpha'

        $before = [System.IO.File]::ReadAllBytes($newFile)
        Invoke-CliBuild -EditNames NEW -Batch $json
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'already exists'
        [System.IO.File]::ReadAllBytes($newFile) | Should -Be $before
        Remove-Item $newFile

        $ops = @(
            (ConvertTo-NamelistEditOp @{ group = 'INF_01'; add = 'A' }),
            (ConvertTo-NamelistEditOp @{ newFile = $true; header = 'H' })
        )
        { Invoke-NamelistEditOps -Text $script:CliNamelist -Tag 'TST' -Ops $ops } | Should -Throw '*must be the first operation*'
        { Invoke-NamelistEditOps -Text '' -Tag 'TST' -Ops @(ConvertTo-NamelistEditOp @{ newFile = $true }) } | Should -Throw '*needs "header"*'
    }
}
