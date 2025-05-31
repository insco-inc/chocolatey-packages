
$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FaFaRunner/FaFaRunner/releases/download/v2.5.1%2B381/fafarunner-2.5.1.381-windows-x64.exe'

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

  checksum64    = 'e448208ba6c7e1cb931acbfdaef63ec8bbcb77ec042ce61e2cf17d2b4ee6b793'
  checksumType64= 'sha256'

  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
