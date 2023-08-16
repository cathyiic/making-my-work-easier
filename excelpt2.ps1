#ask the user to put the folder path 
$folderPath = Read-Host "Enter folder path: "

#ask the user for the file path 
$excelFilePath = Read-Host "Enter the file path: "

# load the Excel mod
$excel = New-Object -ComObject Excel.Application
$workbook = $excel.Workbooks.Open($excelFilePath)
$worksheet = $workbook.Sheets.Item(1)

# set the var range
$range = $worksheet.UsedRange

# loop through each line and create folder with line as the name
# for loop to get rid of non-alphabet characters + whitespace that will crash code
foreach ($cell in $range) {
    $line = $cell.Text
    $cleanedLine = $line -replace "[^a-zA-Z0-9.]", ""  
    $cleanedLine = $cleanedLine.Trim()  
    
    if ($cleanedLine -ne "") {
        $fullFolderPath = Join-Path -Path $folderPath -ChildPath $cleanedLine
        
        # check if the folder already exists, and create if it doesn't
        if (-not (Test-Path -Path $fullFolderPath)) {
            New-Item -Path $fullFolderPath -ItemType Directory
            Write-Host "Folder '$cleanedLine' created."
        } else {
            Write-Host "Folder '$cleanedLine' already exists."
        }
    }
}

# close excel objects so no leak aka garbage collection lol
$workbook.Close($false)
$excel.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
