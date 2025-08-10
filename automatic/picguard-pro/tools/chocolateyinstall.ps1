
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/picguard/picguard/releases/download/v4.0.2/picguard-pro-4.0.2-windows-setup-x64.exe'

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

  checksum64    = 'c74411802f9ba96577c92e5c3207e104764af681afe61c72eea719a087193123'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
