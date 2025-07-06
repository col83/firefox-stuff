@echo off

title Firefox ESR update

set URL=https://download.mozilla.org/?product=firefox-esr-msi-latest-ssl&os=win64&lang=en-US

cls
echo.
curl -fJL -# -o ".\firefox-esr.msi" %URL%