param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

if (-not (Test-Path $FilePath)) { exit 1 }

try {
    $content = Get-Content $FilePath -Raw -Encoding UTF8
} catch {
    exit 1
}

$cleanContent = [regex]::Replace($content, '(?i)(<A\b[^>]+>)', {
    param($match)
    return $match.Groups[1].Value -replace '\s+(ICON_URI|ICON)="[^"]*"', ''
})

Set-Content $FilePath -Value $cleanContent