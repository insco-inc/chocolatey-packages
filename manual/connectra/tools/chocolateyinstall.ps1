
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/Connectra/connectra/releases/download/v0.0.1%2B1.pre/connectra-0.0.1.1.pre-windows-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'connectra*'

  checksum64    = '79f3b2141ab8ac697320c019e2d6a6be95ae7f1c55340291213bf850033e7175'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
