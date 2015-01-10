param (
    [Parameter(Mandatory = $true)]
    $Machine
)

 & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm $Machine acpipowerbutton
