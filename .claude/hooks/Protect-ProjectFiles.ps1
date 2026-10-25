[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepoRoot
)

try {
    if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
    $repoRootPath = $RepoRoot.TrimEnd('\', '/')
    $hookInput = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $toolName = [string]$hookInput.tool_name

    $protectedPaths = @(
        [PSCustomObject]@{ Pattern = 'common/units/names_divisions/*'; Reason = 'is a namelist file: it changes only through build.ps1 -EditNames (-Group with -Add, -Remove, -Rename or -Set, -AddGroup, or -Batch <plan> after -DryRun), never through an editor. See AGENTS.md.' },
        [PSCustomObject]@{ Pattern = 'tools/*'; Reason = 'is synced from the Modding Manager and is overwritten on the next sync. Change it under the Manager''s Scripts/Build, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/BuildEngine.Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Build/HoiModBuild.Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/Run-Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Build/Run-Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/Knowledge.Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Knowledge/Knowledge.Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = '.github/workflows/ci.yml'; Reason = 'is synced from the Modding Manager (Scripts/Build/ci.yml) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = '.agents/skills/*'; Reason = 'is the Antigravity mirror written by build.ps1 -SyncMirrors. Edit .claude/skills/<skill>/SKILL.md instead; the PostToolUse hook syncs the mirror.' }
    )

    if ($toolName -in @('Edit', 'Write', 'MultiEdit', 'NotebookEdit')) {
        $filePath = [string]$hookInput.tool_input.file_path
        if (-not $filePath) { $filePath = [string]$hookInput.tool_input.notebook_path }
        if (-not $filePath) { exit 0 }
        if (-not [System.IO.Path]::IsPathRooted($filePath)) { $filePath = Join-Path $repoRootPath $filePath }
        $fullPath = [System.IO.Path]::GetFullPath($filePath)
        if (-not $fullPath.StartsWith($repoRootPath + '\', [System.StringComparison]::OrdinalIgnoreCase)) { exit 0 }
        $relativePath = $fullPath.Substring($repoRootPath.Length + 1).Replace('\', '/')
        foreach ($protected in $protectedPaths) {
            if ($relativePath -like $protected.Pattern) {
                [Console]::Error.WriteLine("$relativePath $($protected.Reason)")
                exit 2
            }
        }
        exit 0
    }

    if ($toolName -in @('Bash', 'PowerShell')) {
        $command = [string]$hookInput.tool_input.command
        if (-not $command) { exit 0 }
        if ($command -notmatch 'names_divisions') { exit 0 }
        $writePattern = 'Set-Content|Add-Content|Out-File|WriteAllText|WriteAllLines|WriteAllBytes|sed\s+-i|Copy-Item|Move-Item|Remove-Item|New-Item|\bcp\s|\bmv\s|\brm\s|\btee\s|>\s*"?[^\s"]*names_divisions'
        # One sub-command at a time, so a write elsewhere in the line (git mv of a plan) does not count against a
        # namelist path in another sub-command. git commands stage, move or restore through the index, not an editor.
        foreach ($segment in ($command -split '&&|\|\||[;|\r\n]')) {
            $segment = $segment.Trim()
            if ($segment -notmatch 'names_divisions' -or $segment -match '^git\b') { continue }
            if ($segment -match $writePattern) {
                [Console]::Error.WriteLine('The command writes into common/units/names_divisions/: a namelist file changes only through build.ps1 -EditNames (-Batch <plan> after -DryRun), never through a shell write, which also corrupts diacritics. See AGENTS.md.')
                exit 2
            }
        }
        exit 0
    }

    exit 0
} catch {
    exit 0
}
