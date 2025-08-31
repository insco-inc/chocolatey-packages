
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/fafarunner/fafarunner/releases/download/v2.5.6/fafarunner-2.5.6-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'fafarunner*'

  checksum64    = '1165d519b452d2cf8dc98c7f04eac9918dfa9e5ce395c20cc47083a0bdb0e687'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
