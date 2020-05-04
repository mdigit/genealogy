
$Header = 'LastName', 'FirstName', 'Sex', 'DateOfBirth', 'DateOfDeath', 'Hometown', 'PlaceOfBirth', 'PlaceOfResidence', 'Profession'
$P = Import-Csv -Path "./Persons.csv" -Header $Header -Encoding UTF8
$Sql = "DELETE dbo.Persons;`r`n" `
    + "INSERT INTO dbo.Persons (LastName,FirstName,Sex,DateOfBirth,DateOfDeath,Hometown,PlaceOfBirth,PlaceOfResidence,Profession) VALUES`r`n"
$P | ForEach-Object -Process {
    $Sql = $Sql + "`t(" `
        + "'" + $_.LastName + "'," `
        + "'" + $_.FirstName + "'," `
        + "'" + $_.Sex + "'," `
        + "'" + $_.DateOfBirth + "',"
    if ($_.DateOfDeath) {
        $Sql = $Sql + "'" + $_.DateOfDeath + "',"
    }
    else {
        $Sql = $Sql + "null,"
    }
    if ($_.Hometown) {
        $Sql = $Sql + "'" + $_.Hometown + "',"
    }
    else {
        $Sql = $Sql + "null,"
    }
    if ($_.PlaceOfBirth) {
        $Sql = $Sql + "'" + $_.PlaceOfBirth + "',"
    }
    else {
        $Sql = $Sql + "null,"
    }
    if ($_.PlaceOfResidence) {
        $Sql = $Sql + "'" + $_.PlaceOfResidence + "',"
    }
    else {
        $Sql = $Sql + "null,"
    }
    if ($_.Profession) {
        $Sql = $Sql + "'" + $_.Profession + "'),"
    }
    else {
        $Sql = $Sql + "null),"
    }
    $Sql = $Sql + "`r`n"
}

if ( $Sql.EndsWith(",`r`n") ) {
    $Sql = $Sql.Substring(0, $Sql.Length - 3);
}
$Sql | Out-File -FilePath "./Seed.sql" -Encoding utf8