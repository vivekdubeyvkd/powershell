Write-Output "Trying to use unallocated Space to D Drive"
$drive_letter = "D"

# Script to get the partition sizes and then resize the volume
$size = (Get-PartitionSupportedSize -DriveLetter $drive_letter)
Resize-Partition -DriveLetter $drive_letter -Size $size.SizeMax
