BeforeDiscovery {
    $script:ProtectCases = Import-PowerShellDataFile -Path (Join-Path $PSScriptRoot 'fixtures\ProtectHookCases.psd1')
    $script:DenyCases = $script:ProtectCases.Deny
    $script:AllowCases = $script:ProtectCases.Allow
}

Describe 'Protect-ProjectFiles hook' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:HookPath = Join-Path $script:RepoRoot '.claude\hooks\Protect-ProjectFiles.ps1'
        $script:FakeRepo = Join-Path $TestDrive 'inex'
        [void](New-Item -ItemType Directory -Path $script:FakeRepo -Force)

        function Start-ProtectHook {
            param(
                [string]$ToolName,
                [hashtable]$ToolInput,
                [string]$RawInput
            )

            if (-not $RawInput) {
                if ($ToolInput.ContainsKey('file_path') -and -not [System.IO.Path]::IsPathRooted($ToolInput.file_path)) {
                    $ToolInput = @{ file_path = (Join-Path $script:FakeRepo $ToolInput.file_path) }
                }
                # <repo> in a command stands for the repository's absolute path
                if ($ToolInput.ContainsKey('command')) {
                    $ToolInput = @{ command = $ToolInput.command.Replace('<repo>', $script:FakeRepo) }
                }
                $RawInput = ConvertTo-Json -Compress -Depth 5 -InputObject @{
                    hook_event_name = 'PreToolUse'
                    tool_name       = $ToolName
                    cwd             = $script:FakeRepo
                    tool_input      = $ToolInput
                }
            }
            $powerShellExecutable = if (Get-Command -Name 'pwsh' -ErrorAction SilentlyContinue) { 'pwsh' } else { 'powershell' }
            $startInfo = [System.Diagnostics.ProcessStartInfo]::new($powerShellExecutable,"-NoProfile -ExecutionPolicy Bypass -File `"$($script:HookPath)`" -RepoRoot `"$($script:FakeRepo)`"")
            $startInfo.UseShellExecute = $false
            $startInfo.RedirectStandardInput = $true
            $startInfo.RedirectStandardOutput = $true
            $startInfo.RedirectStandardError = $true
            $process = [System.Diagnostics.Process]::Start($startInfo)
            $process.StandardInput.Write($RawInput)
            $process.StandardInput.Close()
            return [PSCustomObject]@{ Process = $process; Out = $process.StandardOutput.ReadToEndAsync(); Err = $process.StandardError.ReadToEndAsync() }
        }

        function Complete-ProtectHook {
            param($Started)
            $Started.Process.WaitForExit()
            $lines = @(($Started.Out.Result + $Started.Err.Result) -split '\r?\n' | Where-Object { $_ })
            return [PSCustomObject]@{ ExitCode = $Started.Process.ExitCode; Text = ($lines -join "`n") }
        }

        $cases = Import-PowerShellDataFile -Path (Join-Path $PSScriptRoot 'fixtures\ProtectHookCases.psd1')
        $started = [ordered]@{}
        foreach ($case in @($cases.Deny) + @($cases.Allow)) { $started[$case.Name] = Start-ProtectHook -ToolName $case.Tool -ToolInput $case.ToolInput }
        $started['malformed input'] = Start-ProtectHook -RawInput 'not json'
        $script:ProtectResults = @{}
        foreach ($name in $started.Keys) { $script:ProtectResults[$name] = Complete-ProtectHook $started[$name] }
    }

    It 'refuses <Name>' -ForEach $script:DenyCases {
        $result = $script:ProtectResults[$Name]
        $result.ExitCode | Should -Be 2
        $result.Text | Should -Match 'EditNames|synced from the Modding Manager|SyncMirrors'
    }

    It 'lets <Name> through' -ForEach $script:AllowCases {
        $result = $script:ProtectResults[$Name]
        $result.ExitCode | Should -Be 0
        $result.Text | Should -BeNullOrEmpty
    }

    It 'exits 0 on malformed input' {
        $script:ProtectResults['malformed input'].ExitCode | Should -Be 0
    }
}

