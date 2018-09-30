$env:EDITOR = 'code -w'
$env:PATH += ";$(Split-Path $PSScriptRoot -Parent)\Scripts\;"

if ($Host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
}

if (Get-Module oh-my-posh) {
    $ThemeSettings.GitSymbols.BranchSymbol = ''
    $ThemeSettings.GitSymbols.BranchUntrackedSymbol = ''
    $ThemeSettings.GitSymbols.BranchIdenticalStatusToSymbol = '≡'
    $ThemeSettings.GitSymbols.BranchAheadStatusSymbol = '↑'
    $ThemeSettings.GitSymbols.BranchBehindStatusSymbol = '↓'
    $ThemeSettings.PromptSymbols.ElevatedSymbol = '👑'
    $ThemeSettings.PromptSymbols.FailedCommandSymbol = 'x'
    $ThemeSettings.PromptSymbols.VirtualEnvSymbol = '🐍'
    $ThemeSettings.Colors.AdminIconForegroundColor = [ConsoleColor]::Yellow
    $ThemeSettings.Colors.PromptBackgroundColor = [ConsoleColor]::Gray
    $ThemeSettings.Colors.PromptForegroundColor = 'Black'
    $ThemeSettings.Colors.SessionInfoBackgroundColor = [ConsoleColor]::DarkGreen
    $ThemeSettings.Colors.SessionInfoForegroundColor = [ConsoleColor]::Black
    $ThemeSettings.Colors.GitLocalChangesColor = [ConsoleColor]::DarkYellow
}
