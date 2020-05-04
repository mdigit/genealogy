
$Header = 'LastName', 'FirstName', 'Sex', 'DateOfBirth', 'DateOfDeath', 'Hometown', 'PlaceOfBirth', 'PlaceOfResidence', 'Profession'
$P = Import-Csv -Path "./Persons.csv" -Header $Header -Encoding UTF8
$Sql = "INSERT INTO dbo.Persons (LastName,FirstName,Sex,DateOfBirth,DateOfDeath,Hoetown,PlaceOfBirth,PlaceOfResidence,Profession) VALUES`r`n"
$P | ForEach-Object -Process {
    $Sql = $Sql + "`t(" `
        + "'" + $_.LastName + "'," `
        + "'" + $_.FirstName + "'," `
        + "'" + $_.Sex + "'," `
        + "'" + $_.DateOfBirth + "'," `
        + "'" + $_.DateOfDeath + "'," `
        + "'" + $_.Hometown + "'," `
        + "'" + $_.PlaceOfBirth + "'," `
        + "'" + $_.PlaceOfResidence + "'," `
        + "'" + $_.Profession + "')," `
        + "`r`n"
}

if( $Sql.EndsWith(",`r`n") ) {
    $Sql = $Sql.Substring(0, $Sql.Length - 3);
}
$Sql | Out-File -FilePath "./Seed.sql" -Encoding utf8