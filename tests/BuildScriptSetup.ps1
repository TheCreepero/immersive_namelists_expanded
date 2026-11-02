$script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$script:BuildScriptPath = Join-Path $script:RepoRoot "build.ps1"

# Read build.ps1 script content to extract functions without executing the full script
$script:BuildContent = [System.IO.File]::ReadAllText($script:BuildScriptPath, [System.Text.Encoding]::UTF8)

# Get-ModMetadata, New-LauncherModContent and the lifecycle actions live in the shared engine
. (Join-Path $script:RepoRoot 'tools\HoiModBuild.ps1')
$script:BuildConfig = Get-ModBuildConfig -RepoDir $script:RepoRoot

# Script-level list of valid division_types tokens, read by Invoke-Validation and Edit-NamelistGroupText
$typesMatch = [regex]::Match($script:BuildContent, '(?s)\$ValidDivisionTypes = @\(.*?\)')
if ($typesMatch.Success) {
    . ([ScriptBlock]::Create($typesMatch.Value))
}

foreach ($fn in 'Get-NamePatternKey', 'Test-FallbackStub', 'ConvertFrom-RomanNumeral', 'ConvertTo-RomanNumeral', 'Get-SharedIdentities', 'Split-NamelistGroupBlocks', 'Get-NamelistAuditData', 'Get-NameGroupFields', 'Get-GameSubUnits', 'Get-GameLineBattalionIds', 'Merge-NameGroupFiles', 'Get-MergedNameGroups','Test-CanUseForGovernment', 'Get-NamePick', 'Format-NamePick', 'Format-NamePickRow','Get-OrderedEntryStats', 'Compare-NamelistAuditData', 'Get-GitFileText', 'Get-NameVariantKey', 'Resolve-GroupTag', 'Get-GroupSections', 'Format-EntryList', 'Get-OrphanHeaderLines', 'Set-NamelistGroupComment', 'Set-NamelistHeader', 'Edit-NamelistGroupText', 'Get-NamelistGroupEnd', 'Add-NamelistGroupText', 'ConvertTo-NamelistEditOp', 'Invoke-NamelistEditOps', 'Get-PlanBatchBlocks', 'Get-PlanReadinessWarnings', 'Read-NamelistEditBatch', 'Get-WorkshopDocStats', 'Get-VanillaOverlap', 'Find-Hoi4Install', 'Add-VanillaSelectorFlags', 'Find-WikiLinkMismatches', 'Compare-NamelistGroupSets', 'Format-NamelistDiff', 'Get-CountryName', 'Format-PlanChangeTable', 'Set-PlanChangeTable', 'New-AuditPlanText', 'Format-AuditSummaryLine', 'Get-AuditFindingLines', 'Update-WikiGroupRows', 'Find-WikiProseMentions', 'Format-CappedList', 'Format-KeyRanges', 'Format-AuditFlagsLine', 'Get-LivePlanPaths', 'Add-MarkdownTableRow', 'Add-MarkdownListLine', 'Add-NationDocRows', 'Sync-AgentMirrors', 'Get-GameLogFindings', 'Read-SharedTextLines', 'Get-UnpushedWikiPages') {
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
$validationFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function Invoke-Validation\s*\{.*?\n\})\r?\n\r?\n# --- Helper: Find Hearts of Iron IV Game Installation')
if ($validationFuncMatch.Success) {
    . ([ScriptBlock]::Create($validationFuncMatch.Groups[1].Value))
}

function Invoke-BuildInProcess {
    param([string]$Path, [hashtable]$Parameters)
    $global:LASTEXITCODE = 0
    try {
        $output = ((@(& $Path @Parameters *>&1 | ForEach-Object { "$_" }) -join "`r`n") + "`r`n")
    } catch {
        $output = ($_ | Out-String)
        $global:LASTEXITCODE = 1
    }
    return $output
}
