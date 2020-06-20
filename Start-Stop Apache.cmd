@echo off

tasklist | find /i "httpd" >nul
if %errorlevel% == 0 (goto running) else (goto not_running)

:running
echo The 'Apache2.4' service is running.
echo.
goto Input

:not_running
echo The 'Apache2.4' service is not running.
goto Input

:Input
set /p INPUT="start - stop - restart - quit: "

If /I "%INPUT%" == "start" goto start
If /I "%INPUT%" == "stop" goto stop
If /I "%INPUT%" == "restart" goto restart
goto END

:stop
httpd -k stop
echo.
goto Input

:start
httpd -k start
echo The 'Apache2.4' service is now running.
echo.
goto Input

:restart
httpd -k restart
echo The 'Apache2.4' service has restarted.
echo.
goto Input

:END
echo.
pause