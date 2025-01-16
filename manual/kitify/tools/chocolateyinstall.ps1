
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/artifylabs/artify/releases/download/v0.0.1%2B1/artify_0.0.1%2B1_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'kitify*'

  checksum64    = 'a175b405f874bb4bb69dddab3ad92f8d00fec345266609bd339f7be4b03f39bf'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
