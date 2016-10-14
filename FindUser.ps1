Import-Module ActiveDirectory

Function FindUser($user) {
    $dcs = Get-ADForest|select -ExpandProperty Domains
	foreach($dc in $dcs) {
        Write-Output "Searching in $dc..."
        Get-ADUser -Filter 'samaccountname -eq $user' -Server $dc|select name,SamAccountName
    }
}