Describe 'Sync-SkillMirrors hook' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:HookPath = Join-Path $script:RepoRoot '.claude\hooks\Sync-SkillMirrors.ps1'
        $script:FakeRepo = Join-Path $TestDrive 'inex-sync'
        [void](New-Item -ItemType Directory -Path $script:FakeRepo -Force)
        $script:MarkerPath = Join-Path $script:FakeRepo 'sync-ran.txt'
        $script:StubBuild = Join-Path $script:FakeRepo 'stub-build.ps1'
        $script:FailingBuild = Join-Path $script:FakeRepo 'failing-build.ps1'
        $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
        [System.IO.File]::WriteAllText($script:StubBuild, "param([switch]`$SyncMirrors)`r`n[System.IO.File]::WriteAllText('$($script:MarkerPath)', [string]`$SyncMirrors)`r`nexit 0`r`n", $utf8NoBom)
        [System.IO.File]::WriteAllText($script:FailingBuild, "param([switch]`$SyncMirrors)`r`nWrite-Output 'mirror copy failed: disk full'`r`nexit 1`r`n", $utf8NoBom)

        function Invoke-SyncHook {
            param(
                [string]$RelativePath,
                [string]$BuildScript
            )

            $eventJson = ConvertTo-Json -Compress -Depth 5 -InputObject @{
                hook_event_name = 'PostToolUse'
                tool_name       = 'Edit'
                cwd             = $script:FakeRepo
                tool_input      = @{ file_path = (Join-Path $script:FakeRepo $RelativePath) }
            }
            $previousPreference = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            $output = @($eventJson | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $script:FakeRepo -BuildScript $BuildScript 2>&1 | ForEach-Object { "$_" })
            $exitCode = $LASTEXITCODE
            $ErrorActionPreference = $previousPreference
            return [PSCustomObject]@{ ExitCode = $exitCode; Text = ($output -join "`n") }
        }
    }

    BeforeEach {
        if (Test-Path $script:MarkerPath) { Remove-Item $script:MarkerPath -Force }
    }

    It 'runs -SyncMirrors after an edit under .claude/skills' {
        $result = Invoke-SyncHook -RelativePath '.claude\skills\hoi4-inex-release\SKILL.md' -BuildScript $script:StubBuild
        $result.ExitCode | Should -Be 0
        (Test-Path $script:MarkerPath) | Should -BeTrue
        [System.IO.File]::ReadAllText($script:MarkerPath) | Should -Be 'True'
        $result.Text | Should -Match 'SyncMirrors'
    }

    It 'does nothing for an edit elsewhere' {
        $result = Invoke-SyncHook -RelativePath 'docs\plans\2026-10-25-testland-audit.md' -BuildScript $script:StubBuild
        $result.ExitCode | Should -Be 0
        (Test-Path $script:MarkerPath) | Should -BeFalse
        $result.Text | Should -BeNullOrEmpty
    }

    It 'reports a failed sync with exit 2 and the output' {
        $result = Invoke-SyncHook -RelativePath '.claude\skills\hoi4-inex-release\SKILL.md' -BuildScript $script:FailingBuild
        $result.ExitCode | Should -Be 2
        $result.Text | Should -Match 'disk full'
    }
}

Describe 'Show-PlanState hook' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:HookPath = Join-Path $script:RepoRoot '.claude\hooks\Show-PlanState.ps1'
        $script:FakeRepo = Join-Path $TestDrive 'inex-plans'
        $script:PlansPath = Join-Path $script:FakeRepo 'docs\plans'
        [void](New-Item -ItemType Directory -Path $script:PlansPath -Force)
        $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
        [System.IO.File]::WriteAllText((Join-Path $script:PlansPath 'TEMPLATE-namelist.md'), "# Template`r`n`r`nStatus: PLANNING`r`n- [ ] 1. Template step`r`n", $utf8NoBom)

        function Invoke-PlanStateHook {
            $eventJson = ConvertTo-Json -Compress -InputObject @{ hook_event_name = 'SessionStart'; source = 'compact' }
            $previousPreference = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            $output = @($eventJson | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $script:FakeRepo 2>&1 | ForEach-Object { "$_" })
            $exitCode = $LASTEXITCODE
            $ErrorActionPreference = $previousPreference
            return [PSCustomObject]@{ ExitCode = $exitCode; Text = ($output -join "`n") }
        }
    }

    It 'reports no plans and skips the template' {
        $result = Invoke-PlanStateHook
        $result.ExitCode | Should -Be 0
        $result.Text | Should -Match 'Plans in progress: none'
        $result.Text | Should -Not -Match 'TEMPLATE'
    }

    It 'prints a plan''s status and first unticked step' {
        $planText = "# Testland audit`r`n`r`nStatus: IN PROGRESS`r`n`r`n## Implementation steps`r`n- [x] 1. Apply the batch`r`n- [ ] 2. Write wiki/Testland.md`r`n- [ ] 3. Run -Check`r`n"
        [System.IO.File]::WriteAllText((Join-Path $script:PlansPath '2026-10-25-testland-audit.md'), $planText, [System.Text.UTF8Encoding]::new($false))
        $result = Invoke-PlanStateHook
        $result.ExitCode | Should -Be 0
        $result.Text | Should -Match 'docs/plans/2026-10-25-testland-audit\.md: Status: IN PROGRESS'
        $result.Text | Should -Match 'First unticked step: - \[ \] 2\. Write wiki/Testland\.md'
        $result.Text | Should -Not -Match '3\. Run -Check'
    }
}

