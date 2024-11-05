
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/fafarunner/fafarunner/releases/download/v1.0.1%2B364/fafarunner_1.0.1%2B364_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'fafarunner*'

  checksum64    = '3b9a09a9b12ff3c1dd258b95315f0bcedfd934b4aa60124d38f04d0778dd41d8'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
