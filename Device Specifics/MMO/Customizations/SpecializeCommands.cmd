@echo off

REM Device id configuration
REG ADD "HKLM\SOFTWARE\WowAA32Node\Microsoft\Windows\CurrentVersion\Internet Settings\Configuration" /v PartnerSearchCode /t REG_SZ /d NOKMSB /f

REM Battery slider
powercfg /setdcvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 50
powercfg /setacvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 33
powercfg /setdcvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 33
powercfg /setacvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 25

REM Disable fast startup as this is not supported by firmware and will cause issues
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

REM DPI settings currently cause isses
REM REG ADD "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v AppliedDPI /t REG_DWORD /d 216 /f
REM REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 216 /f
REM REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v Win8DpiScaling /t REG_DWORD /d 1 /f

REM Taskbar layout
powershell.exe -command "cd \;Import-StartLayout -LayoutPath '\Windows\OEM\TaskbarLayoutModification.xml' -MountPath $env:SystemDrive"

REM System apps
dism.exe /Add-ProvisioningPackage /PackagePath:C:\Windows\Provisioning\Packages\OEMApps.ppkg