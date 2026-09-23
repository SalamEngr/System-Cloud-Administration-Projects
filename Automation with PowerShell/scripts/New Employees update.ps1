Import-Module ActiveDirectory

$Users = Import-Csv "C:\Users\Administrator\Documents\System Administration\PowerShell Project\New Employees.csv"

foreach ($User in $Users) {
    $FirstName = $User.FirstName.Trim()
    $LastName  = $User.LastName.Trim()
    $SamAccountName = $User.SamAccountName.Trim()

    try {
        Set-ADUser `
            -Identity $SamAccountName `
            -GivenName $FirstName `
            -Surname $LastName `
            -DisplayName "$FirstName $LastName" `
            -Description "$FirstName $LastName - $($User.Title.Trim())"

        # Also fix the "Name" (the actual object/cn), which Set-ADUser can't change directly
        Rename-ADObject `
            -Identity (Get-ADUser $SamAccountName).DistinguishedName `
            -NewName "$FirstName $LastName"

        Write-Host "Updated user: $FirstName $LastName ($SamAccountName)" -ForegroundColor Green
    }
    catch {
        Write-Host "Error updating $SamAccountName" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}