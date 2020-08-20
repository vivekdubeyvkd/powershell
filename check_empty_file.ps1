function check_empty_file {
    param (
        [string]$AbsoluteFilePath
    )

    if (Get-Content $AbsoluteFilePath){
       echo "File $AbsoluteFilePath has content"
    }else{
       echo "File $FileWithAbsolutePath is a ZERO byte file"
    }
}

check_empty_file -AbsoluteFilePath "C:\temp\test.txt"
