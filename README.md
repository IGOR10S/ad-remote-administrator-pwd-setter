# ad-remote-administrator-pwd-setter
This PowerShell script establishes a remote session on the target computer via PS Remoting/WinRM using the required administrative credentials, then logs into the local Administrator account via ADSI (WinNT provider), updates its password, and disables its expiration. Finally, it outputs the result of the password update operation
