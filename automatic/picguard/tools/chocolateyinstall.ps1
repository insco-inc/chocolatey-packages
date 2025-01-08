
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/picguard/picguard/releases/download/v1.0.11%2B435/picguard_1.0.11%2B435_windows_x64.exe'

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

  checksum64    = 'd0b22e93e28876b2fc333a85f43a70e7a42440181608f46756555143bdb46dd8'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
