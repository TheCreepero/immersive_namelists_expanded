BeforeAll {
    . (Join-Path $PSScriptRoot 'BuildScriptSetup.ps1')
}

Describe "build.ps1 -EditNames action and -Audit CLI flags" {
    It "Audits an implemented nation with -NamesOnly" {
        $output = Invoke-BuildInProcess -Path $script:BuildScriptPath -Parameters @{ Audit = 'LAT'; NamesOnly = $true }
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01 \(\d+/\d+\)'
        $output | Should -Not -Match 'ordered = \{'
    }

    It "Audits a single group with -Group and -NamesOnly" {
        $output = Invoke-BuildInProcess -Path $script:BuildScriptPath -Parameters @{ Audit = 'LAT'; Group = 'INF_01'; NamesOnly = $true }
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
        $path = Join-Path $script:RepoRoot 'common\units\names_divisions\zz_INEX_LAT_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $output = Invoke-BuildInProcess -Path $script:BuildScriptPath -Parameters @{ EditNames = 'LAT'; Group = 'INF_01'; Remove = 'NonExistentDivisionName' }
        $LASTEXITCODE | Should -Be 1
        $output | Should -Match 'NonExistentDivisionName'
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }
}

Describe "build.ps1 -Audit -Keys and -EditNames CLI safety" {
    It "Prints keys and collapses duplicate runs with -NamesOnly -Keys" {
        $output = Invoke-BuildInProcess -Path $script:BuildScriptPath -Parameters @{ Audit = 'LAT'; Group = 'INF_01'; NamesOnly = $true; Keys = $true }
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'LAT_INF_01 \(\d+/\d+\)'
        $output | Should -Match '(?m)\b\d+(-\d+)?='
    }

    It "Refuses -RemoveGroup while another group links to it, leaving the file untouched" {
        # FRA_INF_01 is the numbering anchor of FRA_INF_02, FRA_MOT_01, FRA_MNT_01 and FRA_GAR_01
        $path = Join-Path $script:RepoRoot 'common\units\names_divisions\zz_INEX_FRA_names_divisions.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $output = Invoke-BuildInProcess -Path $script:BuildScriptPath -Parameters @{ EditNames = 'FRA'; Group = 'INF_01'; RemoveGroup = $true }
        $LASTEXITCODE | Should -Be 1
        $output | Should -Match 'link_numbering_with'
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }
}

Describe "build.ps1: valid division_types list" {
    It "Is defined once and shared by validation and -EditNames" {
        ([regex]::Matches($script:BuildContent, "'bicycle_battalion'")).Count | Should -Be 1
        $ValidDivisionTypes | Should -Contain 'infantry'
        $ValidDivisionTypes | Should -Contain 'penal_battalion'
        $ValidDivisionTypes | Should -Not -Contain 'armor'
    }

    It "Accepts the line battalions vanilla defines and uses in its own name lists" {
        foreach ($t in 'armored_car', 'bicycle_battalion', 'artillery_brigade', 'mot_artillery_brigade', 'anti_tank_brigade', 'medium_tank_destroyer_brigade', 'modern_tank_destroyer_brigade', 'medium_sp_artillery_brigade', 'modern_sp_anti_air_brigade', 'marine_commando', 'amphibious_light_armor', 'amphibious_medium_armor', 'amphibious_heavy_armor') {
            $ValidDivisionTypes | Should -Contain $t
        }
        # Not a unit id in vanilla common/units (its ids are mot_rocket_artillery_brigade and motorized_rocket_brigade)
        $ValidDivisionTypes | Should -Not -Contain 'motorized_rocket_artillery'
        foreach ($t in 'super_heavy_armor', 'super_heavy_tank_destroyer_brigade', 'super_heavy_sp_artillery_brigade', 'super_heavy_sp_anti_air_brigade') {
            $ValidDivisionTypes | Should -Not -Contain $t -Because "'$t' is a support company in game 1.19.4 (group = support) [NAM-026]"
        }
    }

    It "Matches the line battalions of the installed game" {
        $hoi4 = Find-Hoi4Install
        if (-not $hoi4) { Set-ItResult -Skipped -Because 'Hearts of Iron IV is not installed'; return }
        $notForNameLists = @('hq_infantry', 'hq_paratrooper', 'hq_motorized', 'hq_armored_car', 'hq_light_armor', 'hq_medium_armor', 'hq_heavy_armor', 'bus', 'fake_intel_unit')
        $supportIdsAwaitingRetag = @('artillery', 'anti_air', 'anti_tank', 'rocket_artillery')
        $lineIds = @(Get-GameLineBattalionIds -Hoi4Dir $hoi4)
        $lineIds.Count | Should -BeGreaterThan 30
        @($lineIds | Where-Object { $notForNameLists -notcontains $_ -and $ValidDivisionTypes -notcontains $_ }) | Should -BeNullOrEmpty -Because 'every line battalion of the game is a valid division_types token'
        @($ValidDivisionTypes | Where-Object { $lineIds -notcontains $_ -and $supportIdsAwaitingRetag -notcontains $_ }) | Should -BeNullOrEmpty -Because 'every accepted token is a line battalion of the game'
    }

    It "Names the valid tokens when -EditNames rejects one" {
        $text = "TST_INF_01 = {`n`tname = `"Infantry`"`n`tdivision_types = { `"infantry`" }`n`tfallback_name = `"%d. Div`"`n}`n"
        { Edit-NamelistGroupText -Text $text -GroupTag 'TST_INF_01' -AddTypes @('armor') } | Should -Throw '*medium_armor*'
    }
}
