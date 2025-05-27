
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/FaFaRunner/releases/download/v2.5.0%2B380/fafarunner-2.5.0.380-windows-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'fafarunner*'

  checksum64    = 'da47d4d828162c027d05d1713ba0da1ce22f2177f30879373fea36a0be991e42'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
