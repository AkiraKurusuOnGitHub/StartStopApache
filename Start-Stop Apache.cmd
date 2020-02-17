@echo off

tasklist | find /i "httpd" >nul
if %errorlevel% == 0 (goto running) else (goto not_running)

:running
echo The 'Apache2.4' service is running.
goto Input

:not_running
echo The 'Apache2.4' service is not running.
goto Input

:Input
set /p INPUT="start - stop - quit: "

If /I "%INPUT%" == "start" goto start
If /I "%INPUT%" == "stop" goto stop
goto END

:stop
httpd -k stop
goto END

:start
httpd -k start
echo The 'Apache2.4' service is now running.
goto END

:END
echo.
pause