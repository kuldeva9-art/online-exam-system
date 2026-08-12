<#
.SYNOPSIS
    Lightweight Zero-Dependency Local HTTP Web Server for ExamFlow Pro
.DESCRIPTION
    Uses built-in Windows .NET HttpListener to serve HTML/CSS/JS files locally.
#>

$port = 8080
$prefix = "http://localhost:$port/"
$root = $PSScriptRoot

if (-not $root) {
    $root = Get-Location
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
} catch {
    Write-Host "Port $port is busy, trying port 8081..." -ForegroundColor Yellow
    $port = 8081
    $prefix = "http://localhost:$port/"
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add($prefix)
    $listener.Start()
}

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  ⚡ ExamFlow Pro - Online Examination System Server    " -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  Server URL : $prefix" -ForegroundColor White
Write-Host "  Root Path  : $root" -ForegroundColor Gray
Write-Host "  Press Ctrl+C in this terminal to stop the server." -ForegroundColor Yellow
Write-Host "========================================================" -ForegroundColor Cyan

# Open default browser
Start-Process $prefix

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath
        if ($path -eq "/" -or $path -eq "") {
            $path = "/index.html"
        }

        $localPath = Join-Path $root ($path.TrimStart('/').Replace('/', '\'))

        if (Test-Path $localPath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($localPath).ToLower()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".json" { "application/json; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".svg"  { "image/svg+xml" }
                default { "application/octet-stream" }
            }

            $bytes = [System.IO.File]::ReadAllBytes($localPath)
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $path")
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
        }
        $response.OutputStream.Close()
    } catch {
        # Listener stopped or client disconnected
    }
}
