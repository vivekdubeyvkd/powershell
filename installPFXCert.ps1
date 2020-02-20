$Pass = ConvertTo-SecureString -String "password" -Force -AsPlainText
$User = "username"
$Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User, $Pass
Import-PfxCertificate -FilePath "[absolute path to pfx file]" -CertStoreLocation Cert:\LocalMachine\TrustedPublisher -Password $Cred.Password
