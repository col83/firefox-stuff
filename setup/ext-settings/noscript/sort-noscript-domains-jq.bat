@echo off

set "NOSCRIPT_FILE=noscript_data.txt"

set "DOMAINS_SORT_SCRIPT=sort-noscript-domains-jq.ps1"

powershell -NoProfile -ExecutionPolicy Bypass -File "%DOMAINS_SORT_SCRIPT%" "%NOSCRIPT_FILE%"

pause

set "EDITOR=%ProgramFiles%\Notepad++\notepad++.exe"

if exist "%EDITOR%" (
    start "" "%EDITOR%" "%NOSCRIPT_FILE%"
)