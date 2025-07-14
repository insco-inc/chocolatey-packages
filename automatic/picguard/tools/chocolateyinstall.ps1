
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/PicGuard/picguard/releases/download/v4.0.1%2B453/picguard-4.0.1.453-windows-setup-x64.exe'

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

  checksum64    = '346670f4f340f1ee9715ee5991339c2b91af5b81a57a19bd2508107d5ca973d0'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
