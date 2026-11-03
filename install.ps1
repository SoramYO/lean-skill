# Script cài đặt Lean Skills cho Antigravity IDE và Codex
$ErrorActionPreference = "Stop"

$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceSkills = Join-Path $currentDir "skills"

$targets = @(
    (Join-Path $env:USERPROFILE ".gemini\config\skills"),
    (Join-Path $env:USERPROFILE ".codex\skills")
)

foreach ($target in $targets) {
    if (!(Test-Path $target)) {
        New-Item -ItemType Directory -Path $target -Force | Out-Null
    }

    Get-ChildItem -Path $sourceSkills -Directory | ForEach-Object {
        $skillName = $_.Name
        $destSkillDir = Join-Path $target $skillName
        if (!(Test-Path $destSkillDir)) {
            New-Item -ItemType Directory -Path $destSkillDir -Force | Out-Null
        }
        Copy-Item -Path (Join-Path $_.FullName "SKILL.md") -Destination (Join-Path $destSkillDir "SKILL.md") -Force
        Write-Host " [OK] Installed $skillName -> $destSkillDir" -ForegroundColor Green
    }
}

Write-Host "`nĐã cài đặt thành công toàn bộ Lean Skills cho Antigravity và Codex!" -ForegroundColor Cyan
