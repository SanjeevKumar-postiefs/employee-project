@echo off
echo Employee Activity Tracker Installation
echo ====================================

REM Stop and remove existing service
echo Stopping and removing existing service...
net stop EmployeeActivityTracker 2>nul
sc delete EmployeeActivityTracker 2>nul

REM Create directories
echo Creating directories...
mkdir "%PROGRAMFILES%\EmployeeActivityTracker" 2>nul
mkdir "%PROGRAMDATA%\EmployeeActivityTracker\logs" 2>nul

REM Copy files
echo Copying files...
copy /Y "EmployeeActivityTracker.exe" "%PROGRAMFILES%\EmployeeActivityTracker\"

REM Set permissions
echo Setting permissions...
icacls "%PROGRAMFILES%\EmployeeActivityTracker" /grant "NT AUTHORITY\LocalService":(OI)(CI)F
icacls "%PROGRAMDATA%\EmployeeActivityTracker" /grant "NT AUTHORITY\LocalService":(OI)(CI)F
icacls "%PROGRAMFILES%\EmployeeActivityTracker" /grant Users:(OI)(CI)RX
icacls "%PROGRAMDATA%\EmployeeActivityTracker" /grant Users:(OI)(CI)RX

REM Install service
echo Installing service...
sc create EmployeeActivityTracker binPath= "\"%PROGRAMFILES%\EmployeeActivityTracker\EmployeeActivityTracker.exe\"" start= auto DisplayName= "Employee Activity Tracker"
sc description EmployeeActivityTracker "Monitors employee activity and idle time"
sc config EmployeeActivityTracker obj= "NT AUTHORITY\LocalService"
sc config EmployeeActivityTracker type= own

REM Start service
echo Starting service...
net start EmployeeActivityTracker
if errorlevel 1 (
    echo Service failed to start
    echo Checking logs...
    type "%PROGRAMDATA%\EmployeeActivityTracker\logs\service.log"
) else (
    echo Installation complete
    sc query EmployeeActivityTracker
)

pause