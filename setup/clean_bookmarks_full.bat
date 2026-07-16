REM version 1.2

@echo off

set "BOOKMARKS_FILE=bookmarks.html"
set "BOOKMARKS_CLEANER_SCRIPT=clean_bookmarks_full.ps1"
set "EDITOR=%ProgramFiles%\Notepad++\notepad++.exe"

powershell -NoProfile -ExecutionPolicy Bypass -File "%BOOKMARKS_CLEANER_SCRIPT%" "%BOOKMARKS_FILE%"

if %ERRORLEVEL% equ 0 (
    if exist "%EDITOR%" (
        start "" "%EDITOR%" "%BOOKMARKS_FILE%"
    )
)