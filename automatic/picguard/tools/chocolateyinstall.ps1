
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/PicGuard/releases/download/v1.1.0%2B440/picguard_1.1.0%2B440_windows_x64.exe'

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

  checksum64    = 'af6f0a13599f187415141dfbce373ef7e4f968fb2a1d94e598d381cfab27a8d4'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
