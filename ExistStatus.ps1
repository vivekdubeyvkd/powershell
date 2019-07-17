## version1 for ExistStatus.ps1
Write-host "hello"
exit 0

# sample run to get the exit code from version1 of the above script
#PS C:> .\ExistStatus.ps1
#hello
#PS C:> echo $LASTEXITCODE
#0

# version2 for ExistStatus.ps1
Write-host "hey"
exit 5

# sample run to get the exit code from version2 of the above script
#PS C:> .\ExistStatus.ps1
#hey
#PS C:> echo $LASTEXITCODE
#5
