
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/fafarunner/releases/download/v2.5.3%2B383/fafarunner-2.5.3.383-windows-setup-x64.exe'

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

  checksum64    = 'cbce04a3c404bd7583c6dfa33f4bc2abf7e5f84d179aff16da877db64adad867'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
