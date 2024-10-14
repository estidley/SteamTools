<#
.SYNOPSIS
Function to output a JSON the entire list of Steam Games and AppIds
.DESCRIPTION
This script gets a list of Steam Games and their AppIds
.EXAMPLE
Out-SteamAppIds.PS1 -Quiet
.OUTPUTS
Outputs a JSON to current directory - .\SteamAppIds.json
#>

[CmdletBinding()]
param (
    # Switch to stop outputting text to shell
    [switch]$Quiet
)

# Have to update the URL everytime the token expires
# https://steamapi.xpaw.me/#

# Get JSON from Steam API
$TOKEN = "YOUR_TOKEN" # May be a bug but currently the TOKEN is not required.
$URL = "https://api.steampowered.com/ISteamApps/GetAppList/v2/?access_token=$TOKEN"

# Get the response from the URL
$Response = Invoke-RestMethod -Uri $URL -Method Get -ContentType "application/json"

# Check if the response is null
if ($Response -eq $null) {
    Write-Error "Failed to get response from $URL"
    exit
}
else {
    if (!$Quiet) {
        Write-Output "Successfully got response from $URL"
    }
}
$cap = @()
foreach ($r in $Response.appList.apps) {
    # Split the first space ' ' in the string
    $PSOB = New-Object -TypeName PSObject
    $PSOB | Add-Member -MemberType NoteProperty -Name 'AppId' -Value $r.AppId
    $PSOB | Add-Member -MemberType NoteProperty -Name 'Name' -Value $r.Name
    $cap += $PSOB
    if (!$Quiet) {
        Write-Output "Added AppId: $($r.AppId) and Name: $($r.Name)"
    }
}


$PSOB | Sort-Object AppId | Out-File -FilePath .\SteamAppIds.json -Force
