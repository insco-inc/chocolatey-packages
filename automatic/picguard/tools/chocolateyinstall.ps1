
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/PicGuard/releases/download/v2.0.0%2B441/picguard-2.0.0.441-windows-x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard*'

  checksum64    = '9bd9b9e8fd0b071203bf85ab8538eeb2a10db7c1d0c7fcdb9de30f375f08916d'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
