
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/DotDraw/dotdraw/releases/download/v0.0.1%2B5.pre/dotdraw-0.0.1.5.pre-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'dotdraw*'

  checksum64    = '8c0587089dfdfeb653f229e26996c9fd456597b1e1c047ca14f70171eb000bc5'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
