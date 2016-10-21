param (
    $SecretFile = '~/.aria2cserver-secret.txt'
)

$ErrorActionPreference = 'Stop'

function Generate-Secret {
    function Generate-Diapason($first, $last) {
        [int][char]$first..[int][char]$last | % { [string][char]$_ }
    }

    $alphabet = (Generate-Diapason 'a' 'z') +
        (Generate-Diapason 'A' 'Z') +
        (Generate-Diapason '0' '9')

    $length = 48

    $provider = New-Object Security.Cryptography.RNGCryptoServiceProvider
    try {
        [byte[]]$bytes = @(0) * $length
        $provider.GetBytes($bytes)
        $letters = $bytes | % { $alphabet[$_ % $alphabet.Length] }
        $letters -join ''
    } finally {
        $provider.Dispose()
    }
}

if (Test-Path $SecretFile) {
    Write-Output "Loading secret from $SecretFile..."
    $secret = Get-Content $SecretFile -Encoding utf8
} else {
    Write-Output "Generating aria2c secret file in $SecretFile..."
    $secret = Generate-Secret
    Write-Output "Secret generated is $secret"

    $secret | Out-File $SecretFile -Encoding utf8
}

Set-Location $env:TEMP
aria2c --enable-rpc --rpc-allow-origin-all=true --summary-interval=0 --rpc-secret=$secret
