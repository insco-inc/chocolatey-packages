
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/fafarunner/fafarunner/releases/download/v1.0.8%2B374/fafarunner_1.0.8%2B374_windows_x64.exe'

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

  checksum64    = 'bdb6283784a9fb81ca7b5feff4d579e933f63d413ac09a42eec4e9dbc3586137'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
