@echo off

title Firefox ESR update

set URL=https://download.mozilla.org/?product=firefox-esr-msi-latest-ssl&os=win64&lang=en-US
set OUTFILE=firefox-esr-setup.exe

cls
echo.
curl -fJL -# -o "%USERPROFILE%\Desktop\%OUTFILE%" %URL%
echo.
IF EXIST "%USERPROFILE%\Desktop\%OUTFILE%" (echo file saved as - "%USERPROFILE%\Desktop\%OUTFILE%")
echo.
pause
