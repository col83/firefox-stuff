@echo off

set URL=https://github.com/zen-browser/desktop/releases/latest/download/zen.installer.exe

cls
echo.
curl -fJL -# -o ".\zen-setup.exe" %URL%