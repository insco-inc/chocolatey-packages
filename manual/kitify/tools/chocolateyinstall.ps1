
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/kitifylabs/kitify/releases/download/v0.0.1%2B1/kitify_0.0.1%2B1_windows_x64.exe'

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

  checksum64    = 'afbaaccbd3ab46ef073129438005bfc0c6aa3fbe607c667f916a1f6c69544371'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
