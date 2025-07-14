@echo off

title Zen browser update

set URL=https://github.com/zen-browser/desktop/releases/latest/download/zen.installer.exe
set OUTFILE=zen-setup.exe

cls
echo.
curl -fJL -# -o "%USERPROFILE%\Desktop\%OUTFILE%" %URL%
echo.
IF EXIST "%USERPROFILE%\Desktop\%OUTFILE%" (echo file saved as - "%USERPROFILE%\Desktop\%OUTFILE%")
echo.
pause