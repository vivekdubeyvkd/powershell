$drive_letter = "C"
Write-Output "Trying to assign unallocated Space to $drive_letter Drive"

# Get the partition sizes and then resize the volume
$size = (Get-PartitionSupportedSize -DriveLetter $drive_letter)
Resize-Partition -DriveLetter $drive_letter -Size $size.SizeMax