Describe 'Hook registration in .claude/settings.json' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:Settings = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\settings.json'), [System.Text.Encoding]::UTF8) | ConvertFrom-Json
    }

    It 'registers Protect-ProjectFiles.ps1 for PreToolUse on the editing and shell tools' {
        $entries = @($script:Settings.hooks.PreToolUse)
        $entries.Count | Should -BeGreaterThan 0
        $commands = @($entries | ForEach-Object { $_.hooks } | ForEach-Object { $_.command })
        @($commands | Where-Object { $_ -match 'Protect-ProjectFiles\.ps1' }).Count | Should -Be 1
        $matcher = @($entries | Where-Object { @($_.hooks | Where-Object { $_.command -match 'Protect-ProjectFiles' }).Count -gt 0 })[0].matcher
        foreach ($tool in 'Edit', 'Write', 'MultiEdit', 'Bash', 'PowerShell') { $matcher | Should -Match "\b$tool\b" }
        (Test-Path (Join-Path $script:RepoRoot '.claude\hooks\Protect-ProjectFiles.ps1')) | Should -BeTrue
    }

    It 'registers Sync-SkillMirrors.ps1 for PostToolUse on the editing tools' {
        $entries = @($script:Settings.hooks.PostToolUse)
        $commands = @($entries | ForEach-Object { $_.hooks } | ForEach-Object { $_.command })
        @($commands | Where-Object { $_ -match 'Sync-SkillMirrors\.ps1' }).Count | Should -Be 1
        (Test-Path (Join-Path $script:RepoRoot '.claude\hooks\Sync-SkillMirrors.ps1')) | Should -BeTrue
    }

    It 'registers Show-PlanState.ps1 for SessionStart after a compaction' {
        $entries = @($script:Settings.hooks.SessionStart | Where-Object { @($_.hooks | Where-Object { $_.command -match 'Show-PlanState\.ps1' }).Count -gt 0 })
        $entries.Count | Should -Be 1
        $entries[0].matcher | Should -Be 'compact'
        (Test-Path (Join-Path $script:RepoRoot '.claude\hooks\Show-PlanState.ps1')) | Should -BeTrue
    }

    It 'asks before a Read of the large tool sources' {
        $ask = @($script:Settings.permissions.ask)
        foreach ($source in 'build.ps1', 'tools/HoiModBuild.ps1', 'tests/BuildScript.Tests.ps1', 'tests/BuildScriptCli.Tests.ps1', 'tests/BuildScriptRepo.Tests.ps1', 'tests/BuildScriptSetup.ps1') {
            @($ask | Where-Object { $_ -eq "Read(./$source)" }).Count | Should -Be 1 -Because "$source is learned through Get-Help or opened only in a tooling-backlog session"
        }
    }

    It 'asks before the Steam Workshop commands only' {
        $ask = @($script:Settings.permissions.ask)
        $allow = @($script:Settings.permissions.allow)
        foreach ($toolName in 'Bash', 'PowerShell') {
            foreach ($command in '-PublishSteam', '-InstallSteamCmd', 'steamcmd') {
                @($ask | Where-Object { $_ -like "$toolName(*$command*" }).Count | Should -BeGreaterThan 0 -Because "$command reaches the Workshop and runs on the user's word"
            }
            foreach ($command in '-Deploy', '-DevLink', '-Clean', 'push-wiki.ps1', 'git push') {
                @($ask | Where-Object { $_ -like "*$command*" }).Count | Should -Be 0 -Because "$command does not wait for the user's word"
                @($allow | Where-Object { $_ -like "$toolName(*$command*" }).Count | Should -BeGreaterThan 0 -Because "$command runs without a prompt from the $toolName tool"
            }
        }
    }

    It 'keeps the hook scripts to the PowerShell conventions (CmdletBinding, CRLF, no BOM)' {
        foreach ($name in 'Protect-ProjectFiles.ps1', 'Sync-SkillMirrors.ps1', 'Show-PlanState.ps1') {
            $path = Join-Path $script:RepoRoot ".claude\hooks\$name"
            $bytes = [System.IO.File]::ReadAllBytes($path)
            ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) | Should -BeFalse -Because "$name must be UTF-8 without BOM"
            $text = [System.Text.Encoding]::UTF8.GetString($bytes)
            $text | Should -Match '^\[CmdletBinding\(\)\]'
            $text | Should -Match "`r`n"
            ($text -replace "`r`n", '') | Should -Not -Match "`n" -Because "$name must use CRLF throughout"
        }
    }
}
