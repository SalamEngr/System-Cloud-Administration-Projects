Import-Module ActiveDirectory

$csvPath = "C:\Users\Administrator\Documents\System Administration\PowerShell Project\Disable account\Disable account.csv"

$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $samAccountName = $user.SamAccountName

    try {

        $adUser = Get-ADUser -Identity $samAccountName -ErrorAction Stop

        if ($adUser.Enabled -eq $false) {

            Write-Host "ALREADY DISABLED: $samAccountName" -ForegroundColor Yellow

        }
        else {

            Disable-ADAccount -Identity $samAccountName -ErrorAction Stop

            Write-Host "SUCCESS: Disabled $samAccountName" -ForegroundColor Green
        }
    }
    catch {

        Write-Host "FAILED: Could not disable $samAccountName" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}