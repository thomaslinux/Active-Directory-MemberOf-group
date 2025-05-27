param (
    [string]$groupe # Prend dossier en premier argument de commande
)
if ([string]::IsNullOrEmpty($groupe)) { # si pas d'argument de commande
    $groupe = Read-Host "Chemin complet vers le dossier"
}

# Créé une liste pour stocker les adresses email
$emailArray = @()

# Pour chaque Objet / utilisateur dans chaque groupe
$groupe | ForEach-Object {
	"Membres de " + $groupe
    Get-ADGroupMember -Identity $_ | 
    ForEach-Object {
        $user = Get-ADUser -Identity $_.SamAccountName -Properties Mail # Ajoute le mail de l'utilisateur dans l'Objet user
        $email = $user.Mail
        
        # Ajoute les adresses email dans la liste
        $emailArray += $email
        
        [PSCustomObject]@{
            Identity = $_.Name
            Login    = $_.SamAccountName
            Email    = if ($email) { $email } else { "pas de mail" }
        }
    } | Sort-Object Login | Format-Table -AutoSize
}

# Affiche la liste des adresses email séparées par un ;
$emailArray -join ';'
