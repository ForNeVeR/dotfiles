# PowerShell aliases:
New-Alias Get-Path D:\X-Files\Dropbox\Projects\ps-path\Get-Path.ps1
New-Alias Add-Path D:\X-Files\Dropbox\Projects\ps-path\Add-Path.ps1

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
    & $emacsClient -f $serverFile -a $emacs (Safe-Resolve-Path $filename)
}