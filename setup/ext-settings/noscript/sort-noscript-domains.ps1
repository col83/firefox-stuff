# version 1.1.5

param(
    [Parameter(Position=0, Mandatory=$false, HelpMessage="Enter the path to the input JSON file.")]
    [string]$InputFile,

    [Parameter(Position=1, Mandatory=$false, HelpMessage="Enter the path to the output file. If omitted, result is printed to screen.")]
    [string]$OutputFile
)

if ([string]::IsNullOrWhiteSpace($InputFile)) {
    Write-Host ""
    Write-Host "Error: Input file not specified." -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage: .\sort-noscript-domains.ps1 <input_json_path> [output_file_path]"
    Write-Host "Example: .\sort-noscript-domains.ps1 settings.json sorted.txt"
    Write-Host ""
    exit 1
}

$resolvedInputPath = $null

if ([System.IO.Path]::IsPathRooted($InputFile)) {
    if (Test-Path -Path $InputFile -PathType Leaf) {
        $resolvedInputPath = $InputFile
    }
}
else {
    $absolutePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($InputFile)
    
    if (Test-Path -Path $absolutePath -PathType Leaf) {
        $resolvedInputPath = $absolutePath
    }
    else {
        $scriptDirPath = Join-Path -Path $PSScriptRoot -ChildPath $InputFile
        if (Test-Path -Path $scriptDirPath -PathType Leaf) {
            $resolvedInputPath = $scriptDirPath
        }
    }
}

if ($null -eq $resolvedInputPath) {
    Write-Host ""
    Write-Host "Error: Input file not found." -ForegroundColor Red
    Write-Host "Tried looking for: $InputFile"
    Write-Host ""
    exit 1
}

try {
    Write-Host ""
    Write-Host "Processing file: $resolvedInputPath" -ForegroundColor Cyan

    $bytes = [System.IO.File]::ReadAllBytes($resolvedInputPath)
    $utf8 = [System.Text.UTF8Encoding]::new($true)

    # Handle BOM
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $jsonString = $utf8.GetString($bytes, 3, $bytes.Length - 3)
    }
    else {
        $jsonString = $utf8.GetString($bytes)
    }

    $jsonData = $jsonString | ConvertFrom-Json

    # Data extraction
    if ($null -ne $jsonData.policy -and 
        $null -ne $jsonData.policy.sites -and 
        $null -ne $jsonData.policy.sites.trusted) {
        
        $trustedSites = $jsonData.policy.sites.trusted
    }
    else {
        $trustedSites = @()
    }

    if ($trustedSites.Count -eq 0) {
        Write-Host ""
        Write-Host "Trusted sites list is empty. Nothing to process." -ForegroundColor Yellow
        Write-Host ""
        exit 0
    }

    $sortedSites = $trustedSites | Sort-Object

    $quotedSites = $sortedSites | ForEach-Object { "`"$_`"" }
    $outputString = $quotedSites -join ",`n"

    if ([string]::IsNullOrWhiteSpace($OutputFile)) {
        Write-Host "`nSorted list:" -ForegroundColor Green
        Write-Host ""
        Write-Output $outputString
        Write-Output ""
        Set-Clipboard -Value $outputString
    }
    else {
        $resolvedOutputPath = $OutputFile
        if (-not [System.IO.Path]::IsPathRooted($OutputFile)) {
            $resolvedOutputPath = Join-Path -Path $PSScriptRoot -ChildPath $OutputFile
        }
        
        $resolvedOutputPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($resolvedOutputPath)

        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($resolvedOutputPath, $outputString, $utf8NoBom)
        
        Write-Host "Done. Sorted list saved to: $resolvedOutputPath" -ForegroundColor Green
        Write-Host ""
    }
}
catch {
    Write-Error "A critical error occurred during script processing."
    Write-Error "Details: $_"
    Write-Host "Call Stack:" -ForegroundColor Yellow
    Write-Error $_.ScriptStackTrace
    exit 1
}