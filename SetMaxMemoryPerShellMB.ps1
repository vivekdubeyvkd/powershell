Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 30000 #30GB
Set-Item WSMan:\localhost\Plugin\Microsoft.PowerShell\Quotas\MaxMemoryPerShellMB 30000 #30GB
Restart-Service winrm
