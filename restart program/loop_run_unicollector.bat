@echo off
title loop run Unicollector.exe

set PR=Unicollector.exe

tasklist |findstr /i %PR% > nul
if errorlevel 0 goto run
goto loop

:loop
timeout /t 7200 /nobreak > nul
taskkill /F /IM %PR% > nul
timeout /t 2 /nobreak > nul
start %PR%
echo [%date:~0,10% %time:~0,8%] restart Unicollector OK!
goto run


:run
echo [%date:~0,10% %time:~0,8%] Unicollector is running!
goto loop