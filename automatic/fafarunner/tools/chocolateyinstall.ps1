
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/FaFaRunner/releases/download/v1.0.11%2B377/fafarunner_1.0.11%2B377_windows_x64.exe'

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

  checksum64    = '1f4eeefe805fe62bd3e535dbbca6d4d77d60303752a9f5690b23ec865969b687'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
