[CmdletBinding()] 
param(
	[Parameter(Mandatory=$True, 
	ValueFromPipeline=$True, 
	ValueFromPipelineByPropertyName=$True, 
	HelpMessage='Error !!!!! Invalid MSI path !!!!! please provide a valid MSI you would like to query and rerun ...... exiting .......')]
	[IO.FileInfo[]] $MSIFilePath
)

function Get-MsiDatabaseVersion {
	param (
		[IO.FileInfo[]] $FilePath
	)
	try {
		$com_object = New-Object -com WindowsInstaller.Installer 
		$database = $com_object.GetType().InvokeMember( 
            	"OpenDatabase", 
            	"InvokeMethod", 
            	$Null, 
            	$com_object, 
            	@($FilePath.FullName, 0) 
        	) 
        	$query = "SELECT * FROM Registry" 
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
        $msi_props = @{} 
		    $count = 0
        while ($record -ne $null) { 
            $msi_props[$record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 1)] = $record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 6) 
            $record = $View.GetType().InvokeMember( 
                "Fetch", 
                "InvokeMethod", 
                $Null, 
                $View, 
                $Null 
            )
	    $count++
         }
         $count
         $msi_props

	} catch {
		throw "Failed to get MSI file version the error was: {0}." -f $_
	}
}

Get-MsiDatabaseVersion -FilePath $MSIFilePath
