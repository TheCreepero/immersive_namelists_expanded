[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepoRoot,

    [Parameter()]
    [string]$BuildScript
)

try {
    if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
    $repoRootPath = $RepoRoot.TrimEnd('\', '/')
    if (-not $BuildScript) { $BuildScript = Join-Path $repoRootPath 'build.ps1' }
    $hookInput = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = [string]$hookInput.tool_input.file_path
    if (-not $filePath) { exit 0 }
    if (-not [System.IO.Path]::IsPathRooted($filePath)) { $filePath = Join-Path $repoRootPath $filePath }
    $fullPath = [System.IO.Path]::GetFullPath($filePath)
    if (-not $fullPath.StartsWith($repoRootPath + '\', [System.StringComparison]::OrdinalIgnoreCase)) { exit 0 }
    $relativePath = $fullPath.Substring($repoRootPath.Length + 1).Replace('\', '/')
    if ($relativePath -notlike '.claude/skills/*') { exit 0 }
} catch {
    exit 0
}

$ErrorActionPreference = 'Continue'
$output = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $BuildScript -SyncMirrors *>&1 | ForEach-Object { "$_" })
if ($LASTEXITCODE -eq 0) {
    [Console]::Out.WriteLine("Mirrored $relativePath to .agents/skills with build.ps1 -SyncMirrors.")
    exit 0
}
[Console]::Error.WriteLine("build.ps1 -SyncMirrors failed after editing ${relativePath}; the .agents/skills mirror is stale:")
foreach ($line in @($output | Select-Object -Last 20)) { [Console]::Error.WriteLine($line.Trim()) }
exit 2
