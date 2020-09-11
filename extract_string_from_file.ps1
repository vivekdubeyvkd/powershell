$FilePath = "<absoulte file path>"
$matchValue = select-string -Path $FilePath -Pattern "<pattern>" | % { $_.Matches } | % { $_.Value.Trim() }
echo $matchValue 
$matchValue = select-string -Path $FilePath -Pattern "<pattern>.*" | % { $_.Matches } | % { $_.Value.Trim() }
echo $matchValue 
$matchValue = select-string -Path $FilePath -Pattern ".*<pattern>" | % { $_.Matches } | % { $_.Value.Trim() }
echo $matchValue 
