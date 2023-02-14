$version = "0.1"

$targetTempDir = ".\target\tmp"
New-Item -ItemType Directory -Force -Path $targetTempDir

$docSourceDir = ".\doc"
$md = ConvertFrom-Markdown -Path "$docSourceDir\help.md"
if($md) {
    $md.Html | Out-File -Encoding utf8 "$targetTempDir\xJadeo Video Sync.html"
    $helpCssFileName = "help.css"
    $cssTargetDir = "$targetTempDir\doc"
    New-Item -ItemType Directory -Force -Path "$cssTargetDir"
    Copy-Item -Path "$docSourceDir\$helpCssFileName" -Destination "$cssTargetDir\$helpCssFileName"
}

$sourceDir = ".\src"
$controlScriptPath = "xJadeo Video Sync.control.js"
Copy-Item -Path "$sourceDir\$controlScriptPath" -Destination "$targetTempDir\$controlScriptPath"
$launchScriptPath = "launch xjadeo.bat"
Copy-Item -Path "$sourceDir\$launchScriptPath" -Destination "$targetTempDir\$launchScriptPath"

$targetZipPath = "$PSScriptRoot\target\xJadeo_Video_Sync_" + ($version -replace '\.', '_') + ".zip"
$compress = @{
    Path = "$targetTempDir\*"
    CompressionLevel = "Fastest"
    DestinationPath = $targetZipPath
  }
Compress-Archive @compress -Force
