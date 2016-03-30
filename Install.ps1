$ErrorActionPreference = 'Stop'
# TODO: Install Chocolatey
# TODO: Install ConEmu
# TODO: Install Far Manager
# TODO: Install Atom
# TODO: Install vim

# TODO: Install fonts
# TODO: Set up ConEmu (use fonts)
# TODO: Set up PowerShell profile
# TODO: Set up PS-Agnoster in PowerShell
# TODO: Create shortcut to run Far Manager through ConEmu
# TODO: Set up Far Manager + ConEmu plugins (Background.xml)
# TODO: Set up Atom (~/atom)
# TODO: Set up Atom as Far editor

function SafeResolve-Path ($path) {
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)
}

function New-FileLink ($source, $destination) {
    cmd /c mklink $(SafeResolve-Path $destination) $(Resolve-Path $source)
}

function New-DirectoryLink ($source, $destination) {
    cmd /c mklink /j $(SafeResolve-Path $destination) $(Resolve-Path $source)
}

# vim setup
if (-not (Test-Path '~/.vimrc')) {
    Write-Output 'Creating a link to .vimrc'
    New-FileLink (Join-Path $PSScriptRoot 'vim/.vimrc') '~/.vimrc'
}

if (-not (Test-Path '~/vimfiles')) {
    Write-Output 'Creating a link to vimfiles'
    New-DirectoryLink (Join-Path $PSScriptRoot 'vim/vimfiles') '~/vimfiles' 
}
