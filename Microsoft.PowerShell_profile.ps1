# PowerShell aliases:
New-Alias Get-Path D:\X-Files\Dropbox\Projects\ps-path\Get-Path.ps1
New-Alias Add-Path D:\X-Files\Dropbox\Projects\ps-path\Add-Path.ps1

# WinAPI callbacks:
$signature = @'
[DllImport("User32.dll")]
public static extern bool BringWindowToTop(IntPtr hWnd);

[DllImport("User32.dll")]
public static extern IntPtr GetForegroundWindow();

[DllImport("Kernel32.dll")]
public static extern long GetCurrentThreadId();

[DllImport("User32.dll")]
public static extern long GetWindowThreadProcessId(
    IntPtr hWnd,
    IntPtr lpdwProcessId);

[DllImport("User32.dll")]
public static extern bool AttachThreadInput(
    long idAttach,
    long idAttachTo,
    bool fAttach);

[DllImport("User32.dll")]
public static extern IntPtr SetActiveWindow(IntPtr hWnd);

[DllImport("User32.dll")]
public static extern IntPtr SetFocus(IntPtr hWnd);

[DllImport("User32.dll")]
public static extern bool SetForegroundWindow(int hWnd);

[DllImport("User32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
'@

$user32 = Add-Type -Name User32 -MemberDefinition $signature -PassThru

function Bring-WindowToTop($windowHandle) {
    $user32::BringWindowToTop($windowHandle)
}

function Get-ForegroundWindow() {
    $user32::GetForegroundWindow()
}

function Get-CurrentThreadId() {
    $user32::GetCurrentThreadId()
}

function Get-WindowThreadProcessId($windowHandle) {
    $user32::GetWindowThreadProcessId($windowHandle, 0)
}

function Attach-ThreadInput($idAttach, $idAttachTo, $fAttach) {
    $user32::AttachThreadInput($idAttach, $idAttachTo, $fAttach)
}

function Set-ActiveWindow($handle) {
    $user32::SetActiveWindow($handle)
}

function Set-Focus($handle) {
    $user32::SetFocus($handle)
}

function Set-ForegroundWindow($handle) {
    $user32::SetForegroundWindow($handle)
}

function Show-Window($handle, $cmd) {
    $user32::ShowWindow($handle, $cmd)
}

function Send-WindowToFront($windowHandle) {
    $currentWindowHandle = Get-ForegroundWindow
    $currentWindowThread = Get-WindowThreadProcessId $currentWindowHandle
#    $currentWindowThread = Get-CurrentThreadId
    $newWindowThread = Get-WindowThreadProcessId $windowHandle
    Attach-ThreadInput $currentWindowThread $newWindowThread $true
    Bring-WindowToTop $windowHandle
    Show-Window $windowHandle 10
    Set-ActiveWindow $windowHandle
    Set-ForegroundWindow $windowHandle
    Set-Focus $windowHandle
    Attach-ThreadInput $currentWindowThread $newWindowThread $false
}

# Useful functions:
function Safe-Resolve-Path($path) {
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
        $path)
}

# Other aliases:
New-Alias edit 'C:\Program Files\Sublime Text 2\sublime_text.exe'
New-Alias whereis D:\X-Files\Dropbox\Scripts\whereis.cmd
function emacs($filename) {
    $emacsDirectory = 'E:\Programs\emacs-24.2\bin'
    $emacs = Join-Path $emacsDirectory 'runemacs.exe'
    $emacsClient = Join-Path $emacsDirectory 'emacsclientw.exe'
    $serverFile = Safe-Resolve-Path '~\.emacs.d\server\server'

    # If parameter is not defined, just find emacs window and send it to front:
    if (!$filename) {
		if (Test-Path $serverFile) {
			$emacsPid = (Get-Content $serverFile)[0].Split(' ')[1]
			$process = Get-Process -Id $emacsPid
			$windowHandle = $process.MainWindowHandle
			Send-WindowToFront $windowHandle
		} else {
			& $emacs
		}
    } else {
        & $emacsClient -f $serverFile -a $emacs (Safe-Resolve-Path $filename)
    }
}