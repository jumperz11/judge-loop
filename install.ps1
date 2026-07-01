param(
    [switch]$Project,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SrcRoot = Join-Path $RepoRoot "skills"

if ($Project) {
    $DestRoot = Join-Path (Get-Location) ".codex\skills"
} elseif ($env:CODEX_HOME) {
    $DestRoot = Join-Path $env:CODEX_HOME "skills"
} else {
    $DestRoot = Join-Path $HOME ".codex\skills"
}

New-Item -ItemType Directory -Force -Path $DestRoot | Out-Null
Write-Host "Installing JudgeLoop skills to: $DestRoot"

Get-ChildItem -Directory $SrcRoot | ForEach-Object {
    $Dest = Join-Path $DestRoot $_.Name
    if (Test-Path $Dest) {
        if ($Force) {
            Remove-Item -Recurse -Force $Dest
            Write-Host "Removed existing $Dest (-Force)"
        } else {
            $Stamp = Get-Date -Format "yyyyMMddHHmmss"
            $Backup = "$Dest.backup.$Stamp"
            Move-Item $Dest $Backup
            Write-Host "Backed up existing $Dest to $Backup"
        }
    }
    Copy-Item -Recurse $_.FullName $Dest
    Write-Host "Installed $($_.Name) to $Dest"
}

if ($CodexCommand = Get-Command codex -ErrorAction SilentlyContinue) {
    Write-Host "Codex CLI found: $($CodexCommand.Source)"
} else {
    Write-Host "Codex CLI not found. Install it if you want headless dispatch."
}
