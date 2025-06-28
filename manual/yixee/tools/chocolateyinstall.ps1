
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/Yixee/yixee/releases/download/v0.0.1%2B1.pre/yixee-0.0.1.1.pre-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'yixee*'

  checksum64    = '00ce758014350cbf096a99e686915cdd2da378e27a93ec273d73405ab60c1838'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
