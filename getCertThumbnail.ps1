$thumbprint = (certutil -split -dump "[absolute path to CERT file]" | findstr /c:"Cert Hash(sha1)").Substring(17)[-1]
echo $thumbprint
