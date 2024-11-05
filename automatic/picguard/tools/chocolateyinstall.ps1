
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/picguard/picguard/releases/download/v1.0.4%2B422/picguard_1.0.4%2B422_windows_x64.exe'

$arch = [System.Environment]::Is64BitOperatingSystem

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard*'

  checksum64    = '46cfd7899d7f4f7508a12d7bf8fc3d7a0c312efb5f95c533f40f26d635e33ac1'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
