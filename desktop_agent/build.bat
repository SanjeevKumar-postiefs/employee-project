@echo off
setlocal enabledelayedexpansion

echo Building Employee Activity Tracker Service...
echo =========================================

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Kill any running processes
echo Stopping any running processes...
taskkill /F /IM "EmployeeActivityTracker.exe" 2>nul
timeout /t 2 /nobreak >nul

REM Clean previous builds
echo Cleaning previous builds...
if exist "build" rd /s /q "build"
if exist "dist" rd /s /q "dist"
if exist "*.spec" del /f /q "*.spec"

REM Install required packages
pip install --upgrade pyinstaller pywin32

REM Create executable
echo Creating executable...
pyinstaller --clean ^
    --onefile ^
    --name="EmployeeActivityTracker" ^
    --add-data "activity_tracker;activity_tracker" ^
    --hidden-import win32timezone ^
    --hidden-import win32serviceutil ^
    --hidden-import win32service ^
    --hidden-import win32event ^
    --hidden-import servicemanager ^
    --hidden-import socket ^
    --hidden-import threading ^
    --hidden-import win32api ^
    --hidden-import win32con ^
    --hidden-import win32security ^
    --hidden-import activity_tracker.activity_tracker ^
    --hidden-import activity_tracker.api_client ^
    --hidden-import activity_tracker.config ^
    --hidden-import activity_tracker.storage ^
    --runtime-hook add_dll_directory.py ^
    service_wrapper.py

if %errorlevel% neq 0 (
    echo Build failed!
    pause
    exit /b 1
)

REM Create deployment package
echo Creating deployment package...
if not exist "Deployment" mkdir "Deployment"

REM Copy files
copy /Y "dist\EmployeeActivityTracker.exe" "Deployment\"
copy /Y "install_complete.bat" "Deployment\"

REM Create logs directory in ProgramData
echo Creating logs directory...
if not exist "%ProgramData%\EmployeeActivityTracker\logs" (
    mkdir "%ProgramData%\EmployeeActivityTracker\logs"
)

echo Build and deployment package created successfully!
echo Deployment package location: .\Deployment\

REM List files in deployment directory
echo.
echo Files in Deployment directory:
dir /b "Deployment"

deactivate
endlocal
pause