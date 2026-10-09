# Regenera certfy.me-standalone.html a partir de codigo/certfy.me.dc.html e codigo/i18n.js.
# O standalone e um bundle: fontes, React, support.js e i18n.js ficam embutidos em base64.
# Este script reaproveita o bundle atual e troca apenas o HTML das telas e o i18n.js.
# Uso: powershell -ExecutionPolicy Bypass -File scripts/build-standalone.ps1

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$bundlePath = Join-Path $root 'certfy.me-standalone.html'
$srcPath = Join-Path $root 'codigo\certfy.me.dc.html'
$i18nPath = Join-Path $root 'codigo\i18n.js'

$I18N_UUID = 'f49be570-b2f7-42ea-92fc-b75e327602d3'

Add-Type -AssemblyName System.Web.Extensions
$json = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$json.MaxJsonLength = [int]::MaxValue
$utf8 = New-Object System.Text.UTF8Encoding($false)

$bundle = [IO.File]::ReadAllText($bundlePath, $utf8)
$src = [IO.File]::ReadAllText($srcPath, $utf8)

function Get-Island($name) {
  $m = [regex]::Match($bundle, '<script type="__bundler/' + $name + '">([\s\S]*?)</script>')
  if (-not $m.Success) { throw "Bloco __bundler/$name nao encontrado" }
  return $m
}

# 1. Template: troca tudo entre </helmet> e </body> pelo trecho equivalente do fonte.
$tplMatch = Get-Island 'template'
$tpl = $json.DeserializeObject($tplMatch.Groups[1].Value)
$a = $tpl.IndexOf('</helmet>'); $b = $tpl.LastIndexOf('</body>')
$sa = $src.IndexOf('</helmet>'); $sb = $src.LastIndexOf('</body>')
if ($a -lt 0 -or $b -lt 0 -or $sa -lt 0 -or $sb -lt 0) { throw 'Marcadores </helmet> ou </body> ausentes' }
$tpl = $tpl.Substring(0, $a) + $src.Substring($sa, $sb - $sa) + $tpl.Substring($b)
$tplJson = $json.Serialize($tpl).Replace('</', '<\/')

# 2. Manifesto: recomprime o i18n.js (gzip + base64).
$manMatch = Get-Island 'manifest'
$man = $json.DeserializeObject($manMatch.Groups[1].Value)
$ms = New-Object IO.MemoryStream
$gz = New-Object IO.Compression.GZipStream($ms, [IO.Compression.CompressionMode]::Compress)
$bytes = [IO.File]::ReadAllBytes($i18nPath)
$gz.Write($bytes, 0, $bytes.Length); $gz.Close()
$man[$I18N_UUID]['data'] = [Convert]::ToBase64String($ms.ToArray())
$man[$I18N_UUID]['compressed'] = $true
$manJson = $json.Serialize($man).Replace('</', '<\/')

# 3. Substitui do fim para o inicio para manter os indices validos.
$parts = @(
  @{ m = $tplMatch; v = $tplJson },
  @{ m = $manMatch; v = $manJson }
) | Sort-Object { $_.m.Groups[1].Index } -Descending
foreach ($p in $parts) {
  $g = $p.m.Groups[1]
  $bundle = $bundle.Substring(0, $g.Index) + $p.v + $bundle.Substring($g.Index + $g.Length)
}

[IO.File]::WriteAllText($bundlePath, $bundle, $utf8)
Write-Host "OK: $bundlePath ($([math]::Round((Get-Item $bundlePath).Length / 1KB)) KB)"
