
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/PicGuard/releases/download/v2.5.4%2B447/picguard-2.5.4.447-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard*'

  checksum64    = '6f456ab0d914d583bd261bc5bc0f487ffe2093ea3cb81189370c98b21433c569'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
