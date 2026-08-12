$cred = Get-Credential

$remotePC = "<TARGET_HOSTNAME/IP>"

Invoke-Command -ComputerName $remotePC -Credential $cred -ScriptBlock {

    # Use ADSI to get a reference to local Administrator account
    $admin = [ADSI]"WinNT://./Administrator,user"

    # Set a new password for the Administrator account
    $admin.SetPassword("<PASSWORD_TO_SET>")

    # Save changes made to the ADSI object
    $admin.SetInfo()
    
    # 0x10000 matches the ADS_UF_DONT_EXPIRE_PASSWD flag.
    # Performs a bitwise OR (-bor), adding that flag to any flags already present on the account without deleting the others.
    $admin.UserFlags.Value = $admin.UserFlags.Value -bor 0x10000  # Password never expires

    $admin.SetInfo()

    Write-Host "Hostname: $env:COMPUTERNAME"
    Write-Host "Status:   Account password changed"
}
