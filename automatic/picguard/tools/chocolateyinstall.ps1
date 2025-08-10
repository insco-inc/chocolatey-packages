
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/picguard/picguard/releases/download/v4.0.2/picguard-4.0.2-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'picguard*'

  checksum64    = '15ce6c93b0599a688861f510cb1e4e07a5a68efd36f738d23d346cbccd19d76e'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
