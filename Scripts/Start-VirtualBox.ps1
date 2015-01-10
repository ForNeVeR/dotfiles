param (
    [Parameter(Mandatory = $true)]
    $Machine
)

 & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm $Machine --type headless
