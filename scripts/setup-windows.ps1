$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

if ([System.Environment]::OSVersion.Platform -ne [System.PlatformID]::Win32NT) {
    throw "This script is intended for Windows."
}

$RepoDir = Split-Path -Parent $PSScriptRoot
$SourcePath = [System.IO.Path]::GetFullPath((Join-Path $RepoDir "nvim"))
$TargetPath = [System.IO.Path]::GetFullPath((Join-Path $env:LOCALAPPDATA "nvim"))
$BackupSuffix = Get-Date -Format "yyyyMMdd-HHmmss"

if (-not (Test-Path -LiteralPath $SourcePath -PathType Container)) {
    throw "Neovim configuration does not exist: $SourcePath"
}

function Test-CorrectLink {
    param(
        [Parameter(Mandatory = $true)] [string] $Path,
        [Parameter(Mandatory = $true)] [string] $ExpectedTarget
    )

    $Item = Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    if ($null -eq $Item) {
        return $false
    }

    if (($Item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -eq 0) {
        return $false
    }

    $ActualTarget = [string] ($Item.Target | Select-Object -First 1)
    if (-not [System.IO.Path]::IsPathRooted($ActualTarget)) {
        $ActualTarget = Join-Path (Split-Path -Parent $Path) $ActualTarget
    }

    return [System.IO.Path]::GetFullPath($ActualTarget) -eq $ExpectedTarget
}

if (Test-CorrectLink -Path $TargetPath -ExpectedTarget $SourcePath) {
    Write-Host "Already linked: $TargetPath"
}
else {
    $ExistingItem = Get-Item -LiteralPath $TargetPath -Force -ErrorAction SilentlyContinue
    if ($null -ne $ExistingItem) {
        $BackupPath = "$TargetPath.backup-$BackupSuffix"
        Move-Item -LiteralPath $TargetPath -Destination $BackupPath
        Write-Host "Backed up: $TargetPath -> $BackupPath"
    }

    $TargetParent = Split-Path -Parent $TargetPath
    New-Item -ItemType Directory -Path $TargetParent -Force | Out-Null

    # A junction works without Developer Mode or administrator privileges.
    New-Item -ItemType Junction -Path $TargetPath -Target $SourcePath | Out-Null
    Write-Host "Linked: $TargetPath -> $SourcePath"
}

Write-Host ""
Write-Host "The Neovim configuration was linked successfully."

foreach ($CommandName in @("git", "nvim")) {
    if (-not (Get-Command $CommandName -ErrorAction SilentlyContinue)) {
        Write-Warning "'$CommandName' is not installed or is not available in PATH."
    }
}

Write-Host "AeroSpace is not available on Windows; use zsh and tmux through WSL."
