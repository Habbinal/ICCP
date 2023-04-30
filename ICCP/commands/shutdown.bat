@echo off

color 2
title Invoked shutdown

if defined abortshutdown (
shutdown /a
)
if defined !shutdown (
call shutdown.bat or set /p ShutdownType=Type of shutdown: 
echo.
echo Logoff 
echo Shutdown
echo Restart

if %ShutdownType%==Logoff (
::Logoff
set /a TimeUntilLogoff=Seconds until logoff: 

echo Set %TimeUntilLogoff% seconds until logoff.
echo ----------------------------------
:ConfirmLogoff
set /p ConfirmLogoff=Are you sure (Y/N)?
if %ConfirmLogoff%==Y (
echo Waiting %TimeUntilLogoff%, valid response is authorized. 
timeout %TimeUntilLogoff%
shutdown /l
)
if %ConfirmLogoff%==N (
echo Cancelling...
timout 3
cls
)
if not %ConfirmLogoff%==Y or N(
echo Not valid response.
)
echo Not valid response.
pause >nul
goto ConfirmLogoff
timeout 1
cls
goto ConfirmLogoff
)

if %ShutdownType%==Shutdown (
::Shutdown
set /p TimeUntilShutdown=Seconds until shutdown: 

echo Set %TimeUntilShutdown% seconds until shutdown.
echo ----------------------------------
:ConfirmShutdown
set /p ConfirmShutdown=Are you sure (Y/N)?
if %ConfirmShutdown%==Y (
echo Waiting %TimeUntilShutdown%, valid response is authorized. 
timeout %TimeUntilShutdown%
pause
shutdown /s
)
if %ConfirmShutdown%==N (
echo Cancelling...
timout 3
cls
)
if not %ConfirmShutdown%==Y or N(
echo Not valid response.
)
echo Not valid response.
pause >nul
goto ConfirmShutdown
timeout 1
cls
goto ConfirmShutdown
if %ShutdownType%==Restart (
::Restart
set /p TimeUntilRestart=Seconds until restart: 

echo Set %TimeUntilRestart% seconds until restart.
echo ----------------------------------
:ConfirmRestart
set /p ConfirmRestart=Are you sure (Y/N)?
echo.
if %ConfirmRestart%==Y (
echo Waiting %TimeUntilRestart%, valid response is authorized. 
timeout %TimeUntilRestart%
shutdown /r
)
if %ConfirmRestart%==N (
echo Cancelling...
timout 3
cls
)
if not %ConfirmRestart%==Y or N(
echo Not valid response.
)
echo Not valid response.
pause >nul
goto ConfirmRestart
timeout 1
cls
goto ConfirmRestart
)
)