$FilePath = "<absolute path to the file>"
$FileExists = Test-Path $FilePath
$replacement_value=32
If ($FileExists -eq $True) {
  # this will replace an occurance of 1.0.0.0(.*) to 1.0.0.${replacement_value}
  $Pat = [regex]  '1.0.0.\d(.+)'
  $PatVal = '1.0.0.' +  $replacement_value
  (Get-Content $AssemblyInfoFile) -replace $Pat, $PatVal | Out-File $FilePath
  Write-Host "++++++++++ Modified $FilePath file +++++++++" 
  type  $FilePath
  Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++" 
} Else {
   Write-Host "File $FilePath doet not exists"
}
