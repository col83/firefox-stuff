TASKKILL /F /IM firefox.exe 2>/NUL && goto start | exit /b 1

:start

IF EXIST "%SYSTEMDRIVE%\Program Files\Mozilla Firefox" (RD /S /Q "%SYSTEMDRIVE%\Program Files\Mozilla Firefox")
IF EXIST "%SYSTEMDRIVE%\Program Files (x86)\Mozilla Firefox" (RD /S /Q "%SYSTEMDRIVE%\Program Files\Mozilla Firefox")

IF EXIST "%SYSTEMDRIVE%\Program Files (x86)\Mozilla Maintenance Service" (RD /S /Q "%SYSTEMDRIVE%\Program Files (x86)\Mozilla Maintenance Service")


IF EXIST "%USERPROFILE%\AppData\Local\Mozilla" (RD /S /Q "%USERPROFILE%\AppData\Local\Mozilla")
IF EXIST "%USERPROFILE%\AppData\Roaming\Mozilla" (RD /S /Q "%USERPROFILE%\AppData\Roaming\Mozilla")


REG DELETE  HKLM\SOFTWARE\Mozilla /F
REG DELETE  HKLM\SOFTWARE\mozilla.org /F

REG DELETE  HKLM\SOFTWARE\WOW6432Node\Mozilla /F

REG DELETE  HKLM\SYSTEM\CurrentControlSet\Services\MozillaMaintenance /F
REG DELETE  HKLM\SYSTEM\ControlSet001\Services\MozillaMaintenance /F

pause