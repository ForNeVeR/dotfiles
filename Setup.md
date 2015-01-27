Installation procedure for Windows 10
=====================================

    Set-ExecutionPolicy RemoteSigned

Set up the environment variables:

    $env:HOME = Resolve-Path ~

Install Chocolatey, then:

    choco install conemu
    choco install keepass
    choco install git
    choco install stduviewer

Install Liberation Mono font.

Install PSReadline.

Clone dotfiles repository.

    md (Split-Path $PROFILE)
    cp dotfiles/PowerShell/Profile.ps1 $PROFILE

Clone emacs24-starter-kit, then:

    choco install emacs
    cmd /c mklink /j ~/.emacs.d emacs24-starter-kit
