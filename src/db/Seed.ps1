function BuildSql {
    $sqlScript = "DELETE dbo.Persons;`r`n"

    $personData = Import-Csv -Path "./Persons.csv" -Encoding UTF8

    $personData | ForEach-Object -Process {
        $lines += "`t($($_.PersonId),$($_.LastName),$($_.FirstName),$($_.Sex),$($_.DateOfBirth),$($_.DateOfDeath),$($_.Hometown),$($_.PlaceOfBirth),$($_.PlaceOfResidence),$($_.Profession)),`r`n"
    }
    if ($lines.Length -gt 0) {
        $sqlScript += "SET IDENTITY_INSERT dbo.Persons ON;`r`n"
        ForEach ($header in $personData[0].psobject.properties.name) {
            $columnNames += $header + ","
        }
        $sqlScript += "INSERT INTO dbo.Persons ($($columnNames.TrimEnd(','))) VALUES`r`n"
        ForEach ($line In $lines) {
            $sqlScript += $line
        }
        # Replace the last coma by a semicolon
        $sqlScript = $sqlScript -replace ",`r`n$", ";`r`n"
        $sqlScript += "SET IDENTITY_INSERT dbo.Persons OFF;`r`n"
    }

    if ( $sqlScript.EndsWith(",`r`n") ) {
        $sqlScript = $sqlScript.Substring(0, $sqlScript.Length - 3);
    }
    return $sqlScript
}

BuildSql | Out-File -FilePath "./Seed.sql" -Encoding utf8