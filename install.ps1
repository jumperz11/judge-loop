param(
    [switch]$Project
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

Get-ChildItem -Directory $SrcRoot | ForEach-Object {
    $Dest = Join-Path $DestRoot $_.Name
    if (Test-Path $Dest) {
        Remove-Item -Recurse -Force $Dest
    }
    Copy-Item -Recurse $_.FullName $Dest
    Write-Host "Installed $($_.Name) to $Dest"
}

if (Get-Command codex -ErrorAction SilentlyContinue) {
    Write-Host "Codex CLI found: $(codex --version)"
} else {
    Write-Host "Codex CLI not found. Install it if you want headless dispatch."
}
