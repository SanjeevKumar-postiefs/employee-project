@echo off
setlocal enabledelayedexpansion

echo Employee Activity Tracker Installation
echo ====================================

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run as administrator.
    pause
    exit /b 1
)

REM Check if executable exists
if not exist "%~dp0EmployeeActivityTracker.exe" (
    echo Error: EmployeeActivityTracker.exe not found!
    echo Please ensure the executable is in the same directory as this script.
    pause
    exit /b 1
)

echo.
echo Step 1: Cleaning up previous installation...
echo ------------------------------------------
net stop EmployeeActivityTracker 2>nul
sc delete EmployeeActivityTracker 2>nul
timeout /t 5 /nobreak >nul

taskkill /F /IM "EmployeeActivityTracker.exe" /T 2>nul
timeout /t 2 /nobreak >nul

rmdir /s /q "%PROGRAMFILES%\EmployeeActivityTracker" 2>nul
rmdir /s /q "%PROGRAMDATA%\EmployeeActivityTracker" 2>nul
timeout /t 2 /nobreak >nul

echo.
echo Step 2: Creating directories...
echo -----------------------------
mkdir "%PROGRAMFILES%\EmployeeActivityTracker" 2>nul
mkdir "%PROGRAMDATA%\EmployeeActivityTracker\logs" 2>nul
mkdir "%PROGRAMDATA%\EmployeeActivityTracker\temp" 2>nul

echo.
echo Step 3: Installing files...
echo -------------------------
copy /Y "%~dp0EmployeeActivityTracker.exe" "%PROGRAMFILES%\EmployeeActivityTracker\"
if %errorLevel% neq 0 (
    echo Failed to copy program files!
    pause
    exit /b 1
)

echo Setting permissions...
icacls "%PROGRAMDATA%\EmployeeActivityTracker" /grant "Users:(OI)(CI)F" /T /Q
icacls "%PROGRAMFILES%\EmployeeActivityTracker" /grant "Users:(OI)(CI)RX" /T /Q

echo.
echo Step 4: Installing service...
echo ---------------------------
"%PROGRAMFILES%\EmployeeActivityTracker\EmployeeActivityTracker.exe" install

REM Configure service with required privileges
sc config EmployeeActivityTracker type= own
sc config EmployeeActivityTracker start= auto
sc config EmployeeActivityTracker obj= "NT AUTHORITY\SYSTEM"
sc config EmployeeActivityTracker DisplayName= "Employee Activity Tracker"

REM Grant necessary privileges
sc privs EmployeeActivityTracker SeAssignPrimaryTokenPrivilege/SeIncreaseQuotaPrivilege/SeSecurityPrivilege/SeBackupPrivilege/SeRestorePrivilege/SeChangeNotifyPrivilege/SeCreateGlobalPrivilege/SeImpersonatePrivilege/SeTcbPrivilege/SeDebugPrivilege

REM Set security descriptor to allow service to interact with desktop
sc sdset EmployeeActivityTracker D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPLOCRRC;;;IU)(A;;CCLCSWRPLOCRRC;;;SU)

echo.
echo Step 5: Starting service...
echo -------------------------
net start EmployeeActivityTracker
if %errorLevel% neq 0 (
    echo Service failed to start! Checking logs...
    if exist "%PROGRAMDATA%\EmployeeActivityTracker\logs\service.log" (
        type "%PROGRAMDATA%\EmployeeActivityTracker\logs\service.log"
    )
    pause
    exit /b 1
)

echo.
echo Installation Complete!
echo -------------------
sc query EmployeeActivityTracker

echo.
echo Creating uninstall script...
(
    echo @echo off
    echo net stop EmployeeActivityTracker
    echo sc delete EmployeeActivityTracker
    echo timeout /t 5
    echo rmdir /S /Q "%PROGRAMFILES%\EmployeeActivityTracker"
    echo rmdir /S /Q "%PROGRAMDATA%\EmployeeActivityTracker"
    echo echo Uninstallation completed!
    echo pause
) > "%PROGRAMFILES%\EmployeeActivityTracker\uninstall.bat"

pause
endlocal