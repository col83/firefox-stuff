@echo off

SET VERSION=128.14.0

TITLE Firefox ESR %VERSION%

SET OUTFILE=firefox_esr_%VERSION%.msi
SET URL=https://archive.mozilla.org/pub/firefox/releases/128.14.0esr/win64/en-US/Firefox%%20Setup%%20%VERSION%esr.msi

cls
ECHO.
ECHO Downloading Firefox ESR v%VERSION%
ECHO.
.\curl.exe -fJL -# -o "%USERPROFILE%\Desktop\%OUTFILE%" "%URL%" || exit /b 1

ECHO.
pause