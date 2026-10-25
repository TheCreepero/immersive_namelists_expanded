[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepoRoot
)

try {
    if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
    $plansPath = Join-Path $RepoRoot 'docs\plans'
    $planFiles = @(Get-ChildItem -Path $plansPath -Filter '*.md' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike 'TEMPLATE-*' } | Sort-Object Name)
    $lines = [System.Collections.Generic.List[string]]::new()
    if ($planFiles.Count -eq 0) {
        $lines.Add('Plans in progress: none under docs/plans/.')
    } else {
        $lines.Add('Plans in progress:')
        foreach ($planFile in $planFiles) {
            $planLines = @([System.IO.File]::ReadAllLines($planFile.FullName, [System.Text.Encoding]::UTF8))
            $statusLine = @($planLines | Where-Object { $_ -match '^Status:' } | Select-Object -First 1)
            $nextStepLine = @($planLines | Where-Object { $_ -match '^- \[ \]' } | Select-Object -First 1)
            $status = if ($statusLine.Count -gt 0) { $statusLine[0].Trim() } else { 'Status: missing' }
            $lines.Add("- docs/plans/$($planFile.Name): $status")
            if ($nextStepLine.Count -gt 0) { $lines.Add("  First unticked step: $($nextStepLine[0].Trim())") }
        }
    }
    $changedFiles = @(& git -C $RepoRoot status --short 2>$null)
    if ($changedFiles.Count -eq 0) {
        $lines.Add('Working tree: clean.')
    } else {
        $lines.Add("Working tree: $($changedFiles.Count) changed file(s)")
        foreach ($changedFile in @($changedFiles | Select-Object -First 20)) { $lines.Add("  $changedFile") }
        if ($changedFiles.Count -gt 20) { $lines.Add("  ... and $($changedFiles.Count - 20) more") }
    }
    [Console]::Out.WriteLine(($lines -join [Environment]::NewLine))
    exit 0
} catch {
    exit 0
}
