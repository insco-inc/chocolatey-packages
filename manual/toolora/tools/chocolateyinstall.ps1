
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/Toolora/toolora/releases/download/v0.0.1%2B4.pre/toolora-0.0.1.4.pre-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'toolora*'

  checksum64    = '02020298758287cb7e1d02f1f7ab840f12b26648fd658e641090f8a7072f2c4c'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
