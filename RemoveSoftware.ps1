Write-Host "Uninstalling default apps" -foregroundcolor Red 

$apps = @(
    # default Windows 10 apps
    "Microsoft.ZuneVideo"
    )

$appxprovisionedpackage = Get-AppxProvisionedPackage -Online

foreach ($app in $apps) {
    Write-Host  $app ' is being removed' -foregroundcolor green

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    ($appxprovisionedpackage).Where( {$_.DisplayName -EQ $app}) |
        Remove-AppxProvisionedPackage -Online
    Write-Host $app ' was Uninstalled ' 

else 
    Write-Host $app ' was not found.' -foregroundcolor blue
}
