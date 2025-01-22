
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/artifylabs/artify/releases/download/v0.0.1%2B3/artify_0.0.1%2B3_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'artify*'

  checksum64    = '74d84e960bce26011aa789faf693529f10adbc9ef34bcc8b21fd32c520eb88e0'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
