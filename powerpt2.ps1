#ask the user to put the folder path 
$folderPath = Read-Host "Enter folder path: "

#ask the user for the file path 
$notepadFilePath = Read-Host "Enter the file path: "

#read the lines from the notepad 
$lines = Get-Content -Path $notepadFilePath

#loop through lines of notepad and create folders with the line as the name 
foreach ($line in $lines){
    $cleanedLine = $line -replace "[^a-zA-Z0-9.]", "" 
    $cleanedLine = $cleanedLine.Trim()

    if ($cleanedLine -ne ""){
        $fullFolderPath = Join-Path -Path $folderPath -ChildPath $cleanedLine

        #ensure that the folder doesn't already exist - so duplicates not created
        if (-not (Test-Path -Path $fullFolderPath)){
            New-Item -Path $fullFolderPath -ItemType Directory
            Write-Host "Folder '$cleanedLine' created."
        } else{
            Write-Host "Folder '$cleanedLine' already exists."
        }
    }
}