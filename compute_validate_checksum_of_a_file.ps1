function validate_checksum_of_file {
    param (
        [string]$FileWithAbsolutePath,
        [string]$OriginalChecksum,
        [string]$Algorithm
    )
  
    echo "####### $Algorithm validation started for file $FileWithAbsolutePath  #####"

    $computed_checksum_object = Get-FileHash $FileWithAbsolutePath -Algorithm $CheckSumType | Select-Object Hash
    $computed_checksum_val = ($computed_checksum_object.Hash).ToLower()
    echo "Original $Algorithm checksum of file: $OriginalChecksum"
    echo "Compuated $Algorithm checksum of file: $computed_checksum_val"

    if($OriginalChecksum -eq $computed_checksum_val){
        echo "------------- Checksum MATCH found -------------"
    } else {
        echo "------------- ERROR : Checksum mismatch found -------------"
        echo "####### $Algorithm  validation FAILED for file $FileWithAbsolutePath #####"
    } 
    echo "####### $Algorithm validation completed for file $FileWithAbsolutePath  #####"
}  

<# you can call validate_checksum_of_file function as shown below #>

<# Parameters are explained below --->
> FileWithAbsolutePath: Input file for which checksum needs to be computed and validated against a provided checksum value

> Possible choices for Algorithm are given below:
    SHA1
    SHA256
    SHA384
    SHA512
    MD5

> OriginalChecksum: known checksum value for a file against which the computed checksum for that file needs to be validated 
#>

validate_checksum_of_file -FileWithAbsolutePath "C:\temp\text.txt" -OriginalChecksum "95c57g2d7bf9ae79392e4bfcb5f670198fdbed7f07dc7d53e9f1b7008b27897c0" -Algorithm "SHA256"





