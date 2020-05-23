$filePath = "<absolute file path e.g. EXE or DLL>"
powershell -NoLogo -NoProfile -Command ^
    "(Get-Item -Path $filePath).VersionInfo |" ^
"Format-List -Force"
