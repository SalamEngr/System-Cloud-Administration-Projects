Import-Module ActiveDirectory

$csvPath = "C:\Users\Administrator\Documents\System Administration\PowerShell Project\password reset\Password Reset.csv"

$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    try {

        $samAccountName = $user.SamAccountName

        $newPassword = ConvertTo-SecureString "TempPassword2026" -AsPlainText -Force

        Set-ADAccountPassword `
            -Identity $samAccountName `
            -Reset `
            -NewPassword $newPassword

        Set-ADUser `
            -Identity $samAccountName `
            -ChangePasswordAtLogon $true

        Write-Host "SUCCESS: Password reset for $samAccountName" -ForegroundColor Green
    }

    catch {

        Write-Host "FAILED: Could not reset password for $samAccountName" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}