Write-Output "Uninstalling default apps"
$apps = @(
    # default Windows 10 apps
    "Microsoft.ZuneMusic"
    "Microsoft.people"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MixedReality.Portal"
    )

$appxprovisionedpackage = Get-AppxProvisionedPackage -Online

if ($app in $apps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    ($appxprovisionedpackage).Where( {$_.DisplayName -EQ $app}) |
        Remove-AppxProvisionedPackage -Online
    Write-Output "Uninstalled " $app
}
else 
    Write-Output $app "was not found.
