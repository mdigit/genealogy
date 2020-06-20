# Import helper modules
Import-Module "./Helper.psm1"

# Delete seed data in reverse order
$sql += Get-SqlSingleLineComment -Placeholder "Delete table data in reverse order"
Get-ChildItem "./_SeedData" -Recurse -Filter "*.csv" | Sort-Object -Property FullName -Descending | ForEach-Object {
    $tableName = $_.Basename -replace "\d*_",""
    $sql += "DELETE FROM $TableName;`r`n"
}
$sql += "`r`n"

# Get all seed data files and generate SQL scripts of its data
# The file name contains the table name e.g. "01_dbo.SomeTableName.csv" => "dbo.SomeTableName"
Get-ChildItem "./_SeedData" -Recurse -Filter "*.csv" | ForEach-Object {
    # Remove the leading order number e.g. "01_dbo.SomeTableName" => "dbo.SomeTableName" 
    $tableName = $_.Basename -replace "\d*_",""
    $sql += Get-SqlScript -Path "$($_.FullName)" -TableName "$tableName" -SetIdentityInsert $true -Encoding UTF8
}

# Write generated SQL scripts to file
$sql | Out-File -FilePath "./Seed.sql" -Encoding UTF8

# Remove all imported modules
Get-Module | Remove-Module