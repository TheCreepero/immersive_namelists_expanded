<#
.SYNOPSIS
    Build, validate, deploy, package, and publish automation for Immersive Namelists Expanded (Hearts of Iron IV mod).

.DESCRIPTION
    Provides modern, reliable mod development workflows:
    - Deploy (default): Fast mirror sync into Paradox HOI4 mod directory, strictly excluding .git,
      documentation, and dev artifacts, while auto-generating the launcher .mod file from descriptor.mod.
    - DevLink: Points the launcher .mod file directly to this dev repository for instant zero-copy live editing.
    - Package: Generates a clean distribution ZIP archive (inex.zip) excluding .git and build tools.
    - Validate: Checks all division namelist .txt files for balanced braces ({}) and syntax validity.
    - PublishSteam: Staged, clean upload directly to Steam Workshop via SteamCMD.
    - Clean: Removes deployed mod files and generated archives.

.PARAMETER Deploy
    Deploy mod files to the Paradox Interactive Hearts of Iron IV mod folder (default action).

.PARAMETER DevLink
    Configure Paradox launcher to read directly from the working development folder without copying.

.PARAMETER Package
    Create a clean release ZIP archive (default: inex.zip).

.PARAMETER PublishSteam
    Stage clean mod content and upload update to Steam Workshop using SteamCMD.

.PARAMETER InstallSteamCmd
    Automatically download and install Valve's official SteamCMD utility.

.PARAMETER ValidateOnly
    Run validation only and exit.

.PARAMETER Test
    Execute the comprehensive Pester unit test suites in tests/ and report results.

.PARAMETER Validate
    Validate namelist syntax and bracket balance before proceeding (enabled by default).

.PARAMETER NoValidate
    Skip syntax and bracket validation.

.PARAMETER Clean
    Clean deployed mod files from Paradox mod directory and delete temporary zip archives.

.PARAMETER InspectVanilla
    Inspect vanilla Hearts of Iron IV namelists and scripted references for a country tag (e.g. -InspectVanilla LAT).

.PARAMETER Group
    Optional specific namelist group tag to excerpt directly when using -InspectVanilla or -Audit (e.g. -Group SOV_INF_02).
    With -Audit, accepts a comma-separated list, and the INEX_<TAG>_ prefix may be omitted (e.g. -Group INF_01,REG_01).
    With -EditNames (required): the single group to edit; the prefix may be omitted.

.PARAMETER NamesOnly
    With -Audit: print one compact line per group (tag, count, selector, names separated by "; ") instead of raw blocks.
    Combine with -Group to limit output to the listed groups.

.PARAMETER Sections
    With -Audit -NamesOnly: show each group's comment headers inline ("[Header] 1. Name; 2. Name"), so section
    placement can be planned without opening the file.

.PARAMETER EditNames
    Edit one group of a mod namelist in place without opening the file (e.g. -EditNames LAT -Group INF_01 -Rename "Old=New").
    Supports -Add, -Remove, -Rename, -Set, -After, -Section, -RenameSection, -Quiet.

.PARAMETER Add
    With -EditNames: names to add ("A; B" or "15=Name"). Appended at the end of the ordered block, or after -After or in -Section.

.PARAMETER Remove
    With -EditNames: names or index numbers to remove ("A; B" or "15; 16").

.PARAMETER Rename
    With -EditNames: in-place renames as "Old=New; Old2=New2" (preserves the entry's index).

.PARAMETER Set
    With -EditNames: set or update specific indexed entries as "15=New Name; 16=New Name 2".

.PARAMETER After
    With -EditNames -Add: insert the added names directly after this existing name instead of at the block end.

.PARAMETER Section
    With -EditNames -Add: add the names at the end of the section under this comment header (text after '#');
    the header is created at the block end if missing. Headers an edit leaves empty are dropped automatically.

.PARAMETER RenameSection
    With -EditNames: rename comment headers in place ("Old header=New header; ...").

.PARAMETER Quiet
    With -EditNames: print only the summary line (count and dropped sections), not the group's names.

.PARAMETER DiffNames
    Name-level diff of a mod namelist against a git revision (e.g. -DiffNames LAT): one line per changed group with
    added (+) and removed (-) names, selector / types / fallback / link changes, names moved between groups,
    and the unchanged groups. Far smaller than a line diff; use it for plan change tables and reviews.

.PARAMETER Base
    With -DiffNames or -AuditPlan: git revision to compare the working-tree file against (default HEAD).

.PARAMETER AuditPlan
    Create docs/superpowers/plans/<today>-<country>-audit.md (e.g. -AuditPlan LAT): the initial -Audit report, TODO
    sections to fill, and a per-group change table generated from -DiffNames between markers. Run again to refresh
    the table; the rest of the plan is left untouched. -Audit reports unfilled TODOs as PlanTodo.

.PARAMETER SyncWiki
    Sync wiki/<Country>.md group rows with the namelist (literal display names, division types, fallback) and the TAG's
    group count in wiki/Home.md (e.g. -SyncWiki LAT). Lists groups without a row, rows without a group, and prose
    lines that mention names removed or moved since HEAD.

.PARAMETER Audit
    Print a heuristic quality scorecard for an INEX namelist file (informational, never fails the build).
    Accepts the file key between 'INEX_' and '_names_divisions' (e.g. -Audit LIT, -Audit GER_SS), or ALL for a triage table.

.PARAMETER Compare
    With -Audit <KEY>: compare the working copy against a git ref (e.g. -Compare HEAD). Lists removed/added tags,
    selector/type/fallback/link changes, and only the added or changed name strings, for review without a raw diff.


.PARAMETER Hoi4InstallDir
    Custom path to the Hearts of Iron IV installation folder if installed in a non-standard directory.

.PARAMETER ModDir
    Custom path to the Paradox Hearts of Iron IV mod directory. Defaults to standard Documents path.

.PARAMETER ZipOutput
    Custom file path or name for the packaged zip file.

.PARAMETER SteamUser
    Steam username owning the workshop item. Saved to .steam_username upon first entry.

.PARAMETER ChangeNote
    Update note for Steam Workshop. Defaults to the latest git commit message.

.PARAMETER SteamCmdPath
    Custom path to steamcmd.exe if installed in a non-standard directory.

.PARAMETER DryRun
    Preview the generated Steam VDF, staged files, and upload command without executing SteamCMD.

.EXAMPLE
    .\build.ps1
    # Validates and deploys the mod to the local HOI4 mod directory.

.EXAMPLE
    .\build.ps1 -DevLink
    # Configures HOI4 to load directly from the git repo folder (instant hot-reload).

.EXAMPLE
    .\build.ps1 -Package
    # Packages a clean inex.zip without .git or build artifacts.

.EXAMPLE
    .\build.ps1 -Test
    # Executes automated Pester test suites covering namelists, documentation, and build automation.

.EXAMPLE
    .\build.ps1 -Audit ALL
    # Ranks all INEX namelist files by quality flags to pick the next one to modernize.

.EXAMPLE
    .\build.ps1 -Audit FIN -Compare HEAD
    # Scorecard for the Finnish file plus a review list of what changed since the last commit.

.EXAMPLE
    .\build.ps1 -PublishSteam -DryRun
    # Previews the Steam Workshop VDF and staged files without uploading.

.EXAMPLE
    .\build.ps1 -PublishSteam -ChangeNote "Add Swedish and Lithuanian namelists"
    # Publishes update to Steam Workshop.
#>

[CmdletBinding(DefaultParameterSetName = 'Deploy')]
param(
    [Parameter(ParameterSetName = 'Deploy')]
    [switch]$Deploy,

    [Parameter(ParameterSetName = 'DevLink')]
    [switch]$DevLink,

    [Parameter(ParameterSetName = 'Package')]
    [switch]$Package,

    [Parameter(ParameterSetName = 'PublishSteam')]
    [switch]$PublishSteam,

    [Parameter(ParameterSetName = 'InstallSteamCmd')]
    [switch]$InstallSteamCmd,

    [Parameter(ParameterSetName = 'ValidateOnly')]
    [switch]$ValidateOnly,

    [Parameter(ParameterSetName = 'Test')]
    [switch]$Test,

    [Parameter(ParameterSetName = 'Clean')]
    [switch]$Clean,

    [Parameter(ParameterSetName = 'InspectVanilla', Mandatory = $true)]
    [string]$InspectVanilla,

    [Parameter(ParameterSetName = 'Audit', Mandatory = $true)]
    [string]$Audit,

    [Parameter(ParameterSetName = 'Audit')]
    [string]$Compare,

    [Parameter(ParameterSetName = 'Audit')]
    [switch]$NamesOnly,

    [Parameter(ParameterSetName = 'Audit')]
    [switch]$Sections,

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [Parameter(ParameterSetName = 'Audit')]
    [Parameter(ParameterSetName = 'EditNames', Mandatory = $true)]
    [string[]]$Group,

    [Parameter(ParameterSetName = 'EditNames', Mandatory = $true)]
    [string]$EditNames,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Add,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Remove,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Rename,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Set,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$After,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Section,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$RenameSection,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Selector,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$AddType,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$RemoveType,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$CanUse,

    [Parameter(ParameterSetName = 'EditNames')]
    [switch]$Quiet,

    [Parameter(ParameterSetName = 'DiffNames', Mandatory = $true)]
    [string]$DiffNames,

    [Parameter(ParameterSetName = 'AuditPlan', Mandatory = $true)]
    [string]$AuditPlan,

    [Parameter(ParameterSetName = 'SyncWiki', Mandatory = $true)]
    [string]$SyncWiki,

    [Parameter(ParameterSetName = 'DiffNames')]
    [Parameter(ParameterSetName = 'AuditPlan')]
    [string]$Base = 'HEAD',

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [string]$Hoi4InstallDir,

    [switch]$Validate,
    [switch]$NoValidate,
    [switch]$DryRun,
    [string]$ModDir,
    [string]$ZipOutput,
    [string]$SteamUser,
    [string]$ChangeNote,
    [string]$SteamCmdPath
)

Set-StrictMode -Off
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# --- Terminal Styling Helpers ---
function Write-Step   { param([string]$msg) Write-Host "`n==> $msg" -ForegroundColor Cyan }
function Write-Ok     { param([string]$msg) Write-Host "  [OK] $msg" -ForegroundColor Green }
function Write-Info   { param([string]$msg) Write-Host "  [INFO] $msg" -ForegroundColor Gray }
function Write-Warn   { param([string]$msg) Write-Host "  [WARN] $msg" -ForegroundColor Yellow }
function Write-Err    { param([string]$msg) Write-Host "  [ERROR] $msg" -ForegroundColor Red }

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

# --- Locate Directories ---
$ScriptDir = $PSScriptRoot
if (-not $ScriptDir) {
    $ScriptDir = (Get-Location).Path
}
$RepoDir = $ScriptDir

if (-not (Test-Path (Join-Path $RepoDir "descriptor.mod"))) {
    Write-Err "Could not find 'descriptor.mod' in '$RepoDir'."
    exit 1
}

$ModName = "immersive_namelists_expanded"
$DescriptorPath = Join-Path $RepoDir "descriptor.mod"

# Resolve Paradox HOI4 Mod Directory
if (-not $ModDir) {
    $docs = [Environment]::GetFolderPath('MyDocuments')
    $ModDir = Join-Path $docs "Paradox Interactive\Hearts of Iron IV\mod"
}

# --- Helper: Parse descriptor.mod ---
function Get-ModMetadata {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        throw "Descriptor file not found: $Path"
    }

    $raw = Get-Content $Path -Raw -Encoding UTF8
    $metadata = @{
        Raw = $raw
        Version = $null
        SupportedVersion = $null
        Name = $null
        RemoteFileId = $null
        Tags = @()
    }

    if ($raw -match 'version\s*=\s*"([^"]+)"') { $metadata.Version = $matches[1] }
    if ($raw -match 'supported_version\s*=\s*"([^"]+)"') { $metadata.SupportedVersion = $matches[1] }
    if ($raw -match 'name\s*=\s*"([^"]+)"') { $metadata.Name = $matches[1] }
    if ($raw -match 'remote_file_id\s*=\s*"([^"]+)"') { $metadata.RemoteFileId = $matches[1] }

    return $metadata
}

