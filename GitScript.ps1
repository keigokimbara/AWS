[string]$CurrentDirectory = Get-Location
Add-Type -Assembly System.Windows.Forms
[System.Windows.Forms.DialogResult]$ans = [System.Windows.Forms.MessageBox]::Show("Continue?", "PowerShell", "YesNo", "Question", "button1")
If($ans -eq [System.Windows.Forms.DialogResult]::Yes)
{
    git init
    Write-Output "appsettings.json" | Add-Content .\.gitignore -Encoding Default
    Write-Output "appsettings.Development.json" | Add-Content .\.gitignore -Encoding Default
    Write-Output "git*" | Add-Content .\.gitignore -Encoding Default
    Write-Output ".gitignore" | Add-Content .\.gitignore -Encoding Default
    git add .
    git commit -m "first commit"
    [string]$GitURL = Read-Host "Please input Git URL"
    [string]$GitReplaceURL = $GitURL.Remove(0, 8)
    [string]$GitAccessTokenURL = "https://" + "keigokimbara:" +"Kingo1016%40" + "@" + $GitReplaceURL
    git remote add origin $GitAccessTokenURL
    git push origin master
    [System.Windows.Forms.MessageBox]::Show("Done.", "PowerShell", "OK", "Information", "button1")
}