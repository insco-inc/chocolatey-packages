
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/cyf/faforever/releases/download/v1.0.0%2B47/faforever_1.0.0%2B47_windows_x64.exe'

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

  checksum64    = 'a0c93604cd1112768c9abbfca04020997349aa607351ed6dda85eb346a0ea8c4'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
