param(
	$Options
)

$env:HOME = Resolve-Path ~
$env:USERNAME = $Options.UserName
$env:EDITOR = 'emacsclient'
$env:ALTERNATE_EDITOR = 'runemacs'
$env:PATH += ";$(Split-Path $PSScriptRoot -Parent)\Scripts\;"

Import-Module posh-git

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    try {
        # Reset color, which can be messed up by Enable-GitColors
        $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
        
        Write-Host $pwd.ProviderPath -NoNewline -ForegroundColor White
        Write-VcsStatus
        Write-Host '>' -NoNewline -ForegroundColor White
    } finally {
        $global:LASTEXITCODE = $realLASTEXITCODE
    }
    
    ' '
}

Enable-GitColors

if ($Host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
}
