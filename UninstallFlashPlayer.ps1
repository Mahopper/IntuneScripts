<#PSScriptInfo

.VERSION 1.0

.AUTHOR Mark Hopper

.COMPANYNAME Microsoft 

.COPYRIGHT (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
#>

<#
    .SYNOPSIS
    Removes Flash from Windows 10 using Adobe's uninstaller and KB4577586

    .DESCRIPTION
    Checks if KB4577586 is installed. If not, downloads and installs from MSU catalog, and then downloads and runs Adobe uninstaller. Can be packaged as IntuneWin32.

#>


$winver = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId
new-item c:\FlashRemove -itemtype directory
$WULocation = "C:\FlashRemove\KB4577586.msu"
$OSArch = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
$downloadSource
$downloadUninstaller = 'https://fpdownload.macromedia.com/get/flashplayer/current/support/uninstall_flash_player.exe'
$result = systeminfo.exe | findstr KB4577586

if ($result)
 {
    $Uninstaller = Invoke-WebRequest -Uri $downloadUninstaller -OutFile 'c:\FlashRemove\uninstaller.exe'
    c:\FlashRemove\uninstaller.exe -uninstall
 }
 else
 {
    If (($winver -eq '2009') -or ($winver -eq '2004'))
        {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_c9bb49df325c20ddc147137b3f769fa44d800dde.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_238da6b730a3f6a709f31980b87e2d8ecb0a8973.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation
            wusa.exe $WULocation /quiet /norestart -Wait
        }

    If ($winver -eq '1909')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_ec16e118cd8b99df185402c7a0c65a31e031a6f0.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_002b1ffa7fb31836aeaed74007a6949d31a96460.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1903')
    {
          If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_ec16e118cd8b99df185402c7a0c65a31e031a6f0.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_002b1ffa7fb31836aeaed74007a6949d31a96460.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation 
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1809')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_d0f434327db9e3308b86591c248c825c03687632.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_947f151a8bb5a0b0797702e53431c52d56c02c32.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1803')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_07eba1db5a2cfac83683bd43d727a3195a94b39b.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_b737ffa841d2aab5cbf5e00560b93577a6d0b4d2.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation 
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1709')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_e0921a984710c3992b68e570115b29b9e8e5c708.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_f1ee6a8c9cdc91b4486fde9dc98c9dc5f9babc77.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation 
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1703')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_84ef2e9e7eb6bd2a3cfa5a8aef59adccab988e7d.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_9a3ade6ec24a2627276cbd7df0b39ece8ffee269.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation 
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    If ($winver -eq '1607')
    {
            If($OSArch -eq '64-bit')
                {$downloadSource = 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x64_809b9640d04c5af4c7e78499052abaa936cb670a.msu'}
            If($OSArch -eq '32-bit')
                {$downloadSource = 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2020/10/windows10.0-kb4577586-x86_97a4f342e91e40b921727a8b944a29f7155f3ca1.msu'}
            Invoke-WebRequest -Uri $downloadSource -OutFile $WULocation 
            wusa.exe $WULocation /quiet /norestart -Wait
    }

    $Uninstaller = Invoke-WebRequest -Uri $downloadUninstaller -OutFile 'c:\FlashRemove\uninstaller.exe'
    c:\FlashRemove\uninstaller.exe -uninstall
}
