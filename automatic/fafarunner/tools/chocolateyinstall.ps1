
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/FaFaRunner/releases/download/v2.0.0%2B378/fafarunner_2.0.0%2B378_windows_x64.exe'

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

  checksum64    = '3ff96588dd53e8b54cb8c5e6e38d9b107a7bb91cd55d6a7e1e43d540fea63fa1'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
