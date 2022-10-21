##How To Fix Microsoft Defender In Windows11.ps1
## In case you ungraded to Windows 11 and Microsoft Defender has for some reason deleted itself,
## There are several ways to correct the issue.
## These are all individual one or two liners, so no need to run them all.

## These two one liners reset your security health for your OS
Get-AppxPackage MicrosoftSecHealthUI -AllUsers | Reset-AppxPackage
Get-AppxPackage *Microsoft.Windows.SecHealthUI* | Reset-AppxPackage

## This one liner sets the execution policy so you can run what you need and then attempts to pull the correct package for MS Defender
PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.Windows.SecHealthUI*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

## Sometimes one liner sees the App Manifest is in a weird location, this attempts to add it back.
Add-AppxPackage -Register -DisableDevelopmentMode "C:\Windows\SystemApps\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy\AppXManifest.xml"

## Sometimes the App Manifest is in a weird location, this attempts to add it back.
add-appxpackage -disabledevelopmentmode -register ((Get-AppxPackage Microsoft.SecHealthUI -allusers).InstallLocation + '\AppxManifest.xml')

## This two liner sets the execution policy so you can run what you need, then performs a foreach for the App Manifest, 
## This will hopefully pull back MS Defender.
Set-ExecutionPolicy Unrestricted
Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
