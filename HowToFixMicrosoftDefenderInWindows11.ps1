Get-AppxPackage MicrosoftSecHealthUI -AllUsers | Reset-AppxPackage
Get-AppxPackage *Microsoft.Windows.SecHealthUI* | Reset-AppxPackage
PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.Windows.SecHealthUI*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
Add-AppxPackage -Register -DisableDevelopmentMode "C:\Windows\SystemApps\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy\AppXManifest.xml"
add-appxpackage -disabledevelopmentmode -register ((Get-AppxPackage Microsoft.SecHealthUI -allusers).InstallLocation + '\AppxManifest.xml')
Set-ExecutionPolicy Unrestricted
Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}