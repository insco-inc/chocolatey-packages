
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/kitifylabs/kitify/releases/download/v0.0.1%2B2/kitify_0.0.1%2B2_windows_x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'kitify*'

  checksum64    = '7b28e6f096f1094453f0423e87932ee93e087d933c2cc46de31e7bcdae8f4b9d'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
