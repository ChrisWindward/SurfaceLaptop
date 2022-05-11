# Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1
# Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1

Write-Output "Uninstalling default apps"
$apps = @(
    # default Windows 10 apps
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MixedReality.Portal"
    )

$appxprovisionedpackage = Get-AppxProvisionedPackage -Online

foreach ($app in $apps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    ($appxprovisionedpackage).Where( {$_.DisplayName -EQ $app}) |
        Remove-AppxProvisionedPackage -Online
}
