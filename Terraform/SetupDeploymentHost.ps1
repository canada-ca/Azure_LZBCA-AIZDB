   # PS script to configur Win16 deployment host
   
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    . choco install chocolatey-core.extension
    . choco.exe feature enable -n=allowGlobalConfirmation
    . choco.exe install git.install
    . choco.exe install vscode
    . choco.exe install googlechrome
    . choco.exe install azcopy
    . choco.exe install putty
    . choco.exe install rsat
    . choco.exe install terraform --version=0.12.17
    . choco.exe install graphviz
    . choco.exe install github-desktop

        #add the AZCOPY path to the path variable
    $AZCOPYpath = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy"
    $actualPath = ((Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH).path)
    $NEWPath = "$actualPath;$AZCOPYpath"
    $NEWPath | Out-File $scriptPath\azcopySystemPath.log
    Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH -Value $NEWPath

    #install Powershell AZ module
    Install-PackageProvider -name NuGet -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name Az -AllowClobber -force

    # Note: If the AzureRM alias fails you may need to update .net and reboot... 
    # (run) . choco.exe install dotnet4.7.2
        
    #enable AzureRM backward compatibility
    Enable-AzureRmAlias -Scope LocalMachine

    #setting the time zone to eastern
    & "$env:windir\system32\tzutil.exe" /s "Eastern Standard Time"
    
    #disable IE enhache Security
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" 
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" 
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 
    Stop-Process -Name Explorer
    
    #adding a VSC shortcut on the public desktop
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("c:\Users\Public\Desktop\Visual Studio Code.lnk")
    $Shortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
    $Shortcut.Save()

    Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'