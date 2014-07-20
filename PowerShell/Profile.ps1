param(
	$Options
)

$env:HOME = Resolve-Path ~
$env:USERNAME = $Options.UserName

function prompt {
	Write-Host "PS $(Get-Location)>" -NoNewline -ForegroundColor White
	' '
}

function Resolve-PathSafe($path) {
	$PSCmdlet.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)
}

New-Alias emacs $Options.emacs

function emacsclient($path) {
	$emacsclient = $Options.emacsclient

	try {
		$path = Resolve-Path $path -ErrorAction Stop
	} catch {
	}

	& $emacsclient `
		-n `
		--server-file "$env:HOME/.emacs.d/server/server" `
		--alternate-editor $Options.emacs `
		$path
}

if ($Host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
}

function atom($file) {
	$argument = '"' + (Resolve-Path $file) + '"'
	Start-Process atom $argument
}
