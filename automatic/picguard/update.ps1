$ErrorActionPreference = 'Stop'
import-module au

# add headers
$headers = @{
    "Authorization" = "Bearer $Env:PG_RELEASE_TOKEN"
    "Content-Type"  = "application/json"
}

function global:au_GetLatest {
    $LatestRelease = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/picguard/picguard/releases/latest" -Headers $headers
    $LatestTag = $LatestRelease.tag_name
    $LatestVersion = $LatestTag.Replace('v', '').Replace('+', '.')
    $LatestURL64 = ($LatestRelease.assets | Where-Object {$_.name.StartsWith("picguard-") -and $_.name.EndsWith("-windows-setup-x64.exe")}).browser_download_url

    if (!$LatestURL64) {
        throw "64bit URL is missing!"
    }

    Write-Output "newversion=$($LatestVersion)" >> $Env:GITHUB_OUTPUT

    @{
        URL64        = $LatestURL64
        Tag          = $LatestTag
        Version      = $LatestVersion
        ReleaseNotes = $LatestRelease.body
        IconUrl      = "https://raw.githubusercontent.com/picguard/picguard/$($LatestTag)/logo/logo.png"
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*(\$)url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }

        "picguard.nuspec" = @{
            "(\<iconUrl\>).*?(\</iconUrl\>)"           = "`$1$($Latest.IconUrl)`$2"
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1`n  $($Latest.ReleaseNotes)`n`$2"
        }
    }
}

update -ChecksumFor 64
