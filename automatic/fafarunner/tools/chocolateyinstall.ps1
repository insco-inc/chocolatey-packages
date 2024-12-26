
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/fafarunner/fafarunner/releases/download/v1.0.6%2B371/fafarunner_1.0.6%2B371_windows_x64.exe'

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

  checksum64    = '6817c813a85f2af9a2a7260f7f691447067972ffcb4820c2ddbd603c4da31b35'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
