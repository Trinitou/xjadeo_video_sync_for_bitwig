$version = "0.1.1"

$targetTempDir = ".\target\tmp"
New-Item -ItemType Directory -Force -Path $targetTempDir

function GenerateHtmlHeadSection {
  param (
    [Parameter(Mandatory)]
    [string]$Title,
    [Parameter(Mandatory)]
    [string]$RelativeCssPath
  )
  Write-Output "<head>
  <title class=`"$Title`">Changelog</title>
  <style type=`"text/css`" media=`"all`">@import `"$RelativeCssPath`";</style>
</head>"
}

$docSourceDir = ".\doc"
$docAsMarkdown = ConvertFrom-Markdown -Path "$docSourceDir\help.md"
$rootDir = "."
$changelogAsMarkdown = ConvertFrom-Markdown -Path "$rootDir\Changelog.md"
if($docAsMarkdown && $changelogAsMarkdown) {
  # main HTML
  $docHtmlHeadSection = GenerateHtmlHeadSection -Title "xjadeo Video Sync" -RelativeCssPath "./doc/help.css"
  $docHtmlHeadSection + $docAsMarkdown.Html | Out-File -Encoding utf8 "$targetTempDir\xJadeo Video Sync.html"
  # HTML resource directory
  $htmlResourceTargetDir = "$targetTempDir\doc"
  New-Item -ItemType Directory -Force -Path "$htmlResourceTargetDir"
  # style sheet
  $helpCssFileName = "help.css"
  Copy-Item -Path "$docSourceDir\$helpCssFileName" -Destination "$htmlResourceTargetDir\$helpCssFileName"
  # changelog HTML sub-page
  $changelogHtmlHeadSection = GenerateHtmlHeadSection -Title "Changelog" -RelativeCssPath "./help.css"
  $changelogHtmlHeadSection + $changelogAsMarkdown.Html | Out-File -Encoding utf8 "$htmlResourceTargetDir\changelog.html"
}

$sourceDir = ".\src"
$controlScriptFileName = "xJadeo Video Sync.control.js"
Copy-Item -Path "$sourceDir\$controlScriptFileName" -Destination "$targetTempDir\$controlScriptFileName"
$launchScriptFileName = "launch xjadeo.bat"
Copy-Item -Path "$sourceDir\$launchScriptFileName" -Destination "$targetTempDir\$launchScriptFileName"
$controlScriptFileName = "LICENSE"
Copy-Item -Path "$rootDir\$controlScriptFileName" -Destination "$targetTempDir\$controlScriptFileName"

$targetZipPath = "$PSScriptRoot\target\xJadeo_Video_Sync_" + ($version -replace '\.', '_') + ".zip"
$compress = @{
    Path = "$targetTempDir\*"
    CompressionLevel = "Fastest"
    DestinationPath = $targetZipPath
  }
Compress-Archive @compress -Force
