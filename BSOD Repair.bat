@echo off
title %~n0

:: Request administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [1/2] DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /RestoreHealth

if %errorlevel% neq 0 (
    echo DISM encountered an error.
    echo SFC will still be attempted.
)

echo [2/2] sfc /scannow
sfc /scannow

pause