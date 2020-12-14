$result = systeminfo.exe | findstr KB4577586
$path = 'HKLM:\SOFTWARE\Macromedia\FlashPlayerPepper'

if ($result -and !(Test-Path $path))
 {
    
    Write-Output "Found KB4577586 and Pepper is gone."
    exit 0
 }
 else
 {
    exit 1
 }