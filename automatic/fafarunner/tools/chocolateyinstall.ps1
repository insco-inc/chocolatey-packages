
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/FaFaRunner/releases/download/v2.0.1%2B379/fafarunner-2.0.1.379-windows-x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'fafarunner*'

  checksum64    = '41e01bc4aca985fa6023594514536592cb4bd43045def063118f8dd12dc4b811'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
