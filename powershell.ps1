# define the path of the notepad file - CHANGE THIS !!
$notepadFilePath = "C:\Users\Catherine.Ichwan\Desktop\hehe\name.txt"

# read the lines 
$lines = Get-Content -Path $notepadFilePath

# loop through each line and create folder with line as the name
# for loop to get rid of non-alphabet characters + whitespace that will crash code

foreach ($line in $lines) {
    $cleanedLine = $line -replace "[^a-zA-Z0-9.]", ""  
    $cleanedLine = $cleanedLine.Trim()  
    
    if ($cleanedLine -ne "") {
    # CHANGE THIS BUT LEAVE \$cleanedLine AT THE END !!
        $folderPath = "C:\Users\Catherine.Ichwan\Desktop\hehe\$cleanedLine"
        
        # check if the folder already exists, and create if it doesn't
        if (-not (Test-Path -Path $folderPath)) {
            New-Item -Path $folderPath -ItemType Directory
            Write-Host "Folder '$cleanedLine' created."
        } else {
            Write-Host "Folder '$cleanedLine' already exists."
        }
    }
}