# --- Helper: Generate Launcher .mod File Content ---
function New-LauncherModContent {
    param(
        [string]$DescriptorPath,
        [string]$TargetModPath
    )

    $meta = Get-ModMetadata -Path $DescriptorPath
    $rawLines = Get-Content $DescriptorPath -Encoding UTF8

    # Normalize target path with forward slashes for Paradox engine
    $normalizedPath = ($TargetModPath -replace '\\', '/')

    $lines = [System.Collections.Generic.List[string]]::new()
    $insertedPath = $false

    foreach ($line in $rawLines) {
        # Skip existing path definitions if present in descriptor
        if ($line -match '^\s*path\s*=') { continue }

        # Insert path right before remote_file_id, or after supported_version
        if (-not $insertedPath -and ($line -match '^\s*remote_file_id\s*=')) {
            $lines.Add("path=`"$normalizedPath`"")
            $insertedPath = $true
        }

        $lines.Add($line)
    }

    if (-not $insertedPath) {
        $lines.Add("path=`"$normalizedPath`"")
    }

    return ($lines -join "`r`n")
}

# --- Helper: Validate Namelists and Descriptor ---
function Invoke-Validation {
    Write-Step "Validating mod syntax and files..."
    $hasErrors = $false

    # Check descriptor.mod
    if (-not (Test-Path $DescriptorPath)) {
        Write-Err "descriptor.mod is missing!"
        $hasErrors = $true
    } else {
        $meta = Get-ModMetadata -Path $DescriptorPath
        if (-not $meta.Name) { Write-Err "descriptor.mod: missing 'name' attribute"; $hasErrors = $true }
        if (-not $meta.SupportedVersion) { Write-Err "descriptor.mod: missing 'supported_version' attribute"; $hasErrors = $true }
        if (-not $hasErrors) {
            Write-Ok "descriptor.mod valid (Mod: '$($meta.Name)', Game Version: $($meta.SupportedVersion))"
        }
    }

    # Check thumbnail
    $thumbPath = Join-Path $RepoDir "thumbnail.png"
    if (Test-Path $thumbPath) {
        Write-Ok "thumbnail.png verified"
    } else {
        Write-Warn "thumbnail.png is missing from mod source"
    }

    # Check division namelists
    $namelistDir = Join-Path $RepoDir "common\units\names_divisions"
    if (-not (Test-Path $namelistDir)) {
        Write-Err "Namelist directory not found: $namelistDir"
        return $false
    }

    $namelistFiles = Get-ChildItem -Path $namelistDir -Filter *.txt
    if ($namelistFiles.Count -eq 0) {
        Write-Warn "No division namelist files found in $namelistDir"
    }

    $validSubunits = @(
        'infantry', 'cavalry', 'motorized', 'mechanized', 'marine', 'mountaineers', 'paratrooper',
        'light_armor', 'medium_armor', 'heavy_armor', 'super_heavy_armor', 'modern_armor',
        'amphibious_armor', 'amphibious_mechanized', 'artillery', 'anti_air', 'anti_tank',
        'rocket_artillery', 'motorized_rocket_artillery', 'irregular_infantry', 'militia',
        'camelry', 'ranger_battalion', 'penal_battalion'
    )
    $globalGroupTags = @{}

    $checkedCount = 0
    foreach ($file in $namelistFiles) {
        $fileHasError = $false

        # Check UTF-8 BOM (GEMINI.md Rule 1: UTF-8 without BOM)
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            Write-Err "$($file.Name): UTF-8 BOM detected! Files must be saved as UTF-8 without BOM."
            $fileHasError = $true
        }

        $lines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
        # Strip comments
        $cleanLines = @($lines | ForEach-Object { $_ -replace '#.*$', '' })
        $cleanText = $cleanLines -join "`n"

        # Check bracket balance
        $openCount  = ([regex]::Matches($cleanText, '\{')).Count
        $closeCount = ([regex]::Matches($cleanText, '\}')).Count
        if ($openCount -ne $closeCount) {
            Write-Err "$($file.Name): Bracket mismatch (Open: $openCount, Close: $closeCount)"
            $fileHasError = $true
        }

        # Check double-quote parity
        $quoteCount = ([regex]::Matches($cleanText, '"')).Count
        if ($quoteCount % 2 -ne 0) {
            Write-Err "$($file.Name): Unbalanced double quotes ($quoteCount quotes found)"
            $fileHasError = $true
        }

        # Check for invalid division types against approved subunit whitelist
        $typeMatches = [regex]::Matches($cleanText, 'division_types\s*=\s*\{([^}]*)\}')
        foreach ($tm in $typeMatches) {
            $tokens = [regex]::Matches($tm.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
            foreach ($tok in $tokens) {
                if ($validSubunits -notcontains $tok) {
                    Write-Err "$($file.Name): Invalid division type token '$tok' found in division_types"
                    $fileHasError = $true
                }
            }
        }

        # Check for empty ordered blocks
        if ($cleanText -match 'ordered\s*=\s*\{\s*\}') {
            Write-Err "$($file.Name): Empty ordered block detected"
            $fileHasError = $true
        }

        # Check for duplicate indices within each ordered block
        # (content pattern must tolerate the nested "N = { "..." }" braces around each entry)
        $orderedMatches = [regex]::Matches($cleanText, 'ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')
        foreach ($m in $orderedMatches) {
            $block = $m.Groups['content'].Value
            $indexMatches = [regex]::Matches($block, '(?m)^\s*(\d+)\s*=')
            $seen = @{}
            foreach ($im in $indexMatches) {
                $idx = $im.Groups[1].Value
                if ($seen.ContainsKey($idx)) {
                    Write-Err "$($file.Name): Duplicate index $idx found in ordered block"
                    $fileHasError = $true
                } else {
                    $seen[$idx] = $true
                }
            }
        }

        # Check fallback_name format for ordinal placeholder (%d or %s)
        $fallbackMatches = [regex]::Matches($cleanText, 'fallback_name\s*=\s*"([^"]+)"')
        foreach ($fm in $fallbackMatches) {
            $fb = $fm.Groups[1].Value
            if ($fb -notmatch '(%d|%s)') {
                Write-Err "$($file.Name): Fallback name '$fb' is missing an ordinal placeholder (%d or %s)"
                $fileHasError = $true
            }
        }

        # Check for focus locks (forbidden for mod compatibility - must use has_government)
        if ($cleanText -match '\bhas_completed_focus\b') {
            Write-Err "$($file.Name): 'has_completed_focus' detected! Namelists must not be locked behind focuses (use 'has_government' for mod compatibility)."
            $fileHasError = $true
        }

        # Check link_numbering_with self-reference and track global root group uniqueness
        $depth = 0
        $currentGroup = $null
        for ($i = 0; $i -lt $lines.Length; $i++) {
            $cleanLine = ($lines[$i] -replace '#.*$', '').Trim()
            if ([string]::IsNullOrWhiteSpace($cleanLine)) { continue }

            if ($depth -eq 0) {
                $gm = [regex]::Match($cleanLine, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                if ($gm.Success -and $cleanLine -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
                    $currentGroup = $gm.Groups[1].Value
                    if ($globalGroupTags.ContainsKey($currentGroup)) {
                        Write-Err "$($file.Name): Duplicate group tag '$currentGroup' (first defined in $($globalGroupTags[$currentGroup]))"
                        $fileHasError = $true
                    } else {
                        $globalGroupTags[$currentGroup] = $file.Name
                    }
                }
            }

            $lm = [regex]::Match($cleanLine, 'link_numbering_with\s*=\s*\{([^}]*)\}')
            if ($lm.Success -and $currentGroup) {
                $targets = [regex]::Matches($lm.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
                foreach ($tgt in $targets) {
                    if ($tgt -eq $currentGroup) {
                        Write-Err "$($file.Name): Group '$currentGroup' has self-referential link_numbering_with"
                        $fileHasError = $true
                    }
                }
            }

            $depth += (([regex]::Matches($cleanLine, '\{')).Count - ([regex]::Matches($cleanLine, '\}')).Count)
        }

        if ($fileHasError) {
            $hasErrors = $true
        } else {
            $checkedCount++
        }
    }

    # Verify documentation synchronization with README.md
    $readmePath = Join-Path $RepoDir "README.md"
    if (Test-Path $readmePath) {
        $readmeText = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
        $implementedTags = [System.Collections.Generic.HashSet[string]]::new()
        foreach ($f in $namelistFiles) {
            if ($f.Name -match '^INEX_([A-Z0-9]{3})_') {
                [void]$implementedTags.Add($matches[1])
            }
        }
        foreach ($t in $implementedTags) {
            # Single-quoted so the backtick stays a literal "optional markdown-code backtick" in the
            # regex, and [ \t]* (not \s*) so this can't bridge across a newline into an unrelated table row.
            if ($readmeText -notmatch ('\|[ \t]*`?' + [regex]::Escape($t) + '`?[ \t]*\|')) {
                Write-Err "README.md: Missing documentation entry for nation tag '$t'"
                $hasErrors = $true
            }
        }
    }

    if (-not $hasErrors) {
        Write-Ok "All $checkedCount division namelist files passed comprehensive syntax, engine, and structure validation."
    }

    return (-not $hasErrors)
}

# --- Helper: Find or Install SteamCMD ---
function Find-SteamCmd {
    param([string]$CustomPath)

    if ($CustomPath -and (Test-Path $CustomPath)) {
        return (Resolve-Path $CustomPath).Path
    }

    $cmd = Get-Command steamcmd.exe -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }

    $candidates = @(
        "C:\steamcmd\steamcmd.exe",
        "C:\Program Files (x86)\Steam\steamcmd.exe",
        (Join-Path $env:LOCALAPPDATA "Programs\steamcmd\steamcmd.exe"),
        (Join-Path $env:USERPROFILE "steamcmd\steamcmd.exe")
    )

    foreach ($p in $candidates) {
        if ($p -and (Test-Path $p)) { return $p }
    }

    return $null
}

function Install-SteamCmd {
    Write-Step "Installing SteamCMD..."
    $installDir = Join-Path $env:USERPROFILE "steamcmd"
    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    }

    $zipPath = Join-Path $installDir "steamcmd.zip"
    $url = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"

    Write-Info "Downloading SteamCMD from Valve ($url)..."
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $zipPath)

    Write-Info "Extracting to $installDir..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $installDir)
    Remove-Item -Force $zipPath

    $exe = Join-Path $installDir "steamcmd.exe"
    if (Test-Path $exe) {
        Write-Ok "SteamCMD successfully installed at: $exe"
        return $exe
    } else {
        throw "Failed to install SteamCMD: steamcmd.exe not found after extraction."
    }
}

# --- Helper: Find Hearts of Iron IV Game Installation ---
function Find-Hoi4Install {
    param([string]$CustomPath)

    if ($CustomPath -and (Test-Path (Join-Path $CustomPath "common\units\names_divisions"))) {
        return (Resolve-Path $CustomPath).Path
    }

    $candidates = [System.Collections.Generic.List[string]]::new()
    $candidates.Add("C:\Gaming\Steam\steamapps\common\Hearts of Iron IV")
    $candidates.Add("C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV")
    $candidates.Add("C:\Program Files\Steam\steamapps\common\Hearts of Iron IV")

    # Read registry for SteamPath
    try {
        $regSteam = (Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -Name "SteamPath" -ErrorAction SilentlyContinue).SteamPath
        if ($regSteam) {
            $candidates.Add((Join-Path $regSteam "steamapps\common\Hearts of Iron IV"))
            $vdf = Join-Path $regSteam "steamapps\libraryfolders.vdf"
            if (Test-Path $vdf) {
                $vdfRaw = Get-Content $vdf -Raw -ErrorAction SilentlyContinue
                $libMatches = [regex]::Matches($vdfRaw, '"path"\s*"([^"]+)"')
                foreach ($m in $libMatches) {
                    $p = $m.Groups[1].Value -replace '\\\\', '\'
                    $candidates.Add((Join-Path $p "steamapps\common\Hearts of Iron IV"))
                }
            }
        }
    } catch {}

    foreach ($cand in $candidates) {
        if ($cand -and (Test-Path (Join-Path $cand "common\units\names_divisions"))) {
            return (Resolve-Path $cand).Path
        }
    }

    return $null
}

# --- Helper: Count ordered entries in a comment-stripped group block ---
# Tolerates nested entry braces and reports malformed entries (e.g. a missing opening quote,
# as in vanilla FIN_GAR_02) instead of silently skipping them.
function Get-OrderedEntryStats {
    param([string]$CleanBlock)

    $stats = [PSCustomObject]@{ Count = 0; Malformed = 0; Samples = @() }
    $orderedM = [regex]::Match($CleanBlock, 'ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')
    if (-not $orderedM.Success) { return $stats }

    $content = $orderedM.Groups['content'].Value
    $keyed = [regex]::Matches($content, '(\d+)\s*=\s*\{([^{}]*)\}')
    $samples = [System.Collections.Generic.List[string]]::new()
    foreach ($k in $keyed) {
        $nameM = [regex]::Match($k.Groups[2].Value, '^\s*"((?:[^"\\]|\\.)*)"')
        if ($nameM.Success) {
            if ($samples.Count -lt 3) { $samples.Add("$($k.Groups[1].Value)=$($nameM.Groups[1].Value)") }
        } else {
            $stats.Malformed++
        }
    }
    # Brace-less entries (1 = "Name") are also valid
    $bare = [regex]::Matches(($content -replace '\{[^{}]*\}', ''), '(\d+)\s*=\s*"((?:[^"\\]|\\.)*)"')
    foreach ($b in $bare) {
        if ($samples.Count -lt 3) { $samples.Add("$($b.Groups[1].Value)=$($b.Groups[2].Value)") }
    }
    $stats.Count = $keyed.Count + $bare.Count
    $stats.Samples = @($samples)
    return $stats
}

# --- Action: Inspect Vanilla Namelists & Script References ---
function Invoke-InspectVanilla {
    param(
        [string]$Tag,
        [string[]]$TargetGroup,
        [string]$CustomHoi4Dir
    )

    $hoi4Dir = Find-Hoi4Install -CustomPath $CustomHoi4Dir
    if (-not $hoi4Dir) {
        Write-Err "Could not locate Hearts of Iron IV game installation directory."
        Write-Info "Specify the path using -Hoi4InstallDir '<path>'."
        exit 1
    }

    $Tag = $Tag.ToUpper().Trim()
    $targetFile = Join-Path $hoi4Dir "common\units\names_divisions\${Tag}_names_divisions.txt"
    if (-not (Test-Path $targetFile)) {
        Write-Err "Vanilla namelist file not found: $targetFile"
        exit 1
    }

    $raw = [System.IO.File]::ReadAllText($targetFile, [System.Text.Encoding]::UTF8)
    $lines = $raw -split '\r?\n'

    $groups = [System.Collections.Generic.List[psobject]]::new()
    $i = 0
    while ($i -lt $lines.Length) {
        $line = $lines[$i] -replace '#.*$', ''
        $match = [regex]::Match($line, '^\s*([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
        if ($match.Success -and $line.Trim() -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
            $gtag = $match.Groups[1].Value
            $blockLines = [System.Collections.Generic.List[string]]::new()
            $blockLines.Add($lines[$i])
            $openB = ([regex]::Matches($line, '\{')).Count
            $closeB = ([regex]::Matches($line, '\}')).Count
            $braceCount = $openB - $closeB

            $j = $i + 1
            if ($openB -eq 0) {
                while ($j -lt $lines.Length -and ($lines[$j] -replace '#.*$', '') -notmatch '\{') {
                    $blockLines.Add($lines[$j])
                    $j++
                }
                if ($j -lt $lines.Length) {
                    $cleanJ = $lines[$j] -replace '#.*$', ''
                    $blockLines.Add($lines[$j])
                    $braceCount += ([regex]::Matches($cleanJ, '\{')).Count - ([regex]::Matches($cleanJ, '\}')).Count
                    $j++
                }
            }

            while ($j -lt $lines.Length -and $braceCount -gt 0) {
                $cleanJ = $lines[$j] -replace '#.*$', ''
                $blockLines.Add($lines[$j])
                $braceCount += ([regex]::Matches($cleanJ, '\{')).Count - ([regex]::Matches($cleanJ, '\}')).Count
                $j++
            }

            $blockText = $blockLines -join "`r`n"
            $cleanBlock = $blockText -replace '(?m)#.*$', ''

            $nameM = [regex]::Match($cleanBlock, 'name\s*=\s*"([^"]+)"')
            $typesM = [regex]::Match($cleanBlock, 'division_types\s*=\s*\{([^}]*)\}')
            $fallbackM = [regex]::Match($cleanBlock, 'fallback_name\s*=\s*"([^"]+)"')
            $linkM = [regex]::Match($cleanBlock, 'link_numbering_with\s*=\s*\{([^}]*)\}')
            $orderedStats = Get-OrderedEntryStats -CleanBlock $cleanBlock

            $groups.Add([PSCustomObject]@{
                Tag          = $gtag
                Name         = if ($nameM.Success) { $nameM.Groups[1].Value } else { "N/A" }
                Types        = if ($typesM.Success) { ($typesM.Groups[1].Value -replace '\s+', ' ').Trim() } else { "N/A" }
                Fallback     = if ($fallbackM.Success) { $fallbackM.Groups[1].Value } else { "N/A" }
                Link         = if ($linkM.Success) { ($linkM.Groups[1].Value -replace '\s+', ' ').Trim() } else { $null }
                OrderedCount = $orderedStats.Count
                Malformed    = $orderedStats.Malformed
                Samples      = $orderedStats.Samples
                Raw          = $blockText
            })
            $i = $j
        } else {
            $i++
        }
    }

    if ($TargetGroup -and $TargetGroup.Count -gt 0) {
        $wanted = @($TargetGroup | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        $targetFound = @($groups | Where-Object { $wanted -contains $_.Tag })
        if ($targetFound.Count -eq 0) {
            Write-Err "Group(s) '$($wanted -join ', ')' not found in vanilla $Tag namelists!"
            exit 1
        }
        foreach ($tf in $targetFound) {
            Write-Host "`n--- Vanilla Excerpt: $($tf.Tag) ---" -ForegroundColor Cyan
            Write-Host $tf.Raw.Trim()
        }
        return
    }

    Write-Step "Vanilla Namelist Groups for $Tag ($($groups.Count) groups found):"
    foreach ($g in $groups) {
        $linkStr = if ($g.Link) { " [links: $($g.Link)]" } else { "" }
        $sampleStr = if ($g.Samples.Count -gt 0) { " (sample: $($g.Samples -join ', '))" } else { "" }
        Write-Host "[$($g.Tag)] `"$($g.Name)`"$linkStr" -ForegroundColor Yellow
        Write-Host "  Types:    $($g.Types)" -ForegroundColor Gray
        Write-Host "  Fallback: $($g.Fallback)" -ForegroundColor Gray
        Write-Host "  Ordered:  $($g.OrderedCount) entries$sampleStr" -ForegroundColor Gray
        if ($g.Malformed -gt 0) {
            Write-Host "  Malformed: $($g.Malformed) entries (broken quoting; see -Group $($g.Tag))" -ForegroundColor Red
        }
    }

    Write-Step "Checking scripted references across vanilla focus trees and scripted effects..."
    $refDirs = @(
        (Join-Path $hoi4Dir "common\national_focus"),
        (Join-Path $hoi4Dir "common\scripted_effects")
    )
    $refRegex = [regex]"division_names_group\s*=\s*($Tag[A-Z0-9_]*)"
    $foundRefs = [System.Collections.Generic.List[string]]::new()

    foreach ($rd in $refDirs) {
        if (-not (Test-Path $rd)) { continue }
        $files = Get-ChildItem -Path $rd -Filter *.txt -Recurse
        foreach ($f in $files) {
            $fLines = [System.IO.File]::ReadAllLines($f.FullName, [System.Text.Encoding]::UTF8)
            for ($ln = 0; $ln -lt $fLines.Length; $ln++) {
                $rm = $refRegex.Match($fLines[$ln])
                if ($rm.Success) {
                    $rel = $f.FullName.Substring($hoi4Dir.Length + 1)
                    $foundRefs.Add("  $($rel):$($ln + 1) -> division_names_group = $($rm.Groups[1].Value)")
                }
            }
        }
    }

    if ($foundRefs.Count -gt 0) {
        Write-Host "`nScripted references for $Tag* found:" -ForegroundColor Green
        foreach ($r in $foundRefs) {
            Write-Host $r -ForegroundColor Cyan
        }
    } else {
        Write-Info "No scripted references found in national_focus or scripted_effects for $Tag*."
    }
}

# --- Helper: Heuristic quality audit of an INEX namelist file ---
# Returns file-level flags plus per-group metrics and flags. Flags are hints for the
# hoi4-inex-namelist-audit skill, not invariant errors (those live in Invoke-Validation).
function Get-NamelistAuditData {
    param([string]$Path)

    $lines = [System.IO.File]::ReadAllLines($Path, [System.Text.Encoding]::UTF8)
    $rawText = $lines -join "`n"

    $fileFlags = [System.Collections.Generic.List[string]]::new()
    if ($rawText -match 'Is a new method of naming the divisions') {
        $fileFlags.Add('HEADER_BOILERPLATE')
    }

    $singularNouns = @('Division', 'Regiment', 'Brigade', 'Battalion', 'Squadron', 'Detachment', 'Band', 'Group')
    $todoRegex = '(?i)#.*\b(todo|fixme|placeholder|barely any info|very little info)\b'
    # Quoted string that tolerates escaped nickname quotes, e.g. "Lashkar-e 9-e Zerehi \"Kaveh\""
    $str = '"((?:[^"\\]|\\.)*)"'

    # Normalizes numbering so "1st Infantry Division", "%d Infantry Division" and "IV. Divizija" compare equal to their fallback pattern.
    $normalize = {
        param([string]$s)
        $n = $s -replace '%[ds]', '#'
        $n = $n -replace '\b\d+(st|nd|rd|th|e|er|re|a|o)?\b', '#'
        $n = $n -replace '\b[IVXLC]+\b', '#'
        return ($n -replace '\s+', ' ').Trim().ToLowerInvariant()
    }

    # Split the file into root-level group blocks (raw lines kept for comment checks)
    $blocks = [System.Collections.Generic.List[psobject]]::new()
    $inBlock = New-Object bool[] $lines.Length
    $depth = 0
    $current = $null
    for ($i = 0; $i -lt $lines.Length; $i++) {
        $clean = ($lines[$i] -replace '#.*$', '').Trim()
        if ($depth -eq 0 -and -not $current) {
            $gm = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
            if ($gm.Success -and $clean -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
                $current = [PSCustomObject]@{ Tag = $gm.Groups[1].Value; Lines = [System.Collections.Generic.List[string]]::new(); Opened = $false }
            }
        }
        if ($current) {
            $current.Lines.Add($lines[$i])
            $inBlock[$i] = $true
        }
        $opens = ([regex]::Matches($clean, '\{')).Count
        $depth += ($opens - ([regex]::Matches($clean, '\}')).Count)
        if ($current -and $opens -gt 0) { $current.Opened = $true }
        if ($current -and $current.Opened -and $depth -le 0) {
            $blocks.Add($current)
            $current = $null
            $depth = 0
        }
    }

    $groups = [System.Collections.Generic.List[psobject]]::new()
    foreach ($b in $blocks) {
        $rawBlock = $b.Lines -join "`n"
        $cleanBlock = $rawBlock -replace '(?m)#.*$', ''

        $nameM = [regex]::Match($cleanBlock, ('(?m)^\s*name\s*=\s*' + $str))
        $typesM = [regex]::Match($cleanBlock, 'division_types\s*=\s*\{([^}]*)\}')
        $fallbackM = [regex]::Match($cleanBlock, ('fallback_name\s*=\s*' + $str))
        $linkM = [regex]::Match($cleanBlock, 'link_numbering_with\s*=\s*\{([^}]*)\}')
        $orderedM = [regex]::Match($cleanBlock, 'ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')

        $selector = if ($nameM.Success) { $nameM.Groups[1].Value } else { $null }
        $fallback = if ($fallbackM.Success) { $fallbackM.Groups[1].Value } else { $null }
        $types = if ($typesM.Success) { @([regex]::Matches($typesM.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }) } else { @() }
        $links = if ($linkM.Success) { @([regex]::Matches($linkM.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }) } else { @() }

        $entries = @()
        if ($orderedM.Success) {
            $entries = @([regex]::Matches($orderedM.Groups['content'].Value, ('(\d+)\s*=\s*\{?\s*' + $str)) | ForEach-Object { $_.Groups[2].Value })
        }

        # An entry is a placeholder when it adds nothing over fallback_name or repeats another entry's pattern
        $fallbackNorm = if ($fallback) { & $normalize $fallback } else { $null }
        $normCounts = @{}
        foreach ($e in $entries) {
            $k = & $normalize $e
            if ($normCounts.ContainsKey($k)) { $normCounts[$k]++ } else { $normCounts[$k] = 1 }
        }
        $placeholderCount = 0
        foreach ($e in $entries) {
            $k = & $normalize $e
            if ($k -eq $fallbackNorm -or $normCounts[$k] -gt 1) { $placeholderCount++ }
        }
        $authoredCount = $entries.Count - $placeholderCount

        $flags = [System.Collections.Generic.List[string]]::new()
        if ($entries.Count -gt 0 -and ($placeholderCount / $entries.Count) -gt 0.5) { $flags.Add('PLACEHOLDER_ENTRIES') }
        if ($authoredCount -lt 10) { $flags.Add('LOW_DEPTH') }
        if ($selector) {
            $lastWord = ($selector.Trim() -split '\s+')[-1]
            if ($singularNouns -ccontains $lastWord) { $flags.Add('SELECTOR_SINGULAR') }
            if ($selector.Length -gt 28) { $flags.Add('SELECTOR_LONG') }
        }
        if ($rawBlock -match ('(?m)^\s*#\s*link_numbering_with\s*=\s*\{\s*' + [regex]::Escape($b.Tag) + '\s*\}')) {
            $flags.Add('DEAD_SELF_LINK_COMMENT')
        }
        if ($rawBlock -match $todoRegex) { $flags.Add('TODO_COMMENT') }
        if ($cleanBlock -match '\bhas_completed_focus\b') { $flags.Add('FOCUS_LOCKED') }
        # Outliers only: long honorific names are common and intentional (e.g. GER cavalry)
        if (@($entries | Where-Object { ($_ -replace '%[ds]', '10' -replace '\\"', '"').Length -gt 60 }).Count -gt 0) {
            $flags.Add('NAME_LONG')
        }

        $groups.Add([PSCustomObject]@{
            Tag           = $b.Tag
            Selector      = $selector
            DivisionTypes = $types
            Fallback      = $fallback
            LinkTargets   = $links
            OrderedCount  = $entries.Count
            AuthoredCount = $authoredCount
            PlainVariantOf = $null
            Entries       = $entries
            Flags         = $flags
            RawBlock      = $rawBlock
        })
    }

    # Plain variant: a fallback-only group kept beside a nicknamed sibling of the same
    # division type that shares its numbering (directly or through a common anchor)
    foreach ($g in $groups) {
        if ($g.OrderedCount -gt 0) { continue }
        $sibling = $groups | Where-Object {
            $h = $_
            $h.Tag -ne $g.Tag -and $h.AuthoredCount -gt 0 -and
            @($h.DivisionTypes | Where-Object { $g.DivisionTypes -contains $_ }).Count -gt 0 -and
            ($h.LinkTargets -contains $g.Tag -or $g.LinkTargets -contains $h.Tag -or
             @($h.LinkTargets | Where-Object { $g.LinkTargets -contains $_ }).Count -gt 0)
        } | Select-Object -First 1
        if ($sibling) {
            $g.PlainVariantOf = $sibling.Tag
            [void]$g.Flags.Remove('PLACEHOLDER_ENTRIES')
            [void]$g.Flags.Remove('LOW_DEPTH')
        }
    }

    # Cross-group checks
    $hasInfAnchor = @($groups | Where-Object { $_.Tag -match '_INF_01$' }).Count -gt 0
    $selectorCounts = $groups | Where-Object { $_.Selector } | Group-Object -Property Selector
    foreach ($g in $groups) {
        if ($g.Selector -and @($selectorCounts | Where-Object { $_.Name -ceq $g.Selector -and $_.Count -gt 1 }).Count -gt 0) {
            $g.Flags.Add('SELECTOR_DUPLICATE')
        }
        # A mobile group that other groups link to is a numbering anchor, not an orphan
        $isAnchor = @($groups | Where-Object { $_.LinkTargets -contains $g.Tag }).Count -gt 0
        if ($hasInfAnchor -and $g.Tag -match '_(MOT|MEC)_' -and $g.LinkTargets.Count -eq 0 -and -not $isAnchor) {
            $g.Flags.Add('UNLINKED_MOBILE')
        }
    }

    # Quoted identities ('Tali' or \"Tali\") reused across groups under different division
    # numbers. The same number carrying its nickname into another group (e.g. USA 1st Infantry
    # and 1st Motorized 'Big Red One') is intended lineage and not reported. Region reuse is
    # often intended too, so this is one file-level flag with the list, not per-group flags.
    $identityUses = @{}
    foreach ($g in $groups) {
        foreach ($e in $g.Entries) {
            $numM = [regex]::Match($e, '^\s*(\d+)')
            $num = if ($numM.Success) { $numM.Groups[1].Value } else { '-' }
            # Quotes must sit on word boundaries so apostrophes inside a nickname ('The King's Own') are kept
            foreach ($m in [regex]::Matches($e, "(?<![\p{L}\p{N}])'(.+?)'(?![\p{L}\p{N}])|\\""([^""\\]+)\\""")) {
                $id = if ($m.Groups[1].Success) { $m.Groups[1].Value } else { $m.Groups[2].Value }
                if (-not $identityUses.ContainsKey($id)) { $identityUses[$id] = [System.Collections.Generic.List[psobject]]::new() }
                $identityUses[$id].Add([PSCustomObject]@{ Tag = $g.Tag; Num = $num })
            }
        }
    }
    $sharedIdentities = @($identityUses.Keys | Sort-Object | ForEach-Object {
        $uses = $identityUses[$_]
        $tags = @($uses | ForEach-Object { $_.Tag } | Select-Object -Unique)
        # Unnumbered or %d-numbered entries cannot be compared, so they do not count as a different number
        $nums = @($uses | Where-Object { $_.Num -ne '-' } | ForEach-Object { $_.Num } | Select-Object -Unique)
        if ($tags.Count -gt 1 -and $nums.Count -gt 1) { [PSCustomObject]@{ Identity = $_; Groups = $tags } }
    })
    if ($sharedIdentities.Count -gt 0) { $fileFlags.Add('IDENTITY_REPEAT') }

    # Comments outside any group block (file header, section banners)
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if (-not $inBlock[$i] -and $lines[$i] -match $todoRegex) {
            $fileFlags.Add('TODO_COMMENT')
            break
        }
    }

    return [PSCustomObject]@{
        Path             = $Path
        FileFlags        = $fileFlags
        Groups           = $groups
        SharedIdentities = $sharedIdentities
    }
}

# --- Helper: Read a file's text at a git ref; $null if the ref or path does not exist ---
function Get-GitFileText {
    param([string]$RepoPath, [string]$Ref, [string]$RelPath)

    # Under 'Stop', PowerShell 5.1 turns native stderr into a terminating error even with 2>$null.
    # Native output is decoded with the console code page, so force UTF-8 to keep diacritics.
    $prevEap = $ErrorActionPreference
    $prevEncoding = [Console]::OutputEncoding
    $ErrorActionPreference = 'Continue'
    [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
    try {
        $out = & git -C $RepoPath show "${Ref}:$RelPath" 2>$null
        if ($LASTEXITCODE -ne 0) { return $null }
        return (@($out) -join "`n")
    } catch {
        return $null
    } finally {
        [Console]::OutputEncoding = $prevEncoding
        $ErrorActionPreference = $prevEap
    }
}

# --- Helper: Compare two audit snapshots of the same namelist file ---
# Gives reviewers tag/selector/link changes and only the added or changed name strings,
# instead of a raw diff.
function Compare-NamelistAuditData {
    param($Old, $New)

    $oldByTag = @{}
    foreach ($g in $Old.Groups) { $oldByTag[$g.Tag] = $g }
    $newTags = @($New.Groups | ForEach-Object { $_.Tag })

    $result = [PSCustomObject]@{
        RemovedTags  = @($Old.Groups | Where-Object { $newTags -notcontains $_.Tag } | ForEach-Object { $_.Tag })
        AddedTags    = @($New.Groups | Where-Object { -not $oldByTag.ContainsKey($_.Tag) } | ForEach-Object { $_.Tag })
        FieldChanges = [System.Collections.Generic.List[string]]::new()
        NewNames     = [System.Collections.Generic.List[psobject]]::new()
        RemovedNameCount = 0
    }

    foreach ($g in $New.Groups) {
        $o = $oldByTag[$g.Tag]
        $oldEntries = if ($o) { @($o.Entries) } else { @() }
        if ($o) {
            $fields = [ordered]@{
                selector = @($o.Selector, $g.Selector)
                types    = @(($o.DivisionTypes -join ' '), ($g.DivisionTypes -join ' '))
                fallback = @($o.Fallback, $g.Fallback)
                links    = @(($o.LinkTargets -join ' '), ($g.LinkTargets -join ' '))
            }
            foreach ($f in $fields.Keys) {
                if ($fields[$f][0] -cne $fields[$f][1]) {
                    $result.FieldChanges.Add("[$($g.Tag)] ${f}: '$($fields[$f][0])' -> '$($fields[$f][1])'")
                }
            }
        }
        foreach ($e in ($g.Entries | Select-Object -Unique)) {
            if ($oldEntries -cnotcontains $e) { $result.NewNames.Add([PSCustomObject]@{ Tag = $g.Tag; Name = $e }) }
        }
        $result.RemovedNameCount += @($oldEntries | Where-Object { @($g.Entries) -cnotcontains $_ }).Count
    }
    foreach ($t in $result.RemovedTags) { $result.RemovedNameCount += @($oldByTag[$t].Entries).Count }
    return $result
}

# --- Helper: Spelling-insensitive comparison key for a division or unit name ---
# Folds case, diacritics, spacing/punctuation, doubled letters and common orthographic variants
# (Gustav/Gustaf, Wasa/Vasa, Carl/Karl, Thor/Tor, y/i, ae/a).
# Kept ASCII-only for Windows PowerShell 5.1.
function Get-NameVariantKey {
    param([string]$Name)
    $s = $Name.ToLowerInvariant()
    $map = @{ 0x00E6 = 'ae'; 0x00F8 = 'o'; 0x0153 = 'oe'; 0x00DF = 'ss'; 0x0142 = 'l'; 0x0111 = 'd'; 0x00F0 = 'd'; 0x00FE = 'th'; 0x0131 = 'i' }
    foreach ($code in $map.Keys) { $s = $s.Replace([string][char]$code, $map[$code]) }
    $s = [regex]::Replace($s.Normalize([System.Text.NormalizationForm]::FormD), '\p{Mn}', '')
    $s = [regex]::Replace($s, '\b[ivx]+\b', [System.Text.RegularExpressions.MatchEvaluator] {
        param($m)
        if ($m.Value -notmatch '^x{0,3}(ix|iv|v?i{0,3})$') { return $m.Value }
        $total = 0; $prev = 0
        $vals = @{ [char]'i' = 1; [char]'v' = 5; [char]'x' = 10 }
        $chars = $m.Value.ToCharArray()
        for ($k = $chars.Count - 1; $k -ge 0; $k--) {
            $v = $vals[$chars[$k]]
            if ($v -lt $prev) { $total -= $v } else { $total += $v; $prev = $v }
        }
        return [string]$total
    })
    $s = $s -replace '[fv]\b', 'f'
    $s = $s -replace '[^a-z0-9]', ''
    $s = $s -replace 'ph', 'f' -replace 'th', 't' -replace 'w', 'v' -replace 'ck', 'k' -replace '[cq]', 'k' -replace 'z', 's' -replace 'y', 'i'
    $s = $s -replace 'ae', 'a' -replace 'oe', 'o' -replace 'ue', 'u'
    $s = $s -replace '([a-z])\1+', '$1'
    return $s
}

# --- Helper: Resolve a group name given as full tag or shorthand ---
function Resolve-GroupTag {
    param(
        [string]$Tag,
        [string]$Name,
        [string[]]$Known
    )
    $n = $Name.Trim().ToUpper()
    $cleanTag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    foreach ($cand in @($n, "${cleanTag}_$n", "INEX_${cleanTag}_$n", "${cleanTag}_${n}_01")) {
        if ($Known -contains $cand) { return $cand }
    }
    $suffixMatches = @($Known | Where-Object { $_ -match "_$([regex]::Escape($n))$" })
    if ($suffixMatches.Count -eq 1) { return $suffixMatches[0] }
    return $null
}

# --- Helper: Split a group's ordered block into comment-headed sections ---
function Get-GroupSections {
    param([string]$RawBlock)
    $m = [regex]::Match($RawBlock, '(?s)ordered\s*=\s*\{(.*)\}\s*\}?\s*$')
    if (-not $m.Success) {
        $m = [regex]::Match($RawBlock, '(?s)ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')
    }
    $sections = [System.Collections.Generic.List[psobject]]::new()
    if (-not $m.Success) { return @() }
    $content = if ($m.Groups['content'].Success) { $m.Groups['content'].Value } else { $m.Groups[1].Value }
    $current = [PSCustomObject]@{ Header = ''; Names = [System.Collections.Generic.List[string]]::new() }
    foreach ($line in ($content -split "`n")) {
        $t = $line.Trim()
        if ($t.StartsWith('#')) {
            if ($current.Header -or $current.Names.Count) { $sections.Add($current) }
            $current = [PSCustomObject]@{ Header = ($t -replace '^#+\s*', ''); Names = [System.Collections.Generic.List[string]]::new() }
            continue
        }
        $entryM = [regex]::Match($t, '\d+\s*=\s*(?:\{\s*"((?:[^"\\]|\\.)*)"\s*\}|"((?:[^"\\]|\\.)*)")')
        if ($entryM.Success) {
            $val = if ($entryM.Groups[1].Success) { $entryM.Groups[1].Value } else { $entryM.Groups[2].Value }
            $current.Names.Add($val)
        }
    }
    if ($current.Header -or $current.Names.Count) { $sections.Add($current) }
    return $sections.ToArray()
}

# --- Helper: Comment headers in an ordered block that no longer head any entry ---
function Get-OrphanHeaderLines {
    param([string[]]$Lines)
    $orphans = @()
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if (-not $Lines[$i].Trim().StartsWith('#')) { continue }
        $j = $i + 1
        while ($j -lt $Lines.Count -and -not $Lines[$j].Trim()) { $j++ }
        if ($j -ge $Lines.Count -or $Lines[$j].Trim().StartsWith('#')) { $orphans += $i }
    }
    return , $orphans
}

# --- Helper: Edit the ordered = { } block or metadata of one group in namelist text ---
function Edit-NamelistGroupText {
    param(
        [string]$Text,
        [string]$GroupTag,
        [string[]]$Add = @(),
        [string[]]$Remove = @(),
        [string[]]$Rename = @(),
        [string[]]$Set = @(),
        [string]$After,
        [string]$Section,
        [string[]]$RenameSection = @(),
        [string]$Selector,
        [string[]]$AddTypes = @(),
        [string[]]$RemoveTypes = @(),
        [string]$CanUse
    )

    if ($After -and $Section) { throw "Use -After or -Section, not both" }
    $nl = if ($Text.Contains("`r`n")) { "`r`n" } else { "`n" }
    $cr = if ($nl -eq "`r`n") { "`r" } else { '' }
    $headerText = { param($line) $line.Trim() -replace '^#+\s*', '' }
    $head = [regex]::Match($Text, "(?m)^[ \t]*$([regex]::Escape($GroupTag))[ \t]*=\s*\{")
    if (-not $head.Success) { throw "Group $GroupTag not found" }

    # Walk braces to find the ordered block and group bounds
    $depth = 0; $pos = $head.Index + $head.Length - 1; $blockEnd = -1
    $uStart = -1; $uEnd = -1
    for ($i = $pos; $i -lt $Text.Length; $i++) {
        $ch = $Text[$i]
        if ($ch -eq '#') { while ($i -lt $Text.Length -and $Text[$i] -ne "`n") { $i++ }; continue }
        if ($ch -eq '"') { $i++; while ($i -lt $Text.Length -and $Text[$i] -ne '"') { if ($Text[$i] -eq '\') { $i++ }; $i++ }; continue }
        if ($ch -eq '{') {
            $depth++
            if ($depth -eq 2 -and $uStart -lt 0 -and $Text.Substring($pos, $i - $pos) -match 'ordered\s*=\s*$') { $uStart = $i + 1 }
        } elseif ($ch -eq '}') {
            if ($depth -eq 2 -and $uStart -ge 0 -and $uEnd -lt 0) { $uEnd = $i }
            $depth--
            if ($depth -eq 0) { $blockEnd = $i; break }
        }
    }
    if ($blockEnd -lt 0) { throw "Group $GroupTag has unbalanced braces" }

    $hasOrderedEdits = ($Add.Count -gt 0 -or $Remove.Count -gt 0 -or $Rename.Count -gt 0 -or $Set.Count -gt 0 -or $RenameSection.Count -gt 0)
    if ($hasOrderedEdits -and ($uStart -lt 0 -or $uEnd -lt 0)) {
        throw "Group $GroupTag has no ordered = { } block"
    }

    $hasOrdered = ($uStart -ge 0 -and $uEnd -ge 0)
    $preBlock = if ($hasOrdered) { $Text.Substring($head.Index, $uStart - $head.Index) } else { $Text.Substring($head.Index, $blockEnd - $head.Index + 1) }

    # 1. Update Selector (name = "...")
    if ($Selector) {
        if ($preBlock -match '(?m)^([ \t]*name\s*=\s*)"[^"]*"') {
            $preBlock = [regex]::Replace($preBlock, '(?m)^([ \t]*name\s*=\s*)"[^"]*"', "`${1}`"$Selector`"")
        } else {
            $preBlock = [regex]::Replace($preBlock, "(?m)(^[ \t]*$([regex]::Escape($GroupTag))[ \t]*=\s*\{[ \t]*`r?`n)", "`${1}`tname = `"$Selector`"$nl")
        }
    }

    # 2. Update division_types
    if ($AddTypes.Count -gt 0 -or $RemoveTypes.Count -gt 0) {
        $validSubunits = @(
            'infantry', 'cavalry', 'motorized', 'mechanized', 'marine', 'mountaineers', 'paratrooper',
            'light_armor', 'medium_armor', 'heavy_armor', 'super_heavy_armor', 'modern_armor',
            'amphibious_armor', 'amphibious_mechanized', 'artillery', 'anti_air', 'anti_tank',
            'rocket_artillery', 'motorized_rocket_artillery', 'irregular_infantry', 'militia',
            'camelry', 'ranger_battalion', 'penal_battalion'
        )
        foreach ($t in $AddTypes) {
            if ($validSubunits -notcontains $t) {
                throw "Invalid division type token '$t'. Valid: $($validSubunits -join ', ')"
            }
        }
        $mTypes = [regex]::Match($preBlock, '(?m)^([ \t]*division_types\s*=\s*\{)([^}]*)(\})')
        if ($mTypes.Success) {
            $curTokens = [System.Collections.Generic.List[string]]::new()
            foreach ($tokMatch in [regex]::Matches($mTypes.Groups[2].Value, '"([^"]+)"')) {
                $curTokens.Add($tokMatch.Groups[1].Value)
            }
            foreach ($rt in $RemoveTypes) {
                while ($curTokens.Contains($rt)) { [void]$curTokens.Remove($rt) }
            }
            foreach ($at in $AddTypes) {
                if (-not $curTokens.Contains($at)) { $curTokens.Add($at) }
            }
            if ($curTokens.Count -eq 0) {
                throw "Edit would leave division_types empty in $GroupTag"
            }
            $formattedTypes = ($curTokens | ForEach-Object { "`"$_`"" }) -join ' '
            $replacementTypes = "$($mTypes.Groups[1].Value) $formattedTypes $($mTypes.Groups[3].Value)"
            $preBlock = $preBlock.Substring(0, $mTypes.Index) + $replacementTypes + $preBlock.Substring($mTypes.Index + $mTypes.Length)
        } elseif ($AddTypes.Count -gt 0) {
            $formattedTypes = ($AddTypes | ForEach-Object { "`"$_`"" }) -join ' '
            $typeBlock = "`tdivision_types = { $formattedTypes }$nl$nl"
            if ($preBlock -match '(?m)^[ \t]*fallback_name\s*=') {
                $preBlock = [regex]::Replace($preBlock, '(?m)(^[ \t]*fallback_name\s*=)', "$typeBlock`$1")
            } else {
                $preBlock += "$typeBlock"
            }
        }
    }

    # 3. Update can_use
    if ($CanUse) {
        if ($CanUse -match 'has_completed_focus|has_country_flag|has_idea') {
            throw "Strict Focus Ban: Namelists must not be gated behind focuses, ideas, or flags. Gate by government type (has_government) instead."
        }
        $canUseMatch = [regex]::Match($preBlock, '(?m)^([ \t]*can_use\s*=\s*\{)')
        $cuStart = -1; $cuEnd = -1
        if ($canUseMatch.Success) {
            $cuStart = $canUseMatch.Index
            $braceStart = $canUseMatch.Index + $canUseMatch.Length - 1
            $cuDepth = 1
            for ($k = $braceStart + 1; $k -lt $preBlock.Length; $k++) {
                $ch = $preBlock[$k]
                if ($ch -eq '#') { while ($k -lt $preBlock.Length -and $preBlock[$k] -ne "`n") { $k++ }; continue }
                if ($ch -eq '"') { $k++; while ($k -lt $preBlock.Length -and $preBlock[$k] -ne '"') { if ($preBlock[$k] -eq '\') { $k++ }; $k++ }; continue }
                if ($ch -eq '{') { $cuDepth++ }
                elseif ($ch -eq '}') {
                    $cuDepth--
                    if ($cuDepth -eq 0) { $cuEnd = $k; break }
                }
            }
        }

        $formattedCanUse = if ($CanUse.Contains("`n")) {
            "`tcan_use = {$nl$CanUse$nl`t}"
        } else {
            "`tcan_use = { $CanUse }"
        }

        if ($cuStart -ge 0 -and $cuEnd -ge 0) {
            $preBlock = $preBlock.Substring(0, $cuStart) + $formattedCanUse + $preBlock.Substring($cuEnd + 1)
        } else {
            if ($preBlock -match '(?m)^[ \t]*for_countries\s*=\s*\{[^}]*\}') {
                $preBlock = [regex]::Replace($preBlock, '(?m)(^[ \t]*for_countries\s*=\s*\{[^}]*\}[ \t]*`r?`n)', "`${1}$nl$formattedCanUse$nl")
            } elseif ($preBlock -match '(?m)^[ \t]*division_types\s*=') {
                $preBlock = [regex]::Replace($preBlock, '(?m)(^[ \t]*division_types\s*=)', "$formattedCanUse$nl$nl`$1")
            } else {
                $preBlock += "$nl$formattedCanUse$nl"
            }
        }
    }

    if (-not $hasOrdered) {
        return $Text.Substring(0, $head.Index) + $preBlock + $Text.Substring($blockEnd + 1)
    }

    $inner = $Text.Substring($uStart, $uEnd - $uStart)

    function Get-CurrentEntries([string]$block) {
        $clean = $block -replace '(?m)#.*$', ''
        $entries = [System.Collections.Generic.List[psobject]]::new()
        foreach ($m in [regex]::Matches($clean, '(\d+)\s*=\s*(?:\{\s*"((?:[^"\\]|\\.)*)"\s*\}|"((?:[^"\\]|\\.)*)")')) {
            $nameVal = if ($m.Groups[2].Success) { $m.Groups[2].Value } else { $m.Groups[3].Value }
            $entries.Add([PSCustomObject]@{ Index = [int]$m.Groups[1].Value; Name = $nameVal })
        }
        return $entries
    }

    $currentEntries = Get-CurrentEntries $inner
    $countOf = { param($n) @($currentEntries | Where-Object { $_.Name -ceq $n }).Count }
    $origLines = @($inner -split "`n")
    $orphansBefore = @((Get-OrphanHeaderLines -Lines $origLines) | ForEach-Object { & $headerText $origLines[$_] })

    # 1. RenameSection
    foreach ($pair in $RenameSection) {
        $parts = $pair -split '=', 2
        if ($parts.Count -ne 2 -or -not $parts[0].Trim() -or -not $parts[1].Trim()) { throw "RenameSection '$pair' must be Old=New" }
        $old = $parts[0].Trim(); $new = $parts[1].Trim()
        $lines = @($inner -split "`n")
        $hits = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($lines[$l].Trim().StartsWith('#') -and (& $headerText $lines[$l]) -ceq $old) { $l } })
        if ($hits.Count -ne 1) { throw "RenameSection: header '$old' found $($hits.Count) times in $GroupTag (expected 1)" }
        $indent = [regex]::Match($lines[$hits[0]], '^[ \t]*').Value
        $lines[$hits[0]] = "$indent# $new$cr"
        $inner = $lines -join "`n"
    }

    # 2. Rename
    foreach ($pair in $Rename) {
        $parts = $pair -split '=', 2
        if ($parts.Count -ne 2 -or -not $parts[0].Trim() -or -not $parts[1].Trim()) { throw "Rename '$pair' must be Old=New" }
        $old = $parts[0].Trim(); $new = $parts[1].Trim()
        if ((& $countOf $old) -ne 1) { throw "Rename: '$old' found $(& $countOf $old) times in $GroupTag (expected 1)" }
        if ((& $countOf $new) -gt 0) { throw "Rename: '$new' already exists in $GroupTag" }
        $inner = $inner.Replace("`"$old`"", "`"$new`"")
        $currentEntries = Get-CurrentEntries $inner
    }

    # 3. Set (Key=Value)
    foreach ($pair in $Set) {
        $parts = $pair -split '=', 2
        if ($parts.Count -ne 2 -or -not $parts[0].Trim() -or -not $parts[1].Trim()) { throw "Set '$pair' must be Index=NewName" }
        $idx = [int]$parts[0].Trim(); $val = $parts[1].Trim()
        $lines = @($inner -split "`n")
        $found = $false
        for ($l = 0; $l -lt $lines.Count; $l++) {
            $m = [regex]::Match($lines[$l], "^([ \t]*)$idx\s*=\s*(?:\{\s*`"[^`"]*`"\s*\}|`"[^`"]*`")(.*)$")
            if ($m.Success) {
                $indent = $m.Groups[1].Value
                $trailing = $m.Groups[2].Value
                $lines[$l] = "$indent$idx = { `"$val`" }$trailing"
                $found = $true
                break
            }
        }
        if (-not $found) {
            $indent = "`t`t"
            $inserted = $false
            for ($l = 0; $l -lt $lines.Count; $l++) {
                $m = [regex]::Match($lines[$l], '^[ \t]*(\d+)\s*=')
                if ($m.Success -and [int]$m.Groups[1].Value -gt $idx) {
                    $lines = @($lines[0..($l - 1)]) + @("$indent$idx = { `"$val`" }$cr") + @($lines[$l..($lines.Count - 1)])
                    $inserted = $true
                    break
                }
            }
            if (-not $inserted) {
                $lines += "$indent$idx = { `"$val`" }$cr"
            }
        }
        $inner = $lines -join "`n"
        $currentEntries = Get-CurrentEntries $inner
    }

    # 4. Remove
    foreach ($item in $Remove) {
        $lines = @($inner -split "`n")
        $drop = -1
        if ($item -match '^\d+$') {
            $targetIdx = [int]$item
            for ($l = 0; $l -lt $lines.Count; $l++) {
                if ($lines[$l] -match "^[ \t]*$targetIdx\s*=") { $drop = $l; break }
            }
            if ($drop -lt 0) { throw "Remove: index '$item' not found in $GroupTag" }
        } else {
            if ((& $countOf $item) -ne 1) { throw "Remove: '$item' found $(& $countOf $item) times in $GroupTag (expected 1)" }
            $q = [regex]::Escape("`"$item`"")
            for ($l = 0; $l -lt $lines.Count; $l++) {
                if ($lines[$l] -match $q -and -not $lines[$l].TrimStart().StartsWith('#')) { $drop = $l; break }
            }
        }
        if ($drop -ge 0) {
            $inner = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($l -ne $drop) { $lines[$l] } }) -join "`n"
            $currentEntries = Get-CurrentEntries $inner
        }
    }

    # 5. Add
    if ($Add.Count -gt 0) {
        $currentNames = @($currentEntries | ForEach-Object { $_.Name })
        $dupes = @($Add | Where-Object { $currentNames -contains $_ })
        if ($dupes.Count -gt 0) { throw "Add: already in ${GroupTag}: $($dupes -join ', ')" }
        $repeat = @($Add | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name })
        if ($repeat.Count -gt 0) { throw "Add: listed twice: $($repeat -join ', ')" }

        $entryLines = @($inner -split "`n" | Where-Object { $_ -match '^\s*\d+\s*=' })
        $indent = if ($entryLines.Count -gt 0) { [regex]::Match($entryLines[-1], '^[ \t]*').Value } else { "`t`t" }
        $existingIndices = @($currentEntries | ForEach-Object { $_.Index })
        $nextIdx = if ($existingIndices.Count -gt 0) { ([Math]::Max(0, ($existingIndices | Measure-Object -Max).Maximum) + 1) } else { 1 }

        $linesToAdd = [System.Collections.Generic.List[string]]::new()
        foreach ($name in $Add) {
            $idx = $nextIdx
            $entryVal = $name
            if ($name -match '^(\d+)\s*=\s*(.*)$') {
                $idx = [int]$matches[1]
                $entryVal = ($matches[2].Trim() -replace '^"(.*)"$', '$1')
            } elseif ($name -match '^(\d+)\.\s+(.*)$' -and $existingIndices -notcontains [int]$matches[1]) {
                $idx = [int]$matches[1]
            }
            if ($existingIndices -contains $idx) {
                $idx = ([Math]::Max(0, ($existingIndices | Measure-Object -Max).Maximum) + 1)
            }
            $existingIndices += $idx
            if ($idx -ge $nextIdx) { $nextIdx = $idx + 1 }
            $linesToAdd.Add("$indent$idx = { `"$entryVal`" }$cr")
        }

        $lines = @($inner -split "`n")
        $hits = if ($Section) { @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($lines[$l].Trim().StartsWith('#') -and (& $headerText $lines[$l]) -ceq $Section.Trim()) { $l } }) } else { @() }

        if ($After) {
            $afterHit = -1
            $qAfter = [regex]::Escape("`"$After`"")
            for ($l = 0; $l -lt $lines.Count; $l++) {
                if ($lines[$l] -match $qAfter -and -not $lines[$l].TrimStart().StartsWith('#')) { $afterHit = $l; break }
            }
            if ($afterHit -lt 0) { throw "After: '$After' not found in $GroupTag" }
            $lines = @($lines[0..$afterHit]) + $linesToAdd.ToArray() + @(if ($afterHit + 1 -lt $lines.Count) { $lines[($afterHit + 1)..($lines.Count - 1)] })
            $inner = $lines -join "`n"
        } elseif ($hits.Count -gt 1) {
            throw "Section: header '$Section' found $($hits.Count) times in $GroupTag (expected 1)"
        } elseif ($hits.Count -eq 1) {
            $at = $hits[0]
            for ($l = $hits[0] + 1; $l -lt $lines.Count -and -not $lines[$l].Trim().StartsWith('#'); $l++) { if ($lines[$l].Trim()) { $at = $l } }
            $lines = @($lines[0..$at]) + $linesToAdd.ToArray() + @(if ($at + 1 -lt $lines.Count) { $lines[($at + 1)..($lines.Count - 1)] })
            $inner = $lines -join "`n"
        } else {
            $newSectionLines = if ($Section) { @("$indent# $($Section.Trim())$cr") + $linesToAdd.ToArray() } else { $linesToAdd.ToArray() }
            $body = $inner.TrimEnd()
            $inner = $body + $nl + ($newSectionLines -join "`n") + $nl + "`t"
        }
        $currentEntries = Get-CurrentEntries $inner
    }

    if ($currentEntries.Count -eq 0) { throw "Edit would leave $GroupTag with an empty ordered block" }

    $lines = @($inner -split "`n")
    $dropHeaders = @((Get-OrphanHeaderLines -Lines $lines) | Where-Object { $orphansBefore -cnotcontains (& $headerText $lines[$_]) })
    if ($dropHeaders.Count -gt 0) {
        $lines = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($dropHeaders -notcontains $l) { $lines[$l] } })
        $inner = $lines -join "`n"
    }

    return $Text.Substring(0, $head.Index) + $preBlock + $inner + $Text.Substring($uEnd)
}

# --- Action: Edit one or more groups in a mod namelist in place ---
function Invoke-NamelistEdit {
    param(
        [string]$Tag,
        [string[]]$TargetGroup,
        [string]$AddList,
        [string]$RemoveList,
        [string]$RenameList,
        [string]$SetList,
        [string]$AfterName,
        [string]$SectionName,
        [string]$RenameSectionList,
        [string]$Selector,
        [string]$AddTypeList,
        [string]$RemoveTypeList,
        [string]$CanUse,
        [switch]$Quiet
    )
    $Tag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $modFile = Join-Path $RepoDir "common\units\names_divisions\INEX_${Tag}_names_divisions.txt"
    if (-not (Test-Path $modFile)) { Write-Err "Mod namelist not found: $modFile"; return 1 }

    $split = { param($s) @(if ($s) { $s -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ } }) }
    $adds = & $split $AddList
    $removes = & $split $RemoveList
    $renames = & $split $RenameList
    $sets = & $split $SetList
    $renameSections = & $split $RenameSectionList
    $addTypes = & $split $AddTypeList
    $removeTypes = & $split $RemoveTypeList

    $hasAction = ($adds.Count + $removes.Count + $renames.Count + $sets.Count + $renameSections.Count + $addTypes.Count + $removeTypes.Count) -gt 0 -or $Selector -or $CanUse
    if (-not $hasAction) {
        Write-Err "Nothing to do: pass -Add, -Remove, -Rename, -Set, -RenameSection, -Selector, -AddType, -RemoveType, and/or -CanUse"
        return 1
    }

    $wanted = @($TargetGroup | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    if ($wanted.Count -eq 0) {
        Write-Err "No -Group specified"
        return 1
    }

    $groupsData = Get-NamelistAuditData -Path $modFile
    $known = @($groupsData.Groups | ForEach-Object { $_.Tag })
    $resolvedGroups = [System.Collections.Generic.List[string]]::new()
    foreach ($w in $wanted) {
        $gt = Resolve-GroupTag -Tag $Tag -Name $w -Known $known
        if (-not $gt) {
            Write-Err "Group '$w' not found in $modFile. Available: $($known -join ', ')"
            return 1
        }
        if (-not $resolvedGroups.Contains($gt)) { $resolvedGroups.Add($gt) }
    }

    $text = [System.IO.File]::ReadAllText($modFile, [System.Text.Encoding]::UTF8)
    foreach ($groupTag in $resolvedGroups) {
        try {
            $text = Edit-NamelistGroupText -Text $text -GroupTag $groupTag -Add $adds -Remove $removes -Rename $renames -Set $sets -After $AfterName -Section $SectionName -RenameSection $renameSections -Selector $Selector -AddTypes $addTypes -RemoveTypes $removeTypes -CanUse $CanUse
        } catch {
            Write-Err "${groupTag}: $($_.Exception.Message)"
            return 1
        }
    }

    [System.IO.File]::WriteAllText($modFile, $text, (New-Object System.Text.UTF8Encoding $false))

    $updatedData = Get-NamelistAuditData -Path $modFile
    foreach ($groupTag in $resolvedGroups) {
        $g = $updatedData.Groups | Where-Object { $_.Tag -eq $groupTag }
        $metaChanges = @()
        if ($Selector) { $metaChanges += "Selector='$Selector'" }
        if ($addTypes.Count) { $metaChanges += "+Types: $($addTypes -join ', ')" }
        if ($removeTypes.Count) { $metaChanges += "-Types: $($removeTypes -join ', ')" }
        if ($CanUse) { $metaChanges += "CanUse='$CanUse'" }
        $metaStr = if ($metaChanges.Count) { " [" + ($metaChanges -join '; ') + "]" } else { '' }
        Write-Host "Edited ${groupTag}: +$($adds.Count) -$($removes.Count) ~$($renames.Count + $sets.Count)$metaStr" -ForegroundColor Green
        if (-not $Quiet -and $g) {
            $label = if ($g.Selector) { " `"$($g.Selector)`"" } else { '' }
            Write-Host "$($g.Tag) ($($g.OrderedCount)/$($g.AuthoredCount))${label}: $($g.Entries -join '; ')"
        }
    }
    return 0
}

# --- Helper: Compare two group sets ---
function Compare-NamelistGroupSets {
    param(
        [object[]]$Old,
        [object[]]$New
    )

    $oldByTag = @{}
    foreach ($g in $Old) { $oldByTag[$g.Tag] = $g }
    $newByTag = @{}
    foreach ($g in $New) { $newByTag[$g.Tag] = $g }

    $allTags = [System.Collections.Generic.List[string]]::new()
    foreach ($g in $Old) { if (-not $allTags.Contains($g.Tag)) { $allTags.Add($g.Tag) } }
    foreach ($g in $New) { if (-not $allTags.Contains($g.Tag)) { $allTags.Add($g.Tag) } }

    $result = [System.Collections.Generic.List[psobject]]::new()
    foreach ($t in $allTags) {
        $hasOld = $oldByTag.ContainsKey($t)
        $hasNew = $newByTag.ContainsKey($t)
        $o = if ($hasOld) { $oldByTag[$t] } else { $null }
        $n = if ($hasNew) { $newByTag[$t] } else { $null }
        $oNames = if ($hasOld) { @($o.Entries) } else { @() }
        $nNames = if ($hasNew) { @($n.Entries) } else { @() }

        $status = if (-not $hasOld) { 'added' } elseif (-not $hasNew) { 'removed' } else { 'unchanged' }
        $added = @($nNames | Where-Object { $oNames -cnotcontains $_ })
        $removed = @($oNames | Where-Object { $nNames -cnotcontains $_ })
        $attrs = [System.Collections.Generic.List[string]]::new()

        if ($hasOld -and $hasNew) {
            if ($o.Selector -cne $n.Selector) { $attrs.Add("selector: '$($o.Selector)' -> '$($n.Selector)'") }
            $oTypes = ($o.DivisionTypes -join ' ')
            $nTypes = ($n.DivisionTypes -join ' ')
            if ($oTypes -cne $nTypes) { $attrs.Add("division_types: [$oTypes] -> [$nTypes]") }
            if ($o.Fallback -cne $n.Fallback) { $attrs.Add("fallback: '$($o.Fallback)' -> '$($n.Fallback)'") }
            $oLinks = ($o.LinkTargets -join ' ')
            $nLinks = ($n.LinkTargets -join ' ')
            if ($oLinks -cne $nLinks) { $attrs.Add("links: [$oLinks] -> [$nLinks]") }
            if ($added.Count -or $removed.Count -or $attrs.Count -or ($oNames.Count -ne $nNames.Count)) { $status = 'modified' }
        }

        $result.Add([PSCustomObject]@{
            GroupTag   = $t
            Status     = $status
            OldCount   = $oNames.Count
            NewCount   = $nNames.Count
            Added      = $added
            Removed    = $removed
            Attributes = $attrs
        })
    }
    return , $result.ToArray()
}

# --- Helper: Render a group comparison as compact report lines ---
function Format-NamelistDiff {
    param(
        [object[]]$Diff,
        [string]$Tag,
        [string]$BaseLabel
    )
    $cleanTag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $short = { param($t) $t -replace "^$([regex]::Escape($cleanTag))_", '' }
    $changed = @($Diff | Where-Object { $_.Status -ne 'unchanged' })
    $same = @($Diff | Where-Object { $_.Status -eq 'unchanged' })
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add("Name diff $Tag ($BaseLabel -> working tree): $($changed.Count) changed, $($same.Count) unchanged")

    foreach ($d in $changed) {
        $name = & $short $d.GroupTag
        switch ($d.Status) {
            'added'   { $lines.Add("$name (new group, $($d.NewCount)): + $($d.Added -join '; ')") }
            'removed' { $lines.Add("$name (group removed, had $($d.OldCount))") }
            default {
                $line = "$name $($d.OldCount)->$($d.NewCount):"
                if ($d.Added.Count) { $line += " + $($d.Added -join '; ')" }
                if ($d.Added.Count -and $d.Removed.Count) { $line += ' |' }
                if ($d.Removed.Count) { $line += " - $($d.Removed -join '; ')" }
                $lines.Add($line)
            }
        }
        foreach ($a in $d.Attributes) { $lines.Add("  $a") }
    }

    $moves = @(foreach ($from in $Diff) {
        foreach ($nm in $from.Removed) {
            foreach ($to in $Diff) {
                if ($to.GroupTag -ne $from.GroupTag -and $to.Added -ccontains $nm) { "$nm ($(& $short $from.GroupTag)->$(& $short $to.GroupTag))" }
            }
        }
    })
    if ($moves.Count) { $lines.Add("Moved: $($moves -join '; ')") }
    if ($same.Count) { $lines.Add("Unchanged: $(($same | ForEach-Object { & $short $_.GroupTag }) -join ', ')") }
    return , $lines.ToArray()
}

# --- Helper: Group comparison of a TAG's working-tree namelist against a git revision ---
function Get-TagNamelistDiff {
    param(
        [string]$Tag,
        [string]$BaseRev = 'HEAD'
    )
    $Tag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $rel = "common/units/names_divisions/INEX_${Tag}_names_divisions.txt"
    $modFile = Join-Path $RepoDir $rel
    if (-not (Test-Path $modFile)) { throw "Mod namelist not found: $modFile" }

    $null = & git -C $RepoDir rev-parse --verify --quiet "${BaseRev}^{commit}"
    if ($LASTEXITCODE -ne 0) { throw "Unknown git revision: $BaseRev" }

    $oldGroups = @()
    $label = $BaseRev
    $oldText = Get-GitFileText -RepoPath $RepoDir -Ref $BaseRev -RelPath $rel
    if ($null -eq $oldText) {
        $label = "$BaseRev, file absent"
    } else {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($tempFile, $oldText, (New-Object System.Text.UTF8Encoding $false))
            $oldData = Get-NamelistAuditData -Path $tempFile
            $oldGroups = $oldData.Groups
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
    $newData = Get-NamelistAuditData -Path $modFile
    return @{ Diff = (Compare-NamelistGroupSets -Old $oldGroups -New $newData.Groups); Label = $label; Groups = $newData.Groups }
}

# --- Action: Name-level diff of a mod namelist against a git revision ---
function Invoke-NamelistDiff {
    param(
        [string]$Tag,
        [string]$BaseRev = 'HEAD'
    )
    $Tag = $Tag.ToUpper().Trim()
    try { $result = Get-TagNamelistDiff -Tag $Tag -BaseRev $BaseRev } catch { Write-Err $_.Exception.Message; return 1 }
    foreach ($line in (Format-NamelistDiff -Diff $result.Diff -Tag $Tag -BaseLabel $result.Label)) { Write-Host $line }
    return 0
}

# --- Helper: Country name of a TAG from its README row ---
function Get-CountryName {
    param([string]$Tag)
    $readmePath = Join-Path $RepoDir 'README.md'
    if (-not (Test-Path $readmePath)) { return $null }
    $readme = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
    $cleanTag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    if ($cleanTag -eq 'GER_SS') { return 'Germany-Waffen-SS' }
    if ($cleanTag -eq 'GER_ADDITIONAL') { return 'Germany-Additional' }
    if ($cleanTag.StartsWith('GER')) { return 'Germany' }

    $pattern = "\|\s*``?" + [regex]::Escape($cleanTag) + "``?\s*\|\s*([^|\r\n]+?)\s*\|"
    $m = [regex]::Match($readme, $pattern)
    if ($m.Success) {
        $c = $m.Groups[1].Value.Trim()
        if ($c -match '^([^/]+)') { return $matches[1].Trim() }
        return $c
    }
    return $null
}

# --- Helper: Markdown change table (plan section) from a group comparison ---
function Format-PlanChangeTable {
    param(
        [object[]]$Diff,
        [string]$Tag
    )
    $cleanTag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $short = { param($t) $t -replace "^$([regex]::Escape($cleanTag))_", '' }
    $changed = @($Diff | Where-Object { $_.Status -ne 'unchanged' })
    $same = @($Diff | Where-Object { $_.Status -eq 'unchanged' })
    if ($changed.Count -eq 0) { return , @('No name changes versus the base revision.') }

    $movedTo = @{}; $movedFrom = @{}
    foreach ($from in $Diff) {
        foreach ($nm in $from.Removed) {
            foreach ($to in $Diff) {
                if ($to.GroupTag -ne $from.GroupTag -and $to.Added -ccontains $nm) {
                    $movedTo["$($from.GroupTag)|$nm"] = & $short $to.GroupTag
                    $movedFrom["$($to.GroupTag)|$nm"] = & $short $from.GroupTag
                }
            }
        }
    }

    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add('| Group | Count | Added | Removed | Other |')
    $lines.Add('|---|---|---|---|---|')
    foreach ($d in $changed) {
        $count = switch ($d.Status) { 'added' { "new, $($d.NewCount)" } 'removed' { "removed, had $($d.OldCount)" } default { "$($d.OldCount) -> $($d.NewCount)" } }
        $added = @($d.Added | ForEach-Object { $k = "$($d.GroupTag)|$_"; if ($movedFrom.ContainsKey($k)) { "$_ (from $($movedFrom[$k]))" } else { $_ } })
        $removed = @($d.Removed | ForEach-Object { $k = "$($d.GroupTag)|$_"; if ($movedTo.ContainsKey($k)) { "$_ (to $($movedTo[$k]))" } else { $_ } })
        $cell = { param($items) if ($items.Count) { $items -join ', ' } else { '-' } }
        $other = if ($d.Attributes.Count) { $d.Attributes -join '; ' } else { '-' }
        $lines.Add("| $(& $short $d.GroupTag) | $count | $(& $cell $added) | $(& $cell $removed) | $other |")
    }
    if ($same.Count) { $lines.Add(''); $lines.Add("Unchanged: $(($same | ForEach-Object { & $short $_.GroupTag }) -join ', ')") }
    return , $lines.ToArray()
}

# --- Helper: Replace the generated change table between the plan's markers ---
function Set-PlanChangeTable {
    param(
        [string]$PlanText,
        [string[]]$TableLines
    )
    $nl = if ($PlanText.Contains("`r`n")) { "`r`n" } else { "`n" }
    $begin = [regex]::Match($PlanText, '<!-- BEGIN CHANGE TABLE[^\r\n]*-->')
    $end = [regex]::Match($PlanText, '<!-- END CHANGE TABLE -->')
    if (-not $begin.Success -or -not $end.Success -or $end.Index -lt $begin.Index) { throw "Plan has no BEGIN/END CHANGE TABLE markers" }
    $head = $PlanText.Substring(0, $begin.Index + $begin.Length)
    return $head + $nl + ($TableLines -join $nl) + $nl + $PlanText.Substring($end.Index)
}

# --- Helper: Audit plan skeleton ---
function New-AuditPlanText {
    param(
        [string]$Country,
        [string]$Tag,
        [string]$Date,
        [string[]]$FindingLines,
        [string]$Summary,
        [string[]]$TableLines
    )
    $l = [System.Collections.Generic.List[string]]::new()
    $l.Add("# $Country ($Tag) Namelist Audit - $Date"); $l.Add('')
    $l.Add("File: ``common/units/names_divisions/INEX_${Tag}_names_divisions.txt``"); $l.Add('')
    $l.Add("## Initial report (``-Audit $Tag``)")
    $l.Add("- $Summary")
    foreach ($f in $FindingLines) { $l.Add("- $f") }
    $l.Add('- Found on manual review: <!-- TODO: issues the script cannot see, or "none" -->'); $l.Add('')
    $l.Add('## User decisions'); $l.Add('<!-- TODO: checkpoint answers, or "None required" -->'); $l.Add('')
    $l.Add('## Research'); $l.Add('<!-- TODO: dispatches (agent, web calls used) and main sources -->'); $l.Add('')
    $l.Add('## Per-group changes')
    $l.Add('<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->')
    foreach ($t in $TableLines) { $l.Add($t) }
    $l.Add('<!-- END CHANGE TABLE -->'); $l.Add('')
    $l.Add('## Rationale'); $l.Add('<!-- TODO: organization applied, why names moved, respellings -->'); $l.Add('')
    $l.Add('## Verified formations & commanders'); $l.Add('<!-- TODO: every formation and commander the file keeps, legacy included: source or "well documented" -->'); $l.Add('')
    $l.Add('## Author confirmation'); $l.Add('<!-- TODO: unverified entries kept pending author confirmation, or "None" -->'); $l.Add('')
    $l.Add('## Kept on judgment'); $l.Add('<!-- TODO: remaining flags kept, each with its reason, or "None" -->'); $l.Add('')
    $l.Add('## Review'); $l.Add('<!-- TODO: reviewer verdict and how each Critical/Important finding was handled -->')
    return ($l -join "`n") + "`n"
}

# --- Action: Create an audit plan skeleton, or refresh its generated change table ---
function Invoke-AuditPlan {
    param(
        [string]$Tag,
        [string]$BaseRev = 'HEAD'
    )
    $Tag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $country = Get-CountryName -Tag $Tag
    if (-not $country) { Write-Err "README.md has no row for $Tag"; return 1 }
    try { $result = Get-TagNamelistDiff -Tag $Tag -BaseRev $BaseRev } catch { Write-Err $_.Exception.Message; return 1 }
    $table = Format-PlanChangeTable -Diff $result.Diff -Tag $Tag
    $changedCount = @($result.Diff | Where-Object { $_.Status -ne 'unchanged' }).Count

    $plansDir = Join-Path $RepoDir 'docs\superpowers\plans'
    if (-not (Test-Path $plansDir)) { New-Item -ItemType Directory -Force $plansDir | Out-Null }
    $date = (Get-Date).ToString('yyyy-MM-dd')
    $slug = $country.ToLower() -replace ' ', '-'
    $path = Join-Path $plansDir "$date-$slug-audit.md"
    $rel = "docs/superpowers/plans/$date-$slug-audit.md"
    $utf8 = New-Object System.Text.UTF8Encoding $false

    if (Test-Path $path) {
        $text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        try { $text = Set-PlanChangeTable -PlanText $text -TableLines $table } catch { Write-Err "${rel}: $($_.Exception.Message)"; return 1 }
        [System.IO.File]::WriteAllText($path, $text, $utf8)
        $verb = 'Refreshed change table in'
    } else {
        $target = Join-Path $RepoDir "common\units\names_divisions\INEX_${Tag}_names_divisions.txt"
        $data = Get-NamelistAuditData -Path $target
        $findingLines = @(foreach ($g in $data.Groups) {
            if ($g.Flags.Count -gt 0) { "[$($g.Tag)] flags: $($g.Flags -join ', ')" }
        })
        $summary = "AUDIT SUMMARY ${Tag}: GROUPS=$($data.Groups.Count) AUTHORED=$((($data.Groups | Measure-Object -Property AuthoredCount -Sum).Sum))/((($data.Groups | Measure-Object -Property OrderedCount -Sum).Sum))"
        $text = New-AuditPlanText -Country $country -Tag $Tag -Date $date -FindingLines $findingLines -Summary $summary -TableLines $table
        [System.IO.File]::WriteAllText($path, $text, $utf8)
        $verb = 'Created'
    }
    $todos = ([regex]::Matches($text, '<!-- TODO')).Count
    Write-Host "$verb ${rel}: $changedCount changed group(s) vs $($result.Label); $todos TODO section(s) left"
    return 0
}

# --- Helper: Refresh the group rows of a nation's wiki page ---
function Update-WikiGroupRows {
    param(
        [string]$WikiText,
        [object[]]$Groups,
        [string]$Tag
    )
    $cleanTag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $byTag = @{}; foreach ($g in $Groups) { $byTag[$g.Tag] = $g }
    $changes = [System.Collections.Generic.List[string]]::new()
    $stale = [System.Collections.Generic.List[string]]::new()
    $seen = @{}
    $lines = @($WikiText -split "`n")

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $cr = if ($lines[$i].EndsWith("`r")) { "`r" } else { '' }
        $raw = $lines[$i].TrimEnd("`r")

        # Heading sync: ### `TAG` - <Selector> [(<Native>)]
        $mHead = [regex]::Match($raw, '^###\s+`([A-Z0-9_]+)`\s*(?:--|\u2014|\xe2\x80\x94|-)\s*(.*)$')
        if ($mHead.Success) {
            $headTag = $mHead.Groups[1].Value
            $g = $byTag[$headTag]
            if ($g -and $g.Selector) {
                $curTitle = $mHead.Groups[2].Value.Trim()
                if ($curTitle -cne $g.Selector) {
                    $mParen = [regex]::Match($curTitle, '^(.*?)\s*(\([^)]+\))$')
                    $newTitle = if ($mParen.Success -and -not $g.Selector.Contains('(')) {
                        "$($g.Selector) $($mParen.Groups[2].Value)"
                    } else {
                        $g.Selector
                    }
                    if ($curTitle -cne $newTitle) {
                        $dash = [char]0x2014
                        $lines[$i] = "### ``$headTag`` $dash $newTitle$cr"
                        $changes.Add("$headTag heading: '$curTitle' -> '$newTitle'")
                    }
                }
            }
            continue
        }

        $m = [regex]::Match($raw, "^\|\s*``([A-Z0-9_]+)``\s*\|")
        if (-not $m.Success) { continue }
        $tagName = $m.Groups[1].Value
        $seen[$tagName] = $true
        $g = $byTag[$tagName]
        if (-not $g) { $stale.Add($tagName); continue }

        $cells = $raw.Split('|')
        if ($cells.Count -lt 5) { continue }
        $notes = @()

        # Cell 2: UI Name / Selector
        if ($g.Selector -and $cells[2].Trim() -cne $g.Selector) {
            $notes += "name '$($cells[2].Trim())' -> '$($g.Selector)'"
            $cells[2] = " $($g.Selector) "
        }

        # Cell 3: Division types
        $typesStr = ($g.DivisionTypes -join ', ')
        if ($typesStr -and $cells[3].Trim() -cne $typesStr) {
            $notes += "types '$($cells[3].Trim())' -> '$typesStr'"
            $cells[3] = " $typesStr "
        }

        # Cell 4: Fallback
        if ($g.Fallback) {
            $currentFb = $cells[4].Trim() -replace '^`([^`]+)`$', '$1'
            if ($currentFb -cne $g.Fallback) {
                $notes += "fallback '$currentFb' -> '$($g.Fallback)'"
                $cells[4] = " ``$($g.Fallback)`` "
            }
        }

        if ($notes.Count) {
            $lines[$i] = ($cells -join '|') + $cr
            $changes.Add("$tagName`: $($notes -join '; ')")
        }
    }
    $missing = @($Groups | Where-Object { -not $seen.ContainsKey($_.Tag) } | ForEach-Object { $_.Tag })
    return @{ Text = ($lines -join "`n"); Changes = $changes.ToArray(); Missing = $missing; Stale = $stale.ToArray() }
}

# --- Helper: Prose lines of a wiki page that mention changed names ---
function Find-WikiProseMentions {
    param(
        [string]$WikiText,
        [string[]]$Names,
        [string]$Tag,
        [hashtable]$Labels = @{}
    )
    $out = [System.Collections.Generic.List[string]]::new()
    $patterns = @($Names | Select-Object -Unique | ForEach-Object { @{ Name = $_; Rx = '(?<![\p{L}\p{N}])' + [regex]::Escape($_) + '(?![\p{L}\p{N}])' } })
    $lines = @($WikiText -split "`n")
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $raw = $lines[$i].TrimEnd("`r")
        if ($raw -match "^\|\s*``") { continue }
        $hits = @($patterns | Where-Object { $raw -cmatch $_.Rx } | ForEach-Object { if ($Labels.ContainsKey($_.Name)) { "$($_.Name) ($($Labels[$_.Name]))" } else { $_.Name } })
        if ($hits.Count) { $out.Add("L$($i + 1): $($hits -join ', ')") }
    }
    return , $out.ToArray()
}

# --- Action: Sync a nation's wiki page rows and its wiki/Home.md group count with the namelist ---
function Invoke-SyncWiki {
    param([string]$Tag)
    $Tag = $Tag.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''
    $modFile = Join-Path $RepoDir "common\units\names_divisions\INEX_${Tag}_names_divisions.txt"
    if (-not (Test-Path $modFile)) { Write-Err "Mod namelist not found: $modFile"; return 1 }
    $country = Get-CountryName -Tag $Tag
    if (-not $country) { Write-Err "README.md has no row for $Tag"; return 1 }

    $wikiPath = Join-Path $RepoDir "wiki\$country.md"
    if (-not (Test-Path $wikiPath)) {
        $alt = $country -replace ' ', '-'
        $wikiPath = Join-Path $RepoDir "wiki\$alt.md"
    }
    if (-not (Test-Path $wikiPath)) { Write-Err "wiki file not found for '$country'"; return 1 }

    $groupsData = Get-NamelistAuditData -Path $modFile
    $groups = $groupsData.Groups
    $utf8 = New-Object System.Text.UTF8Encoding $false

    $wiki = [System.IO.File]::ReadAllText($wikiPath, [System.Text.Encoding]::UTF8)
    $r = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag $Tag
    if ($r.Text -cne $wiki) { [System.IO.File]::WriteAllText($wikiPath, $r.Text, $utf8) }
    Write-Host "$([System.IO.Path]::GetFileName($wikiPath)): $($r.Changes.Count) row(s) updated"
    foreach ($c in $r.Changes) { Write-Host "  $c" }
    if ($r.Missing.Count) { Write-Host "  no row in wiki table (add by hand): $($r.Missing -join ', ')" }
    if ($r.Stale.Count) { Write-Host "  stale row in wiki table (remove by hand): $($r.Stale -join ', ')" }

    $diff = $null
    try { $diff = Get-TagNamelistDiff -Tag $Tag -BaseRev 'HEAD' } catch { Write-Host "  prose check skipped: $($_.Exception.Message)" }
    if ($diff) {
        $short = { param($t) $t -replace "^$([regex]::Escape($Tag))_", '' }
        $labels = @{}
        foreach ($from in $diff.Diff) {
            foreach ($nm in $from.Removed) {
                $to = @($diff.Diff | Where-Object { $_.GroupTag -ne $from.GroupTag -and $_.Added -ccontains $nm } | ForEach-Object { & $short $_.GroupTag })
                $labels[$nm] = if ($to.Count) { "moved $(& $short $from.GroupTag)->$($to -join '/')" } else { "removed from $(& $short $from.GroupTag)" }
            }
        }
        $mentions = if ($labels.Count) { Find-WikiProseMentions -WikiText $r.Text -Names @($labels.Keys) -Tag $Tag -Labels $labels } else { @() }
        if ($mentions.Count) {
            Write-Host "  prose mentioning names removed or moved since HEAD (review only these lines):"
            foreach ($m in $mentions) { Write-Host "    $m" }
        }
    }

    $homePath = Join-Path $RepoDir 'wiki\Home.md'
    if (Test-Path $homePath) {
        $homeText = [System.IO.File]::ReadAllText($homePath, [System.Text.Encoding]::UTF8)
        $pattern = "(\|\s*``?$([regex]::Escape($Tag))``?\s*\|\s*)(\d+)(\s*\|)"
        $m = [regex]::Match($homeText, $pattern)
        if (-not $m.Success) {
            Write-Host "wiki/Home.md: no $Tag row"
        } elseif ([int]$m.Groups[2].Value -ne $groups.Count) {
            $homeText = $homeText.Substring(0, $m.Groups[2].Index) + $groups.Count + $homeText.Substring($m.Groups[2].Index + $m.Groups[2].Length)
            [System.IO.File]::WriteAllText($homePath, $homeText, $utf8)
            Write-Host "wiki/Home.md: $Tag group count $($m.Groups[2].Value) -> $($groups.Count)"
        } else {
            Write-Host "wiki/Home.md: $Tag group count $($groups.Count) (unchanged)"
        }
    }
    return 0
}

# --- Action: Audit namelist quality ---
function Invoke-NamelistAudit {
    param(
        [string]$Key,
        [string]$CompareRef,
        [string[]]$TargetGroup,
        [switch]$NamesOnly,
        [switch]$Sections
    )

    $namelistDir = Join-Path $RepoDir "common\units\names_divisions"
    $Key = $Key.ToUpper().Trim() -replace '^INEX_', '' -replace '_NAMES_DIVISIONS(\.TXT)?$', ''

    if ($Key -eq 'ALL') {
        Write-Step "Namelist quality triage (most flags first)"
        $rows = foreach ($f in (Get-ChildItem -Path $namelistDir -Filter "INEX_*_names_divisions.txt")) {
            $data = Get-NamelistAuditData -Path $f.FullName
            $ordered = ($data.Groups | Measure-Object -Property OrderedCount -Sum).Sum
            $authored = ($data.Groups | Measure-Object -Property AuthoredCount -Sum).Sum
            $flagCount = $data.FileFlags.Count + ($data.Groups | ForEach-Object { $_.Flags.Count } | Measure-Object -Sum).Sum
            $lastCommit = (& git -C $RepoDir log -1 --format=%ad --date=short -- $f.FullName 2>$null)
            [PSCustomObject]@{
                Key        = ($f.Name -replace '^INEX_', '' -replace '_names_divisions\.txt$', '')
                Groups     = $data.Groups.Count
                Authored   = if ($ordered -gt 0) { "{0}/{1} ({2:P0})" -f $authored, $ordered, ($authored / $ordered) } else { "0/0" }
                Flags      = $flagCount
                LastCommit = if ($lastCommit) { $lastCommit } else { "n/a" }
            }
        }
        $rows | Sort-Object -Property @{ Expression = 'Flags'; Descending = $true }, Key | Format-Table -AutoSize | Out-String | Write-Host
        Write-Info "Run -Audit <KEY> for per-group details."
        return
    }

    $target = Join-Path $namelistDir "INEX_${Key}_names_divisions.txt"
    if (-not (Test-Path $target)) {
        Write-Err "No namelist file for key '$Key' (expected $target)."
        $keys = Get-ChildItem -Path $namelistDir -Filter "INEX_*_names_divisions.txt" | ForEach-Object { $_.Name -replace '^INEX_', '' -replace '_names_divisions\.txt$', '' }
        Write-Info "Available keys: $($keys -join ', '), ALL"
        exit 1
    }

    $data = Get-NamelistAuditData -Path $target

    if ($TargetGroup -or $NamesOnly) {
        $selected = $data.Groups
        if ($TargetGroup) {
            $known = @($data.Groups | ForEach-Object { $_.Tag })
            $wanted = @($TargetGroup | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
            $resolved = @($wanted | ForEach-Object { Resolve-GroupTag -Tag $Key -Name $_ -Known $known })
            $missing = @(for ($i = 0; $i -lt $wanted.Count; $i++) { if (-not $resolved[$i]) { $wanted[$i] } })
            if ($missing.Count -gt 0) {
                Write-Err "Group(s) not found: $($missing -join ', '). Available: $(($data.Groups | ForEach-Object { $_.Tag }) -join ', ')"
            }
            $selected = @($data.Groups | Where-Object { $resolved -contains $_.Tag })
        }
        foreach ($g in $selected) {
            if ($NamesOnly) {
                $label = if ($g.Selector) { " `"$($g.Selector)`"" } else { '' }
                $body = if ($Sections -and $g.RawBlock) {
                    (@(Get-GroupSections -RawBlock $g.RawBlock) | ForEach-Object {
                        $names = if ($_.Names.Count) { $_.Names -join '; ' } else { '(empty)' }
                        if ($_.Header) { "[$($_.Header)] $names" } else { $names }
                    }) -join ' '
                } else { $g.Entries -join '; ' }
                Write-Host "$($g.Tag) ($($g.OrderedCount)/$($g.AuthoredCount))${label}: $body"
            } else {
                Write-Host "[$($g.Tag)] `"$($g.Selector)`"" -ForegroundColor Green
                Write-Host "  Types:    $($g.DivisionTypes -join ' ')" -ForegroundColor Gray
                Write-Host "  Fallback: $($g.Fallback)" -ForegroundColor Gray
                Write-Host "  Ordered:  $($g.OrderedCount) entries, $($g.AuthoredCount) authored" -ForegroundColor Gray
                if ($g.Flags.Count -gt 0) {
                    Write-Host "  Flags:    $($g.Flags -join ', ')" -ForegroundColor Yellow
                }
                Write-Host "  Entries:  $($g.Entries -join '; ')"
            }
        }
        return
    }

    Write-Step "Quality audit: INEX_${Key}_names_divisions.txt ($($data.Groups.Count) groups)"
    foreach ($ff in $data.FileFlags) { Write-Warn "File: $ff" }

    foreach ($g in $data.Groups) {
        $linkStr = if ($g.LinkTargets.Count -gt 0) { " [links: $($g.LinkTargets -join ' ')]" } else { "" }
        $color = if ($g.Flags.Count -gt 0) { 'Yellow' } else { 'Green' }
        Write-Host "[$($g.Tag)] `"$($g.Selector)`"$linkStr" -ForegroundColor $color
        Write-Host "  Types:    $($g.DivisionTypes -join ' ')" -ForegroundColor Gray
        Write-Host "  Fallback: $($g.Fallback)" -ForegroundColor Gray
        Write-Host "  Ordered:  $($g.OrderedCount) entries, $($g.AuthoredCount) authored" -ForegroundColor Gray
        if ($g.PlainVariantOf) {
            Write-Host "  Variant:  plain (un-nicknamed) counterpart of $($g.PlainVariantOf)" -ForegroundColor Gray
        }
        if ($g.Flags.Count -gt 0) {
            Write-Host "  Flags:    $($g.Flags -join ', ')" -ForegroundColor Yellow
        }
    }

    if ($data.SharedIdentities.Count -gt 0) {
        Write-Step "Identities shared across groups (check that reuse is intended)"
        foreach ($s in $data.SharedIdentities) { Write-Info "'$($s.Identity)': $($s.Groups -join ', ')" }
    }

    $allFlags = @($data.FileFlags) + @($data.Groups | ForEach-Object { $_.Flags })
    if ($allFlags.Count -eq 0) {
        Write-Ok "No quality flags raised."
    } else {
        Write-Step "Flag summary"
        $allFlags | Group-Object | Sort-Object Count -Descending | ForEach-Object { Write-Info "$($_.Name): $($_.Count)" }
    }

    # Check PlanTodo
    $countryName = Get-CountryName -Tag $Key
    if ($countryName) {
        $slug = $countryName.ToLower() -replace ' ', '-'
        $planFile = Get-ChildItem -Path (Join-Path $RepoDir 'docs\superpowers\plans') -Filter "*-$slug-audit.md" -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($planFile) {
            $planContent = [System.IO.File]::ReadAllText($planFile.FullName, [System.Text.Encoding]::UTF8)
            $todos = ([regex]::Matches($planContent, '<!-- TODO')).Count
            if ($todos -gt 0) {
                Write-Warn "PlanTodo: $($planFile.Name) has $todos unfilled TODO section(s)"
            }
        }
    }

    $totOrdered = ($data.Groups | Measure-Object -Property OrderedCount -Sum).Sum
    $totAuthored = ($data.Groups | Measure-Object -Property AuthoredCount -Sum).Sum
    Write-Host "`nAUDIT SUMMARY ${Key}: GROUPS=$($data.Groups.Count) AUTHORED=$totAuthored/$totOrdered FLAGS=$($allFlags.Count)" -ForegroundColor Cyan

    if ($CompareRef) {
        $relPath = "common/units/names_divisions/INEX_${Key}_names_divisions.txt"
        $oldText = Get-GitFileText -RepoPath $RepoDir -Ref $CompareRef -RelPath $relPath

        $oldData = [PSCustomObject]@{ Groups = @() }
        if ($null -ne $oldText) {
            $tmp = [System.IO.Path]::GetTempFileName()
            try {
                [System.IO.File]::WriteAllText($tmp, $oldText, (New-Object System.Text.UTF8Encoding($false)))
                $oldData = Get-NamelistAuditData -Path $tmp
            } finally { Remove-Item -Force $tmp }
        } else {
            Write-Warn "$relPath does not exist at '$CompareRef'; treating every group as new."
        }

        $diff = Compare-NamelistAuditData -Old $oldData -New $data
        Write-Step "Changes vs $CompareRef"
        foreach ($t in $diff.RemovedTags) { Write-Err "Removed tag: $t (breaks saved templates and numbering links)" }
        foreach ($t in $diff.AddedTags) { Write-Info "Added tag: $t" }
        foreach ($c in $diff.FieldChanges) { Write-Info $c }
        Write-Info "Names removed or replaced: $($diff.RemovedNameCount)"
        Write-Host "`n  Added or changed names ($($diff.NewNames.Count)):" -ForegroundColor Cyan
        foreach ($n in $diff.NewNames) { Write-Host "  $($n.Tag.PadRight(16)) $($n.Name)" }
    }
}

# --- Action: Audit ---
if ($Audit) {
    Invoke-NamelistAudit -Key $Audit -CompareRef $Compare -TargetGroup $Group -NamesOnly:$NamesOnly -Sections:$Sections
    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: EditNames ---
if ($EditNames) {
    exit (Invoke-NamelistEdit -Tag $EditNames -TargetGroup $Group -AddList $Add -RemoveList $Remove -RenameList $Rename -SetList $Set -AfterName $After -SectionName $Section -RenameSectionList $RenameSection -Selector $Selector -AddTypeList $AddType -RemoveTypeList $RemoveType -CanUse $CanUse -Quiet:$Quiet)
}

# --- Action: DiffNames ---
if ($DiffNames) {
    exit (Invoke-NamelistDiff -Tag $DiffNames -BaseRev $Base)
}

# --- Action: AuditPlan ---
if ($AuditPlan) {
    exit (Invoke-AuditPlan -Tag $AuditPlan -BaseRev $Base)
}

# --- Action: SyncWiki ---
if ($SyncWiki) {
    exit (Invoke-SyncWiki -Tag $SyncWiki)
}


# --- Action: InspectVanilla ---
if ($InspectVanilla) {
    Invoke-InspectVanilla -Tag $InspectVanilla -TargetGroup $Group -CustomHoi4Dir $Hoi4InstallDir
    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: InstallSteamCmd ---
if ($InstallSteamCmd) {
    $installed = Install-SteamCmd
    Write-Host "`nSteamCMD is ready to use at: $installed" -ForegroundColor Green
    $stopwatch.Stop()
    exit 0
}

# --- Determine Actions ---
$shouldValidate = $Validate -or (-not $NoValidate -and -not $Clean -and -not $InspectVanilla -and -not $Audit -and -not $Test)
if ($ValidateOnly) {
    $ok = Invoke-Validation
    $stopwatch.Stop()
    if ($ok) {
        Write-Host "`nValidation succeeded in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s" -ForegroundColor Green
        exit 0
    } else {
        Write-Host "`nValidation failed!" -ForegroundColor Red
        exit 1
    }
}

# --- Action: Test ---
if ($Test) {
    $testRunner = Join-Path $RepoDir "tests\Run-Tests.ps1"
    if (-not (Test-Path $testRunner)) {
        Write-Err "Test runner not found at: $testRunner"
        exit 1
    }
    & $testRunner
    $rc = $LASTEXITCODE
    $stopwatch.Stop()
    exit $rc
}

# Validate first unless skipped
if ($shouldValidate) {
    $valid = Invoke-Validation
    if (-not $valid) {
        Write-Err "Pre-flight validation failed. Aborting."
        exit 1
    }
}

# --- Action: Clean ---
if ($Clean) {
    Write-Step "Cleaning build artifacts and deployed mod..."
    $deployedFolder = Join-Path $ModDir $ModName
    $deployedModFile = Join-Path $ModDir "$ModName.mod"
    $artifactsDir = Join-Path $RepoDir "artifacts"
    $zipFile = Join-Path $artifactsDir "inex.zip"
    $legacyZipFile = Join-Path $RepoDir "inex.zip"
    $localModFile = Join-Path $RepoDir "$ModName.mod"

    if (Test-Path $deployedFolder) {
        Remove-Item -Recurse -Force $deployedFolder
        Write-Ok "Removed deployed folder: $deployedFolder"
    }
    if (Test-Path $deployedModFile) {
        Remove-Item -Force $deployedModFile
        Write-Ok "Removed deployed mod file: $deployedModFile"
    }
    if (Test-Path $zipFile) {
        Remove-Item -Force $zipFile
        Write-Ok "Removed archive: $zipFile"
    }
    if (Test-Path $legacyZipFile) {
        Remove-Item -Force $legacyZipFile
        Write-Ok "Removed legacy archive: $legacyZipFile"
    }
    if (Test-Path $localModFile) {
        Remove-Item -Force $localModFile
        Write-Ok "Removed local launcher descriptor: $localModFile"
    }

    Write-Host "`nClean complete." -ForegroundColor Green
    exit 0
}

# --- Action: DevLink Mode ---
if ($DevLink) {
    Write-Step "Configuring DevLink (Zero-Copy Live Development)..."

    if (-not (Test-Path $ModDir)) {
        New-Item -ItemType Directory -Path $ModDir -Force | Out-Null
    }

    # Warn if deployed copy exists to prevent launcher ambiguity
    $targetDir = Join-Path $ModDir $ModName
    if (Test-Path $targetDir) {
        Write-Warn "A physical deployed folder exists at: $targetDir"
        Write-Warn "Removing or renaming it is recommended so the launcher doesn't conflict with DevLink."
    }

    # Create launcher .mod file pointing directly to the Git repository
    $launcherModContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath $RepoDir
    $targetModFile = Join-Path $ModDir "$ModName.mod"
    [System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))

    # Also sync the local repo's root .mod file
    $localModFile = Join-Path $RepoDir "$ModName.mod"
    [System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))

    Write-Ok "Created launcher file: $targetModFile"
    Write-Ok "Path points directly to: $RepoDir"
    Write-Host "`n[DevLink Active] Edits in your workspace will be reflected immediately in Hearts of Iron IV without copying!" -ForegroundColor Green
    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Package (ZIP) ---
if ($Package) {
    Write-Step "Packaging mod into clean release ZIP..."

    $meta = Get-ModMetadata -Path $DescriptorPath
    $artifactsDir = Join-Path $RepoDir "artifacts"
    if (-not (Test-Path $artifactsDir)) {
        New-Item -ItemType Directory -Path $artifactsDir -Force | Out-Null
    }
    $zipFile = if ($ZipOutput) { $ZipOutput } else { Join-Path $artifactsDir "inex.zip" }
    if (-not [System.IO.Path]::IsPathRooted($zipFile)) {
        $zipFile = Join-Path $artifactsDir $zipFile
    }

    # Create a clean temporary staging directory
    $tempStageDir = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_stage_" + [System.Guid]::NewGuid().ToString("N"))
    $stageModDir = Join-Path $tempStageDir $ModName
    New-Item -ItemType Directory -Path $stageModDir -Force | Out-Null

    try {
        # Copy only actual mod files to staging
        $excludeDirs = @('.git', '.github', '.vscode', '.claude', '.agents', '.agent', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
        $excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')
        & robocopy.exe $RepoDir $stageModDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null

        # Also place the launcher .mod file in staging root
        $modFileContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath "mod/$ModName"
        $stageModFile = Join-Path $tempStageDir "$ModName.mod"
        [System.IO.File]::WriteAllText($stageModFile, $modFileContent, [System.Text.UTF8Encoding]::new($false))

        # Delete existing zip if present
        if (Test-Path $zipFile) {
            Remove-Item -Force $zipFile
        }

        # Build zip using .NET ZipFile
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::CreateFromDirectory($tempStageDir, $zipFile, [System.IO.Compression.CompressionLevel]::Optimal, $false)

        $zipItem = Get-Item $zipFile
        $sizeKb = [math]::Round($zipItem.Length / 1KB, 1)
        Write-Ok "Created package: $zipFile ($sizeKb KB)"
        Write-Ok "Strictly excluded: .git, build scripts, markdown guidelines, wiki, and temp files."

        Write-Host "`nSuccessfully packaged '$($meta.Name)' v$($meta.Version)!" -ForegroundColor Green
    }
    finally {
        if (Test-Path $tempStageDir) {
            Remove-Item -Recurse -Force $tempStageDir
        }
    }

    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Publish to Steam Workshop ---
if ($PublishSteam) {
    Write-Step "Preparing Steam Workshop publication..."

    $meta = Get-ModMetadata -Path $DescriptorPath
    $remoteFileId = $meta.RemoteFileId
    if (-not $remoteFileId) {
        Write-Err "descriptor.mod does not have a 'remote_file_id'. Cannot update Steam Workshop item."
        exit 1
    }

    # Locate SteamCMD
    $steamCmdExe = Find-SteamCmd -CustomPath $SteamCmdPath
    if (-not $steamCmdExe) {
        Write-Warn "SteamCMD was not found on your system."
        if ($DryRun) {
            Write-Info "[DryRun] Simulating SteamCMD execution..."
            $steamCmdExe = "steamcmd.exe"
        } else {
            Write-Info "Attempting automatic SteamCMD download..."
            try {
                $steamCmdExe = Install-SteamCmd
            } catch {
                Write-Err "Could not automatically install SteamCMD: $_"
                Write-Info "Please run 'winget install Valve.SteamCMD' or download from Valve."
                exit 1
            }
        }
    } else {
        Write-Ok "Found SteamCMD: $steamCmdExe"
    }

    # Resolve Steam Username
    $steamUserFile = Join-Path $RepoDir ".steam_username"
    if (-not $SteamUser) {
        if ($env:STEAM_USERNAME) {
            $SteamUser = $env:STEAM_USERNAME
        } elseif (Test-Path $steamUserFile) {
            $SteamUser = (Get-Content $steamUserFile -Raw).Trim()
        }
    }

    if (-not $SteamUser) {
        if ($DryRun) {
            $SteamUser = "<steam_username>"
        } else {
            $SteamUser = (Read-Host "Enter your Steam username (owner of workshop item $remoteFileId)").Trim()
            if ($SteamUser) {
                [System.IO.File]::WriteAllText($steamUserFile, $SteamUser, [System.Text.UTF8Encoding]::new($false))
                Write-Info "Saved Steam username to '$steamUserFile' for future runs."
            } else {
                Write-Err "Steam username is required for publishing."
                exit 1
            }
        }
    }

    # Resolve changenote
    if (-not $ChangeNote) {
        $gitCommit = (& git -C $RepoDir log -1 --pretty=%B 2>$null)
        if ($gitCommit) {
            $ChangeNote = ($gitCommit.Trim() -split "`r?`n")[0]
            Write-Info "Using latest git commit message as changenote: '$ChangeNote'"
        } else {
            $ChangeNote = "Updated division namelists"
        }
    } else {
        Write-Info "Using specified changenote: '$ChangeNote'"
    }

    # Clean staging for workshop upload
    $tempStage = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_workshop_" + [System.Guid]::NewGuid().ToString("N"))
    $stageContent = Join-Path $tempStage "content"
    New-Item -ItemType Directory -Path $stageContent -Force | Out-Null

    try {
        # Copy only actual mod files to staging
        $excludeDirs = @('.git', '.github', '.vscode', '.claude', '.agents', '.agent', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
        $excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')
        & robocopy.exe $RepoDir $stageContent /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null

        $previewPath = Join-Path $stageContent "thumbnail.png"
        if (-not (Test-Path $previewPath)) {
            Write-Warn "thumbnail.png is missing from staging directory!"
        }

        # Build VDF file content with escaped paths
        $contentEscaped = $stageContent -replace '\\', '\\'
        $previewEscaped = $previewPath -replace '\\', '\\'
        $titleEscaped   = $meta.Name -replace '"', '\"'
        $noteEscaped    = $ChangeNote -replace '"', '\"'

        $vdfContent = @"
"workshopitem"
{
    "appid" "394360"
    "publishedfileid" "$remoteFileId"
    "contentfolder" "$contentEscaped"
    "previewfile" "$previewEscaped"
    "visibility" "0"
    "title" "$titleEscaped"
    "changenote" "$noteEscaped"
}
"@
        $vdfPath = Join-Path $tempStage "workshop_build.vdf"
        [System.IO.File]::WriteAllText($vdfPath, $vdfContent, [System.Text.UTF8Encoding]::new($false))
        Write-Ok "Generated Steam Workshop VDF: $vdfPath"

        if ($DryRun) {
            Write-Step "[DryRun] Steam Workshop VDF Preview:"
            Write-Host $vdfContent -ForegroundColor Yellow
            Write-Step "[DryRun] Staged files for upload:"
            Get-ChildItem -Path $stageContent -Recurse -File | ForEach-Object {
                Write-Host "  $($_.FullName.Substring($stageContent.Length + 1))" -ForegroundColor Gray
            }
            Write-Step "[DryRun] Command that would execute:"
            Write-Host "& `"$steamCmdExe`" +login $SteamUser +workshop_build_item `"$vdfPath`" +quit" -ForegroundColor Cyan
            Write-Host "`nDry run complete. No files were uploaded." -ForegroundColor Green
            $stopwatch.Stop()
            exit 0
        }

        # Execute SteamCMD
        Write-Step "Executing SteamCMD upload..."
        Write-Info "If this is your first time logging in via SteamCMD, enter your Steam Guard code when prompted."
        & $steamCmdExe +login $SteamUser +workshop_build_item "$vdfPath" +quit
        $rc = $LASTEXITCODE

        if ($rc -eq 0) {
            Write-Host "`nSuccessfully published update to Steam Workshop!" -ForegroundColor Green
            Write-Host "Workshop URL: https://steamcommunity.com/sharedfiles/filedetails/?id=$remoteFileId" -ForegroundColor Cyan
        } else {
            Write-Err "SteamCMD upload failed with exit code $rc."
            exit $rc
        }
    }
    finally {
        if (Test-Path $tempStage) {
            Remove-Item -Recurse -Force $tempStage
        }
    }

    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Deploy (Default) ---
Write-Step "Deploying mod to Hearts of Iron IV..."

if (-not (Test-Path $ModDir)) {
    New-Item -ItemType Directory -Path $ModDir -Force | Out-Null
    Write-Info "Created mod directory: $ModDir"
}

$targetDir = Join-Path $ModDir $ModName
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

# Robocopy mirror sync - fast, atomic, purges deleted files, strictly excludes .git & dev files
$excludeDirs = @('.git', '.github', '.vscode', '.claude', '.agents', '.agent', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
$excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')

Write-Info "Synchronizing files using robocopy (purging stale files, excluding .git & dev folders)..."
& robocopy.exe $RepoDir $targetDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null
$rc = $LASTEXITCODE

if ($rc -ge 8) {
    Write-Err "Robocopy failed with exit code $rc."
    exit $rc
}

# Clean any accidental dev or documentation folders in target from previous deployments
$staleDirs = @('.git', '.github', '.vscode', '.claude', '.agents', '.agent', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
foreach ($dir in $staleDirs) {
    $stalePath = Join-Path $targetDir $dir
    if (Test-Path $stalePath) {
        Remove-Item -Recurse -Force $stalePath
        Write-Info "Cleaned stale $dir folder from deployed destination."
    }
}

# Clean any documentation or script files that shouldn't be in the game mod folder
Get-ChildItem -Path $targetDir -Filter *.md -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.bat -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.ps1 -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

Write-Ok "Files synchronized to: $targetDir"

# Auto-generate / synchronize the launcher .mod file in HOI4 mod directory
$launcherModContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath $targetDir
$targetModFile = Join-Path $ModDir "$ModName.mod"
[System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))
Write-Ok "Synchronized launcher descriptor: $targetModFile"

# Also keep the local .mod file in the dev folder updated
$localModFile = Join-Path $RepoDir "$ModName.mod"
[System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))
Write-Ok "Synchronized workspace descriptor: $localModFile"

$meta = Get-ModMetadata -Path $DescriptorPath
Write-Host "`nSuccessfully deployed '$($meta.Name)' (v$($meta.Version) for HOI4 $($meta.SupportedVersion))!" -ForegroundColor Green
$stopwatch.Stop()
Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
exit 0
