# This command will delete the cert with Subject matching to certString pattern under \LocalMachine\My cert store location
Get-ChildItem -Path Cert:\LocalMachine\My | where { \$_.subject -match "certString" } | Remove-Item
