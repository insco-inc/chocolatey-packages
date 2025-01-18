
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/kitifylabs/kitify/releases/download/v0.0.1%2B1/kitify_0.0.1%2B1_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'kitify*'

  checksum64    = '496a5e33c8584fa89c8a9d29254ceab264ea13d22b52c7822ae0714db88b4187'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
