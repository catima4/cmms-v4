$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$errors = [System.Collections.Generic.List[string]]::new()
$required = @('AGENTS.md','core/web/home.html','core/web/shared.css','core/web/shared.js','modules/assets/web/assets.html','modules/inventory/web/inventory.html','modules/assets/module.json','modules/inventory/module.json','.github/workflows/windows-foundation.yml')
foreach ($p in $required) { if (-not (Test-Path (Join-Path $root $p))) { $errors.Add("MISSING: $p") } }
foreach ($module in @('assets','inventory')) {
  $manifestPath = Join-Path $root "modules/$module/module.json"
  if (Test-Path $manifestPath) {
    try {
      $m = Get-Content -LiteralPath $manifestPath -Raw -Encoding utf8 | ConvertFrom-Json
      if ($m.id -ne $module -or $m.permissions.default -ne 0 -or $m.status -ne 'placeholder_only') { $errors.Add("Invalid manifest: $module") }
    } catch { $errors.Add("Cannot parse manifest: $module $_") }
  }
  $p = Join-Path $root "modules/$module/web/$module.html"
  if ((Test-Path $p) -and -not ((Get-Content -LiteralPath $p -Raw -Encoding utf8) -match '<meta name="viewport"')) { $errors.Add("Missing viewport: $module") }
}
if ($errors.Count -gt 0) { $errors | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Host 'PASS: G0.0 static scaffold checks'
