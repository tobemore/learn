@echo off
title loop run beOPC.exe

set PR=beOPC.exe

tasklist |findstr /i %PR% > nul
if errorlevel 0 goto run
goto loop

:loop
timeout /t 1800 /nobreak > nul
taskkill /F /IM %PR% > nul
timeout /t 2 /nobreak > nul
start %PR%
echo [%date:~0,10% %time:~0,8%] restart beOPCServer OK!
goto run


:run
echo [%date:~0,10% %time:~0,8%] beOPC is running!
goto loop