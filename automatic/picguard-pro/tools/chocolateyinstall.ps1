﻿
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/PicGuard/releases/download/v2.5.4%2B447/picguard-pro-2.5.4.447-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard-pro*'

  checksum64    = 'e8ab6af09ff23f540cf2376ca80758d9066fb195c82996d2fb1a9abfa540ef2f'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
