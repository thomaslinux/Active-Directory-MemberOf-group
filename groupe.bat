@echo OFF
:: if "%1"=="" (
:: set /p filtre="groupe="
:: ) else (
:: set filtre=%1
:: )
powershell.exe -ExecutionPolicy Bypass -File "groupe.ps1" %*
:: powershell -command "Get-ADGroupMember -Identity '%filtre%' | Select-Object Name, SamAccountName | Sort-Object SamAccountName | Format-Table -AutoSize"
:: pause
