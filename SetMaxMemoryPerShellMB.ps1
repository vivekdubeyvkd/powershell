Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 5000
Set-Item WSMan:\localhost\Plugin\Microsoft.PowerShell\Quotas\MaxMemoryPerShellMB 5000

Restart-Service winrm
