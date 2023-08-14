#download users from a csv file, and compare multiple accounts with the same roles
#and department. output a list of how many users are in the department with their role

#for this i am assuming its from a notepad file

#user data should look like Name, Role, Department

#define path to grab names from
$notepadFilePath =   

#create a dictionary to store data
$userData = @{}

#for loop to loop thru each line and parse the data 
foreach ($line in $lines){
    $field = $line -split "," #separates data
    if ($fields.Length -eq 3) {
        $username = $fields[0].Trim()
        $role = $fields[1].Trim()
        $department = $fields[2].Trim()

        #create/update user entry in the dictionary
        if (-not $users.ContainsKey($department)) {
            $users[$department] = @{}
        }

        if (-not $users[$department].ContainsKey($role)) {
            $users[$department][$role] = @()
        }

        $users[$department][$role] += $username
    }
}

#output the user counts by department and role
foreach ($dept in $users.Keys) {
    Write-Host "Department: $dept"
    foreach ($role in $users[$dept].Keys) {
        $userCount = $users[$dept][$role].Count
        Write-Host "  Role: $role, Users: $userCount"
    }
    Write-Host ""
}
