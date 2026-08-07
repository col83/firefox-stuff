# version 1.2.11

param(
    [Parameter(Position=0, Mandatory=$false)]
    [string]$InputFile,

    [Parameter(Position=1, Mandatory=$false)]
    [string]$OutputFile
)

if ([string]::IsNullOrWhiteSpace($InputFile)) {
    Write-Host ""
    Write-Host "Input file not specified." -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) [input_file_path] [output_file_path]" -ForegroundColor Yellow
    Write-Host "Example: $($MyInvocation.MyCommand.Name) noscript_data.txt sorted.txt"
    Write-Host ""
    exit 0
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
    Write-Host "Tried looking for: $InputFile" -ForegroundColor Yellow
    Write-Host ""
    exit 2
}

$jqPath = Join-Path $PSScriptRoot "jq.exe"
if (-not (Test-Path $jqPath -PathType Leaf)) {
    $jqCommand = Get-Command jq -ErrorAction SilentlyContinue
    if ($jqCommand) {
        $jqPath = $jqCommand.Source
    } else {
        $jqPath = $null
    }
}

if ([string]::IsNullOrEmpty($jqPath)) {
    Write-Host ""
    Write-Host "Error: jq not found." -ForegroundColor Red
    Write-Host "Download from: https://jqlang.org/download/ and place it in the script folder or system PATH." -ForegroundColor Yellow
    Write-Host ""
    if ($Host.Name -eq 'ConsoleHost') { $null = Read-Host }
    exit 2
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

    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "Error: jq failed (exit code $LASTEXITCODE)." -ForegroundColor Red
        Write-Host ($outputString | Out-String) -ForegroundColor Yellow
        Write-Host ""
        exit 3
    }

    if ([string]::IsNullOrWhiteSpace($outputString)) {
        Write-Host ""
        Write-Host "Trusted sites list is empty. Nothing to process." -ForegroundColor Yellow
        Write-Host ""
        exit 0
    }

    if ([string]::IsNullOrWhiteSpace($OutputFile)) {
        Write-Host "`nSorted list:" -ForegroundColor Green
        Write-Host ""
        Write-Output $outputString
        Write-Output ""
        if ($Host.Name -eq 'ConsoleHost') {
            try { Set-Clipboard -Value $outputString } catch { Write-Host "(Clipboard not available)" -ForegroundColor DarkGray }
            $null = Read-Host
        }
        exit 0
    }
    else {
        $resolvedOutputPath = $OutputFile
        if (-not [System.IO.Path]::IsPathRooted($OutputFile)) { $resolvedOutputPath = Join-Path -Path $PSScriptRoot -ChildPath $OutputFile }
        $resolvedOutputPath = [System.IO.Path]::GetFullPath($resolvedOutputPath)

        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($resolvedOutputPath, $outputString, $utf8NoBom)

        Write-Host ""
        Write-Host "Done. Sorted list saved to: $resolvedOutputPath" -ForegroundColor Green
        Write-Host ""
        exit 0
    }
}
catch {
    Write-Error "A critical error occurred."
    Write-Error $_.Exception.Message
    exit 1
}