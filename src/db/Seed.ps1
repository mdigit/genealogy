
Import-Module "./Helper.psm1"

$sql += Get-SqlScript -Path "./Persons.csv" -TableName "dbo.Persons" -SetIdentityInsert $true -Encoding UTF8

$sql | Out-File -FilePath "./Seed.sql" -Encoding UTF8