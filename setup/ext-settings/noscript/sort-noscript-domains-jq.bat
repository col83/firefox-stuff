REM version 1.2

@echo off

set "NOSCRIPT_FILE=noscript_data.txt"
set "DOMAINS_SORT_SCRIPT=sort-noscript-domains-jq.ps1"
set "EDITOR=%ProgramFiles%\Notepad++\notepad++.exe"

powershell -NoProfile -ExecutionPolicy Bypass -File "%DOMAINS_SORT_SCRIPT%" "%NOSCRIPT_FILE%"

if %ERRORLEVEL% equ 0 (
    if exist "%EDITOR%" (
        start "" "%EDITOR%" "%NOSCRIPT_FILE%"
    )
)