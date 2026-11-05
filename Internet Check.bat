
@echo off
setlocal
title %~n0
REM blue cuz y not, it signals trust
color 0B

echo [1/3] ping 1.1.1.1
ping -n 3 -w 2000 1.1.1.1
if errorlevel 1 (
    echo RESULT: No ping replies received.
    set "PING_RESULT=FAILED"
) else (
    echo RESULT: Ping succeeded.
    set "PING_RESULT=OK"
)
echo.

echo [2/3] nslookup example.com
nslookup example.com
echo.

echo [3/3] HTTPS connectivity
curl.exe -f -L -sS --max-time 10 -o NUL https://www.google.com/

if errorlevel 1 (
    echo RESULT: HTTPS request failed.
    set "HTTPS_RESULT=FAILED"
) else (
    echo RESULT: HTTPS request succeeded.
    set "HTTPS_RESULT=OK"
)

echo.
echo Internet ping: %PING_RESULT%
echo HTTPS test:    %HTTPS_RESULT%
echo DNS:           Read [2/3] nslookup example.com above.
echo.

pause