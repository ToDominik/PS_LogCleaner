param([switch]$Delete)

$CsvPath = ".\LogDirectories.csv"

$rows = Import-Csv -Path $CsvPath

foreach ($row in $rows) {
    $path = $row.DirectoryPath
    $prefix = $row.FileName
    $days   = [int]$row.KeepForDays
    $cutoff = (Get-Date).AddDays(-$days)

    Write-Host ""
    Write-Host "Cleaning logs in $path older than $days days (before $cutoff) with prefix '$prefix'"

    $files = Get-ChildItem -Path $path -Filter "$prefix*" -File |
             Where-Object { $_.LastWriteTime -lt $cutoff }

      if ($files.Count -eq 0) {
        Write-Host "  (No files found)"
        continue
    }

    Write-Host "Found $($files.Count) file(s):"
    $files | Select-Object FullName, LastWriteTime | Format-Table -AutoSize

    if ($Delete) {
        $files | ForEach-Object {
            Remove-Item -LiteralPath $_.FullName -Force
            Write-Host "Deleted: $($_.FullName)"
        }
    } else {
        Write-Host "Preview only — add -Delete to actually remove them."
    }
}
Write-Host ""
Write-Host "Finish scanning"