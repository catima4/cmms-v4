param([string]$Version='0.1.0')
$ErrorActionPreference='Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$out = Join-Path $root 'out'
New-Item -ItemType Directory -Force -Path $out | Out-Null
$name = "CMMS_V4_G0_0_v$($Version.Replace('.','_'))_FOUNDATION_FULL.zip"
$zip = Join-Path $out $name
if(Test-Path $zip){Remove-Item $zip -Force}
$paths = @('AGENTS.md','README.md','.gitignore','.github','core','modules','tests','scripts','docs')
$files = foreach($p in $paths){$full=Join-Path $root $p; if(Test-Path $full){Get-Item -Force $full | ForEach-Object {if($_.PSIsContainer){Get-ChildItem $_.FullName -Recurse -File -Force}else{$_}}}}
$files = @($files | Where-Object {$_.FullName -notmatch '[\\/]out[\\/]'} | Sort-Object FullName)
$manifest = [ordered]@{gate='G0.0';version=$Version;kind='FOUNDATION_FULL';status='PREPARED_NOT_PRODUCTION';files=@()}
foreach($f in $files){$relative=$f.FullName.Substring($root.Length).TrimStart([char]'/',[char]'\').Replace('\','/');$manifest.files+=[ordered]@{path=$relative;sha256=(Get-FileHash -LiteralPath $f.FullName -Algorithm SHA256).Hash.ToLowerInvariant()}}
$manifestPath=Join-Path $out 'RELEASE_MANIFEST.json';$manifest|ConvertTo-Json -Depth 8|Set-Content -LiteralPath $manifestPath -Encoding utf8
$stage=Join-Path $out 'stage'
if(Test-Path $stage){Remove-Item $stage -Recurse -Force};New-Item $stage -ItemType Directory|Out-Null
foreach($f in $files){$relative=$f.FullName.Substring($root.Length).TrimStart([char]'/',[char]'\');$dest=Join-Path $stage $relative;New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null;Copy-Item -LiteralPath $f.FullName -Destination $dest}
Copy-Item $manifestPath (Join-Path $stage 'RELEASE_MANIFEST.json')
Add-Type -AssemblyName System.IO.Compression
$zipStream=[IO.File]::Open($zip,[IO.FileMode]::CreateNew)
$archive=[IO.Compression.ZipArchive]::new($zipStream,[IO.Compression.ZipArchiveMode]::Create,$false)
try {
  $fixedTime=[DateTimeOffset]::new(1980,1,1,0,0,0,[TimeSpan]::Zero)
  $stageFiles=@(Get-ChildItem -LiteralPath $stage -Recurse -File -Force | Sort-Object FullName)
  foreach($f in $stageFiles){
    $relative=$f.FullName.Substring($stage.Length).TrimStart([char]'/',[char]'\').Replace('\','/')
    $entry=$archive.CreateEntry($relative,[IO.Compression.CompressionLevel]::Optimal)
    $entry.LastWriteTime=$fixedTime
    $input=[IO.File]::OpenRead($f.FullName)
    $output=$entry.Open()
    try {$input.CopyTo($output)} finally {$output.Dispose();$input.Dispose()}
  }
} finally {$archive.Dispose();$zipStream.Dispose()}
$archive=[IO.Compression.ZipFile]::OpenRead($zip)
try { if(-not $archive.Entries.Count){throw 'ZIP empty'}; foreach($entry in $archive.Entries){if($entry.Name){$stream=$entry.Open();try{$sink=[IO.Stream]::Null;$stream.CopyTo($sink)}finally{$stream.Dispose()}}} } finally {$archive.Dispose()}
$hash=(Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
"$hash  $name" | Set-Content -LiteralPath (Join-Path $out 'SHA256SUMS.txt') -Encoding utf8
Write-Host "PASS ZIP INTEGRITY: $zip";Write-Host "SHA256: $hash"
