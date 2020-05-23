$DomainUser = $env:username
$LocalGroup = "Administrators"
$Computer   = $env:computername
$Domain     = $env:userdomain
$group =([ADSI]"WinNT://$Computer/$LocalGroup,group")
$group.psbase.Invoke("Add",([ADSI]"WinNT://$Domain/$DomainUser").path)
