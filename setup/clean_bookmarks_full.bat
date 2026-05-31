powershell -NoProfile -ExecutionPolicy Bypass -File "clean_bookmarks_full.ps1" "bookmarks.html"

set "EDITOR=%ProgramFiles%\Notepad++\notepad++.exe"

if exist "%EDITOR%" (
    start "" "%EDITOR%" "bookmarks.html"
)