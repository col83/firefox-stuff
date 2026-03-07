# version 1.2.2

param(
    [Parameter(Position=0, Mandatory=$false)]
    [string]$InputFile,

    [Parameter(Position=1, Mandatory=$false)]
    [string]$OutputFile
)

if ([string]::IsNullOrWhiteSpace($InputFile)) {
    Write-Host ""
    Write-Host "Error: Input file not specified." -ForegroundColor Red
    Write-Host "Usage: .\sort-noscript-domains.ps1 <input_json_path> [output_file_path]"
    Write-Host ""
    exit 1
}

$resolvedInputPath = $null
if ([System.IO.Path]::IsPathRooted($InputFile)) {
    if (Test-Path -Path $InputFile -PathType Leaf) { $resolvedInputPath = $InputFile }
}
else {
    $absolutePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($InputFile)
    if (Test-Path -Path $absolutePath -PathType Leaf) { $resolvedInputPath = $absolutePath }
    else {
        $scriptDirPath = Join-Path -Path $PSScriptRoot -ChildPath $InputFile
        if (Test-Path -Path $scriptDirPath -PathType Leaf) { $resolvedInputPath = $scriptDirPath }
    }
}

if ($null -eq $resolvedInputPath) {
    Write-Host ""
    Write-Host "Error: Input file not found." -ForegroundColor Red
    Write-Host "Tried looking for: $InputFile"
    Write-Host ""
    exit 1
}

$jqPath = Join-Path $PSScriptRoot "jq.exe"
if (-not (Test-Path $jqPath)) {
    $jqPath = (Get-Command jq -ErrorAction SilentlyContinue).Source
}

if (-not $jqPath) {
    Write-Host ""
    Write-Host "Error: jq.exe not found." -ForegroundColor Red
    Write-Host "Please download jq.exe and place it in the script folder or system PATH."
    Write-Host ""
    exit 1
}

try {
    Write-Host ""
    Write-Host "Processing file: $resolvedInputPath" -ForegroundColor Cyan

    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

    # Forming the jq command
    $separator = "," + "`n"
    $jqFilter = '.policy.sites.trusted // [] | sort | map(tojson) | join($s)'

    # jq executing
    $outputString = (& $jqPath -r --arg s "$separator" $jqFilter $resolvedInputPath) -join "`n"

    if ([string]::IsNullOrWhiteSpace($outputString)) {
        Write-Host "Trusted sites list is empty. Nothing to process." -ForegroundColor Yellow
        Write-Host ""
        exit 0
    }

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
    Write-Error "A critical error occurred."
    Write-Error "Details: $_"
    exit 1
}