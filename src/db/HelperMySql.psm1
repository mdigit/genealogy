<#
.SYNOPSIS
Gets a SQL script containing inserts for the given data.

.DESCRIPTION
Generic function for building SQL scripts inserting CSV data.

.PARAMETER Path
Path to the CSV file containing the data to insert.

.PARAMETER Encoding
The encoding of the input file.

.PARAMETER TableName
Table name for the insert statements. Include schema name e.g. "[schema.]Table".

.PARAMETER SetIdentityInsert
Value indicating whether to set identity insert or not.

.EXAMPLE
BuildSql -Path "./Persons.csv" -TableName "dbo.Persons" -SetIdentityInsert $true

.NOTES
-
#>
function Get-SqlScript {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]
        $Path,
        [Parameter(Mandatory)]
        [String]
        $Encoding,
        [Parameter(Mandatory)]
        [String]
        $TableName,
        [Parameter(Mandatory)]
        [Boolean]
        $SetIdentityInsert
    )

    # Remove schema part e.g. "dbo."
    $TableName = $TableName -replace "\w*\."

    $sqlScript = "/* Populate '$TableName' */`r`n"
    [System.Collections.ArrayList]$lines = @()

    $csvData = Get-Content -Path $Path -Encoding $Encoding
    $columnNames = $csvData[0] -join ","

    $csvData | Select-Object -Skip 1 | ForEach-Object {
        $lines.Add("`t($($_ -join ","))") > $null
    }

    If ($lines.Length -gt 0) {
        $sqlScript += "INSERT INTO $TableName ($columnNames) VALUES`r`n"

        $sqlScript += $lines -join ",`r`n"
        $sqlScript += ";`r`n"
    }

    return $sqlScript + "`r`n"
}

<#
.SYNOPSIS
Gets a SQL single line comment.

.PARAMETER Placeholder
Placeholder to decorate.
#>
function Get-SqlSingleLineComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]
        $Placeholder
    )

    return "/* $Placeholder */`r`n"
}