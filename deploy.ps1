# ============================================================
# deploy.ps1 - Автоматична публікація на GitHub Pages
# Запуск: .\deploy.ps1 -Token "ghp_ваш_токен"
# ============================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$Token
)

$ErrorActionPreference = "Stop"
$RepoOwner = "renderlex"
$RepoName = "renderlex.github.io"
$RepoDesc = "FireLoad DB - Fire Load Database by Koshmakov (Bilingual UK/EN)"

Write-Host "=== FireLoad DB Deployment ===" -ForegroundColor Green

# Крок 1: Створення репозиторію через GitHub API
Write-Host "`n[1/3] Створення репозиторію $RepoOwner/$RepoName ..." -ForegroundColor Yellow

$headers = @{
    Authorization = "Bearer $Token"
    Accept        = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

$body = @{
    name        = $RepoName
    description = $RepoDesc
    private     = $false
    auto_init   = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" `
        -Method POST -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "✅ Репозиторій створено: $($response.html_url)" -ForegroundColor Green
} catch {
    if ($_.Exception.Response.StatusCode -eq 422) {
        Write-Host "ℹ️  Репозиторій вже існує, продовжую..." -ForegroundColor Cyan
    } else {
        Write-Host "❌ Помилка створення репозиторію: $_" -ForegroundColor Red
        exit 1
    }
}

# Крок 2: Налаштування remote з токеном
Write-Host "`n[2/3] Налаштування git remote..." -ForegroundColor Yellow

$RemoteUrl = "https://$Token@github.com/$RepoOwner/$RepoName.git"
git remote set-url origin $RemoteUrl
Write-Host "✅ Remote налаштовано" -ForegroundColor Green

# Крок 3: Push коду
Write-Host "`n[3/3] Push на GitHub..." -ForegroundColor Yellow

git push -u origin main --force
Write-Host "✅ Код опубліковано!" -ForegroundColor Green

# Крок 4: Увімкнути GitHub Pages через API
Write-Host "`nВмикаємо GitHub Pages..." -ForegroundColor Yellow

$pagesBody = @{
    source = @{
        branch = "main"
        path   = "/"
    }
} | ConvertTo-Json

try {
    $pagesResp = Invoke-RestMethod `
        -Uri "https://api.github.com/repos/$RepoOwner/$RepoName/pages" `
        -Method POST -Headers $headers -Body $pagesBody -ContentType "application/json"
    Write-Host "✅ GitHub Pages увімкнено!" -ForegroundColor Green
} catch {
    Write-Host "ℹ️  GitHub Pages вже увімкнено або потребує ручного налаштування" -ForegroundColor Cyan
}

Write-Host "`n==============================" -ForegroundColor Green
Write-Host "🚀 ГОТОВО! Сайт буде доступний за 2-3 хвилини:" -ForegroundColor Green
Write-Host "   https://$RepoOwner.github.io" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Green
