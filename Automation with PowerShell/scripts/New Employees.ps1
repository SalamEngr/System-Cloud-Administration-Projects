Import-Module ActiveDirectory

$Users = Import-Csv "C:\Users\Administrator\Documents\System Administration\PowerShell Project\New Employees.csv"

$UsersOU = "OU=User accounts,DC=LABHOME,DC=local"
$GroupsOU = "OU=Groups,DC=LABHOME,DC=local"

$Password = ConvertTo-SecureString "TempPassword2026" -AsPlainText -Force

foreach ($User in $Users) {

    try {

        # Create the user account in the User accounts OU
        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName)" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -SamAccountName $User.SamAccountName `
            -Department $User.Department `
            -Title $User.Title `
            -Path $UsersOU `
            -AccountPassword $Password `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Host "Created user: $($User.FirstName) $($User.LastName)" -ForegroundColor Green

        # Find the department security group

        $Group = Get-ADGroup `
            -Filter "Name -eq '$($User.OU)'" `
            -SearchBase $GroupsOU

        # Add the user to the department security group

        Add-ADGroupMember `
            -Identity $Group `
            -Members $User.SamAccountName

        Write-Host "Added $($User.SamAccountName) to $($User.OU) group" -ForegroundColor Cyan

    }

    catch {

        Write-Host "Error processing $($User.SamAccountName)" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}