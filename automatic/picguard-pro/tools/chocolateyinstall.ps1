
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/picguard/releases/download/v3.0.3%2B451/picguard-pro-3.0.3.451-windows-setup-x64.exe'

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

  checksum64    = '1295968bbec0c554edb38340c5e1427bb83430c96578455ffb8461ae30e75c90'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
