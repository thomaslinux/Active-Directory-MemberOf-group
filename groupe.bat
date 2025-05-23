@echo OFF
:: demande le groupe si aucun groupe nest fourni
if "%1"=="" (
set /p filtre="groupe="
) else (
:: recupere le premier argument
set filtre=%1
)
:: invoque une commande powershell qui liste nom prenom login, trie selon le login et affiche sous forme de tableau
powershell -command "Get-ADGroupMember -Identity '%filtre%' | Select-Object Name, SamAccountName | Sort-Object SamAccountName | Format-Table -AutoSize"
pause
