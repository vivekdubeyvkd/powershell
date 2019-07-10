[CmdletBinding()] 
param(
	[String]$MSIFilePath,
	[String]$componentValue
)

function Get-MsiDatabaseVersion {
	param (
		[String]$filePath,
		[String]$compValue
	)

	try {
	        $FilePath =   Convert-Path $filePath
		$com_object = New-Object -com WindowsInstaller.Installer 

        	$database = $com_object.GetType().InvokeMember( 
            	"OpenDatabase", 
            	"InvokeMethod", 
            	$Null, 
            	$com_object, 
            	@($FilePath, 0) 
        	) 
        	$query = "SELECT * FROM Registry where Component_='$compValue'" 
        	$View = $database.GetType().InvokeMember( 
            	"OpenView", 
            	"InvokeMethod", 
            	$Null, 
            	$database, 
            	($query) 
        	)
        	$View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null) 
 
        	$record = $View.GetType().InvokeMember( 
            	"Fetch", 
            	"InvokeMethod", 
            	$Null, 
            	$View, 
            	$Null 
        	)
        	#$msi_props = @{} 
		$count = 0
        	while ($record -ne $null) { 
            		#$msi_props[$record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 1)] = $record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 6) 
            		$record = $View.GetType().InvokeMember( 
                	"Fetch", 
                	"InvokeMethod", 
                	$Null, 
                	$View, 
                	$Null 
            		) 
			$count++
        	}
        	#$msi_props
		return $count

	} catch {
		throw "Failed to get MSI file version the error was: {0}." -f $_
	}
}

$countValue = Get-MsiDatabaseVersion -filePath $MSIFilePath -compValue $componentValue
write($countValue)
