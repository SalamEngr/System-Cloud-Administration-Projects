Import-Module ActiveDirectory

$reportPath = "C:\Users\Administrator\Documents\System Administration\PowerShell Project\Report\Report1.csv"

Get-ADUser -Filter * -Properties Department,Title,LastLogonDate |
Select-Object Name,SamAccountName,Enabled,Department,Title,LastLogonDate |
Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "AD user report generated successfully." -ForegroundColor Green
Write-Host "Report: $reportPath"