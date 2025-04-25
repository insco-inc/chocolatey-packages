
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/PicGuard/releases/download/v2.5.0%2B443/picguard-pro-2.5.0.443-windows-x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard-pro*'

  checksum64    = '23e99f1073ac73c5a96da7db211587b460aa06d29ffbff0ea341781b6109a28a'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
