# Example PowerShell script to create users in Active Directory

# Set parameters for new accounts
$defaultPassword = ConvertTo-SecureString "Password123" -AsPlainText -Force
$ouPath = "OU=Users,DC=yourdomain,DC=com" # Specify the path to the OU where accounts will be created

# Function to get a username from a file

function Get-UsernameFromFile {
    param (
        [string]$filePath
    )

    $usernames = Get-Content $filePath
    return $usernames | Get-Random
}

# Path to the file
$namesFilePath = "path/to/your/namesfile.txt"

# User creation loop
for ($i = 1; $i -le 1000; $i++) {
    $username = Get-UsernameFromFile -filePath $namesFilePath
    $userPrincipalName = "$username@yourdomain.com"

    New-ADUser -Name $username `
               -GivenName $username `
               -Surname "TestUser" `
               -UserPrincipalName $userPrincipalName `
               -Path $ouPath `
               -AccountPassword $defaultPassword `
               -PasswordNeverExpires $true `
               -Enabled $true
}
