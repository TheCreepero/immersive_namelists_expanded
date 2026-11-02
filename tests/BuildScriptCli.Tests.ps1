BeforeAll {
    . (Join-Path $PSScriptRoot 'BuildScriptSetup.ps1')
}

Describe "build.ps1 CLI on a fixture repo: -Batch, -AddGroup, quiet -EditNames, -Audit details, -Check" {
    BeforeAll {
        $script:CliDir = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_cli_" + [System.Guid]::NewGuid().ToString("N"))
        $script:CliNamelistDir = Join-Path $script:CliDir "common\units\names_divisions"
        New-Item -ItemType Directory -Path $script:CliNamelistDir -Force | Out-Null
        $script:CliBuild = Join-Path $script:CliDir 'build.ps1'
        $script:CliFile = Join-Path $script:CliNamelistDir 'zz_INEX_TST_names_divisions.txt'
        $script:Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        Copy-Item $script:BuildScriptPath $script:CliBuild
        New-Item -ItemType Directory -Path (Join-Path $script:CliDir 'tools') -Force | Out-Null
        Copy-Item (Join-Path $script:RepoRoot 'tools\HoiModBuild.ps1') (Join-Path $script:CliDir 'tools\HoiModBuild.ps1')
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'descriptor.mod'), "version=`"1.0.0`"`nname=`"Test Mod`"`nsupported_version=`"1.19.*`"`n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllBytes((Join-Path $script:CliDir 'thumbnail.png'), [byte[]]@(0x89, 0x50, 0x4E, 0x47))
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'README.md'), "| Tag | Nation | Source File |`n| :--- | :--- | :--- |`n| ``TST`` | Testland | ``zz_INEX_TST_names_divisions.txt`` |`n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllText((Join-Path $script:CliDir 'WORKSHOP_DESCRIPTION_GUIDELINES.md'), "| ``zz_INEX_TST_names_divisions.txt`` | Testland | ``TST`` | Included |`n`n``````bbcode`n[h1]Included nations:[/h1]`n`n[b]Testland[/b]`n- Infantry ([i]1. Divisioona 'Karhu'[/i])`n```````n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllText((Join-Path $script:CliNamelistDir 'zz_INEX_TST_EXTRA_names_divisions.txt'), "TST_MIL_01 = {`r`n`tname = `"Militia`"`r`n`tfor_countries = { TST }`r`n`tcan_use = { has_government = fascism }`r`n`tdivision_types = { `"militia`" }`r`n`tfallback_name = `"%d. Miliisi`"`r`n}`r`n", $script:Utf8NoBom)

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
            $global:LASTEXITCODE = 0
            try {
                $script:CliOutput = ((@(& $script:CliBuild @args *>&1 | ForEach-Object { "$_" }) -join "`r`n") + "`r`n")
                $script:CliExit = $LASTEXITCODE
            } catch {
                $script:CliOutput = ($_ | Out-String)
                $script:CliExit = 1
            }
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

    It "Fails -ClearOrdered on a group that is already fallback-only, leaving the file untouched" {
        # On the fixture: a real plain variant may gain an ordered block (written over vanilla's merged keys),
        # and -ClearOrdered would then succeed on the repository file
        $extra = Join-Path $script:CliNamelistDir 'zz_INEX_TST_EXTRA_names_divisions.txt'
        $before = [System.IO.File]::ReadAllBytes($extra)
        Invoke-CliBuild -EditNames TST_EXTRA -Group TST_MIL_01 -ClearOrdered
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'TST_MIL_01'
        [System.IO.File]::ReadAllBytes($extra) | Should -Be $before
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
        $script:CliOutput | Should -Match 'Workshop: \[b\]Testland\[/b\] 1 bullet\(s\), 1 \[i\] example\(s\), \d+/450 chars; description \d+/17000 chars'
        $script:CliOutput | Should -Match '\[WARN\] Docs: .*1 bullet'
        $script:CliOutput | Should -Match 'ORDINAL_MISMATCH'
    }

    It "Lists honorifics that another file of the nation already uses in -Audit" {
        Reset-CliNamelist
        $extra = Join-Path $script:CliNamelistDir 'zz_INEX_TST_EXTRA_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($extra, [System.Text.Encoding]::UTF8)
        try {
            [System.IO.File]::WriteAllText($extra, ($before -replace '(fallback_name = "%d\. Miliisi")', "`$1`r`n`tordered = {`r`n`t`t3 = { `"3. Miliisi 'Karhu'`" }`r`n`t}"), $script:Utf8NoBom)
            Invoke-CliBuild -Audit TST
            $script:CliOutput | Should -Match 'Identities shared with other files of TST \(TST_EXTRA\)'
            $script:CliOutput | Should -Match "'Karhu': TST_INF_01, TST_MIL_01"
        } finally {
            [System.IO.File]::WriteAllText($extra, $before, $script:Utf8NoBom)
        }
    }

    It "Shows in -Audit how an audited group merges with the game's own list of the same tag" {
        Reset-CliNamelist
        $gameNamelistDir = Join-Path $TestDrive 'cli-game\common\units\names_divisions'
        New-Item -ItemType Directory -Path $gameNamelistDir -Force | Out-Null
        [System.IO.File]::WriteAllText((Join-Path $gameNamelistDir 'TST_names_divisions.txt'), "TST_INF_01 = {`r`n`tname = `"Vanilla Infantry`"`r`n`tfor_countries = { TST }`r`n`tdivision_types = { `"infantry`" }`r`n`tordered = {`r`n`t`t1 = { `"1. Vanilla`" }`r`n`t}`r`n}`r`n", $script:Utf8NoBom)
        [System.IO.File]::WriteAllText((Join-Path $gameNamelistDir 'XYZ_names_divisions.txt'), "XYZ_INF_01 = {`r`n`tname = `"Elsewhere`"`r`n`tfor_countries = { XYZ }`r`n`tordered = { 1 = { `"A`" } }`r`n}`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Audit TST -Hoi4InstallDir (Join-Path $TestDrive 'cli-game')
        $script:CliOutput | Should -Match 'Merged: .*\(TST_names_divisions\.txt, zz_INEX_TST_names_divisions\.txt\)'
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
        $script:CliOutput | Should -Match 'Refreshed change table in docs/plans/\d{4}-\d{2}-\d{2}-testland-audit\.md: 1 changed group\(s\) vs HEAD; \d+ TODO section\(s\) left'
        $plan = Get-ChildItem (Join-Path $script:CliDir 'docs\plans') -Filter '*-testland-audit.md' | Select-Object -First 1
        [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8) | Should -Match '\| CAV_01 \| 1 -> 2 \| Karjalan Ratsuprikaati \|'

        # Once the audit is committed the diff is empty; a refresh must not wipe the recorded table
        Reset-CliNamelist
        Invoke-CliBuild -AuditPlan TST
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Kept the change table'
        [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8) | Should -Match '\| CAV_01 \| 1 -> 2 \| Karjalan Ratsuprikaati \|'
        Remove-Item -Recurse -Force (Join-Path $script:CliDir 'docs')
    }

    It "Leaves the change table alone while another plan for the nation is live, and names it" {
        Reset-CliNamelist
        Invoke-CliBuild -AuditPlan TST
        $plan = Get-ChildItem (Join-Path $script:CliDir 'docs\plans') -Filter '*-testland-audit.md' | Select-Object -First 1
        $before = [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8)
        $plansDir = Join-Path $script:CliDir 'docs\plans'
        [System.IO.File]::WriteAllText((Join-Path $plansDir '2026-10-20-testland-namelist.md'), "# Testland`n`nStatus: READY`n", $script:Utf8NoBom)
        # A finished plan and the archive do not count
        [System.IO.File]::WriteAllText((Join-Path $plansDir '2026-10-01-testland-namelist.md'), "# Testland`n`nStatus: DONE`n", $script:Utf8NoBom)
        New-Item -ItemType Directory -Path (Join-Path $plansDir 'archive') -Force | Out-Null
        [System.IO.File]::WriteAllText((Join-Path $plansDir 'archive\2026-09-01-testland-audit.md'), "# Testland`n`nStatus: DONE`n", $script:Utf8NoBom)
        $withAdded = $script:CliNamelist -replace '(1 = \{ "Uudenmaan Ratsuprikaati" \})', "`$1`r`n`t`t2 = { `"Karjalan Ratsuprikaati`" }"
        [System.IO.File]::WriteAllText($script:CliFile, $withAdded + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Check TST
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match '\[WARN\] Plan: 2026-10-20-testland-namelist\.md is also live for TST; the change table would list its groups too\. Ship it first'
        [System.IO.File]::ReadAllText($plan.FullName, [System.Text.Encoding]::UTF8) | Should -Be $before
        Remove-Item -Recurse -Force (Join-Path $script:CliDir 'docs')
        Reset-CliNamelist
    }

    It "Exits 1 from -Check and prints the validation error in full" {
        [System.IO.File]::WriteAllText($script:CliFile, ($script:CliNamelist -replace '2 = \{ "2\. Divisioona ''Susi''" \}', '1 = { "2. Divisioona ''Susi''" }') + "`r`n", $script:Utf8NoBom)
        Invoke-CliBuild -Check TST
        $script:CliExit | Should -Be 1
        $script:CliOutput | Should -Match 'Validate: FAILED'
        $script:CliOutput | Should -Match '\[ERROR\] zz_INEX_TST_names_divisions\.txt: Duplicate index 1'
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
        # The flags the batch leaves, so the planner can fill "Kept on judgment" without a rehearsal
        $script:CliOutput | Should -Match 'AUDIT SUMMARY TST: GROUPS=2 AUTHORED=\d+/6 FLAGS=\d+'
        $script:CliOutput | Should -Match 'Flags: .*DUPLICATE_NAME x1'
        $script:CliOutput | Should -Match '\[WARN\] Plan: Status is still PLANNING'
        $script:CliOutput | Should -Match '\[WARN\] Plan: 1 planner TODO section\(s\) left unfilled'
        [System.IO.File]::ReadAllBytes($script:CliFile) | Should -Be $before

        [System.IO.File]::WriteAllText($planPath, ($plan -replace 'Status: PLANNING', 'Status: READY' -replace '<!-- TODO: fill -->', 'Decided.'), $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $planPath -DryRun
        $script:CliOutput | Should -Not -Match '\[WARN\]'
    }

    It "Creates a new nation's file from a newFile operation, and refuses it when the file exists or is not first" {
        $newFile = Join-Path $script:CliNamelistDir 'zz_INEX_NEW_names_divisions.txt'
        $json = Join-Path $script:CliDir 'new.json'
        [System.IO.File]::WriteAllText($json, '[ { "newFile": true, "header": "Division names for Newland (NEW).\nImmersive Namelists Expanded (INEX)" }, { "addGroup": true, "group": "INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. Division", "add": ["1. Division ''Alpha''"] } ]', $script:Utf8NoBom)

        Invoke-CliBuild -EditNames NEW -Batch $json -DryRun
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Dry run OK: 2 operation\(s\); the file would hold 1 group\(s\), 1 name\(s\)'
        (Test-Path $newFile) | Should -BeFalse

        Invoke-CliBuild -EditNames NEW -Batch $json
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Created zz_INEX_NEW_names_divisions\.txt'
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

    It "Re-authors an existing file in one batch and warns only about tags that are gone at its end" {
        Reset-CliNamelist
        $json = Join-Path $script:CliDir 'reauthor.json'
        [System.IO.File]::WriteAllText($json, '[ { "newFile": true, "replace": true, "header": "Testland (TST)" }, { "addGroup": true, "group": "INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. Divisioona", "add": ["1. Divisioona ''Karhu''"] } ]', $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $json
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Match 'Started zz_INEX_TST_names_divisions\.txt afresh'
        $script:CliOutput | Should -Match '\[WARN\] Removed group tags TST_CAV_01:'
        $script:CliOutput | Should -Not -Match 'Removed group tags[^\r\n]*TST_INF_01'
        $text = [System.IO.File]::ReadAllText($script:CliFile, [System.Text.Encoding]::UTF8)
        $text | Should -Match '^# Testland \(TST\)\r\n\r\nTST_INF_01 = '
        $text | Should -Not -Match 'Ratsuprikaati'

        Reset-CliNamelist
        [System.IO.File]::WriteAllText($json, '[ { "group": "CAV_01", "removeGroup": true }, { "addGroup": true, "group": "CAV_01", "selector": "Cavalry Brigades", "addType": "cavalry", "fallback": "%d. Ratsuprikaati" } ]', $script:Utf8NoBom)
        Invoke-CliBuild -EditNames TST -Batch $json
        $script:CliExit | Should -Be 0 -Because $script:CliOutput
        $script:CliOutput | Should -Not -Match 'Removed group tags'
        Reset-CliNamelist
    }
}
