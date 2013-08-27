param(
	$Options
)

function Resolve-PathSafe($path) {
	$PSCmdlet.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)
}

$env:HOME = Resolve-Path ~
New-Alias emacs $Options.emacs

function emacsclient($path) {
	$emacs = $Options.emacs
	$emacsclient = $Options.emacsclient

	try {
		$path = Resolve-Path $path -ErrorAction Stop
	} catch {
	}

	& $emacsclient `
		--server-file "$env:HOME/.emacs.d/server/server" `
		--alternate-editor $emacs `
		$path
}
