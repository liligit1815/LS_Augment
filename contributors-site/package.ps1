$ErrorActionPreference = 'Stop'
$repository = Split-Path $PSScriptRoot -Parent
$publicDirectory = Join-Path $PSScriptRoot 'public'
$outputDirectory = Join-Path $repository 'out'
New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
$archive = Join-Path $outputDirectory 'redmagic-duo-contributors-cloudflare.zip'
Compress-Archive -LiteralPath (Join-Path $publicDirectory 'index.html'), (Join-Path $publicDirectory '_headers') -DestinationPath $archive -Force
Write-Output $archive
