
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/cyf/faforever/releases/download/v1.0.0%2B24/faforever_1.0.0+24_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'faforever*'

  checksum64    = '0008FFC95E5BB5B3EAFF6A7C90C24E56594A73542B9F6520AFEC89665D332B78'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
