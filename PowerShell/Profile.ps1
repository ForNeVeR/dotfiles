param(
	$Options
)

$env:HOME = Resolve-Path ~
$env:USERNAME = $Options.UserName
$env:ALTERNATE_EDITOR = 'runemacs'

function prompt {
	Write-Host "PS $(Get-Location)>" -NoNewline -ForegroundColor White
	' '
}

function Resolve-PathSafe($path) {
	$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)
}

if ($Host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
}

function atom($path) {
	$argument = '"' + (Resolve-PathSafe $path) + '"'
	Start-Process atom $argument
}
