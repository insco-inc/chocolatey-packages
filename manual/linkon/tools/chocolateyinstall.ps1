
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/linkonapp/linkon/releases/download/v1.0.0%2B1.pre/linkon-1.0.0.1.pre-windows-setup-x64.exe'

$arch = Get-OSArchitectureWidth -Compare 64

if (-not $arch) {
  Write-Error "This package does not support x86 architecture. Installation is not allowed."
  exit 1
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'linkon*'

  checksum64    = '2514e828a7b624b1fb659ecf4b2afad1c5840bdc30edd75711582894ccfbae92'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
