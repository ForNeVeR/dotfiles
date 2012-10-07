param(
	[Parameter(Mandatory = $true, Position = 0)]
	[string[]] $Paths,

	[switch] $Permanent,
	[switch] $CurrentUser)

if (-not $Permanent -and -not $CurrentUser) {
	throw "Non-permanent changes are always user-specific. You should specify at least one of -Permanent and -CurrentUser switches."
} elseif (-not $Permanent -and $CurrentUser) {
	$target = [EnvironmentVariableTarget]::Process
} elseif ($Permanent -and -not $CurrentUser) {
	$target = [EnvironmentVariableTarget]::Machine
} elseif ($Permanent -and $CurrentUser) {
	$target = [EnvironmentVariableTarget]::User
}

$currentPath = [Environment]::GetEnvironmentVariable("Path", $target)
$addedPaths = [String]::Join(';', $Paths)
$newPath = "$currentPath;$addedPaths"
[Environment]::SetEnvironmentVariable("Path", $newPath, $target)
