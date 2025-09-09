
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/picguard/picguard/releases/download/v5.0.0/picguard-pro-5.0.0-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard-pro*'

  checksum64    = 'e76bc78e2d184068d126806dfb9ea4ff89db6b7aaadc3bad0ab831c686d4cd03'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
