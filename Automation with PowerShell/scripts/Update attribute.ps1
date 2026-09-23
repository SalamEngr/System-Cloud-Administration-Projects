Import-Module ActiveDirectory

$csvPath = "C:\Users\Administrator\Documents\System Administration\PowerShell Project\Update attribute\Update attribute.csv"

$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $samAccountName = $user.SamAccountName

    try {

        # Check whether the AD account exists
        $adUser = Get-ADUser -Identity $samAccountName -ErrorAction Stop

        # Update user attributes
        Set-ADUser -Identity $samAccountName `
            -Department $user.Department `
            -Title $user.Title `
            -ErrorAction Stop

        Write-Host "SUCCESS: Updated $samAccountName" -ForegroundColor Green
    }
    catch {

        Write-Host "FAILED: Could not update $samAccountName" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}