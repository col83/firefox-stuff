@echo off

echo.
echo This action will permanently remove Mozilla Firefox profiles and settings.
echo.
echo Directory to be removed:
echo   %USERPROFILE%\AppData\Roaming\Mozilla
echo.

set /p CHOICE=Type YES to continue: 

if not "%CHOICE%"=="YES" (
    echo.
    echo Operation cancelled.
    exit /b 0
)

rd /s /q "%USERPROFILE%\AppData\Roaming\Mozilla"