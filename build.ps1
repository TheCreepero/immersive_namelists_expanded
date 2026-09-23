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

.PARAMETER Validate
    Validate namelist syntax and bracket balance before proceeding (enabled by default).

.PARAMETER NoValidate
    Skip syntax and bracket validation.

.PARAMETER Clean
    Clean deployed mod files from Paradox mod directory and delete temporary zip archives.

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

    [Parameter(ParameterSetName = 'Clean')]
    [switch]$Clean,

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

# Determine Mod Source Directory (containing descriptor.mod)
if (Test-Path (Join-Path $ScriptDir "descriptor.mod")) {
    $RepoDir = $ScriptDir
    $ParentDir = Split-Path -Parent $ScriptDir
} elseif (Test-Path (Join-Path $ScriptDir "immersive_namelists_expanded\descriptor.mod")) {
    $RepoDir = Join-Path $ScriptDir "immersive_namelists_expanded"
    $ParentDir = $ScriptDir
} else {
    Write-Err "Could not find 'descriptor.mod' in '$ScriptDir' or 'immersive_namelists_expanded'."
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

    $checkedCount = 0
    foreach ($file in $namelistFiles) {
        $lines = Get-Content $file.FullName
        # Strip comments
        $cleanText = ($lines | ForEach-Object { $_ -replace '#.*$', '' }) -join "`n"

        $openCount  = ([regex]::Matches($cleanText, '\{')).Count
        $closeCount = ([regex]::Matches($cleanText, '\}')).Count

        if ($openCount -ne $closeCount) {
            Write-Err "$($file.Name): Bracket mismatch (Open: $openCount, Close: $closeCount)"
            $hasErrors = $true
        } else {
            $checkedCount++
        }
    }

    if (-not $hasErrors) {
        Write-Ok "All $checkedCount division namelist files passed bracket syntax validation."
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

# --- Action: InstallSteamCmd ---
if ($InstallSteamCmd) {
    $installed = Install-SteamCmd
    Write-Host "`nSteamCMD is ready to use at: $installed" -ForegroundColor Green
    $stopwatch.Stop()
    exit 0
}

# --- Determine Actions ---
$shouldValidate = $Validate -or (-not $NoValidate -and -not $Clean)
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
    $zipFile = Join-Path $ParentDir "inex.zip"

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
    [System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.Encoding]::UTF8)

    # Also sync the local repo's root .mod file
    $localModFile = Join-Path $ParentDir "$ModName.mod"
    [System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.Encoding]::UTF8)

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
    $defaultZipName = if ($ZipOutput) { $ZipOutput } else { Join-Path $ParentDir "inex.zip" }
    if (-not [System.IO.Path]::IsPathRooted($defaultZipName)) {
        $defaultZipName = Join-Path $ParentDir $defaultZipName
    }

    # Create a clean temporary staging directory
    $tempStageDir = Join-Path ([System.IO.Path]::GetTempPath()) ("inex_stage_" + [System.Guid]::NewGuid().ToString("N"))
    $stageModDir = Join-Path $tempStageDir $ModName
    New-Item -ItemType Directory -Path $stageModDir -Force | Out-Null

    try {
        # Copy only actual mod files to staging
        $excludeDirs = @('.git', '.github', '.vscode', '.agents', '.agent')
        $excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')
        & robocopy.exe $RepoDir $stageModDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null

        # Also place the launcher .mod file in staging root
        $modFileContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath "mod/$ModName"
        $stageModFile = Join-Path $tempStageDir "$ModName.mod"
        [System.IO.File]::WriteAllText($stageModFile, $modFileContent, [System.Text.Encoding]::UTF8)

        # Delete existing zip if present
        if (Test-Path $defaultZipName) {
            Remove-Item -Force $defaultZipName
        }

        # Build zip using .NET ZipFile
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::CreateFromDirectory($tempStageDir, $defaultZipName, [System.IO.Compression.CompressionLevel]::Optimal, $false)

        $zipItem = Get-Item $defaultZipName
        $sizeKb = [math]::Round($zipItem.Length / 1KB, 1)
        Write-Ok "Created package: $defaultZipName ($sizeKb KB)"
        Write-Ok "Strictly excluded: .git, build scripts, markdown guidelines, and temp files."

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
    $steamUserFile = Join-Path $ParentDir ".steam_username"
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
                [System.IO.File]::WriteAllText($steamUserFile, $SteamUser, [System.Text.Encoding]::UTF8)
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
        $excludeDirs = @('.git', '.github', '.vscode')
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
        [System.IO.File]::WriteAllText($vdfPath, $vdfContent, [System.Text.Encoding]::UTF8)
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
$excludeDirs = @('.git', '.github', '.vscode', '.agents', '.agent')
$excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')

Write-Info "Synchronizing files using robocopy (purging stale files, excluding .git)..."
& robocopy.exe $RepoDir $targetDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null
$rc = $LASTEXITCODE

if ($rc -ge 8) {
    Write-Err "Robocopy failed with exit code $rc."
    exit $rc
}

# Clean any accidental .git folder in target from previous legacy scripts
$staleGit = Join-Path $targetDir ".git"
if (Test-Path $staleGit) {
    Remove-Item -Recurse -Force $staleGit
    Write-Info "Cleaned legacy .git folder from deployed destination."
}

# Clean any documentation or script files that shouldn't be in the game mod folder
Get-ChildItem -Path $targetDir -Filter *.md -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.bat -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.ps1 -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

Write-Ok "Files synchronized to: $targetDir"

# Auto-generate / synchronize the launcher .mod file in HOI4 mod directory
$launcherModContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath $targetDir
$targetModFile = Join-Path $ModDir "$ModName.mod"
[System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.Encoding]::UTF8)
Write-Ok "Synchronized launcher descriptor: $targetModFile"

# Also keep the local .mod file in the dev folder updated
$localModFile = Join-Path $ParentDir "$ModName.mod"
[System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.Encoding]::UTF8)
Write-Ok "Synchronized workspace descriptor: $localModFile"

$meta = Get-ModMetadata -Path $DescriptorPath
Write-Host "`nSuccessfully deployed '$($meta.Name)' (v$($meta.Version) for HOI4 $($meta.SupportedVersion))!" -ForegroundColor Green
$stopwatch.Stop()
Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
exit 0
