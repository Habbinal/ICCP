@echo off
@setlocal EnableDelayedExpansion
title Improved Commands for Command Prompt (Windows)
color 2
echo -Home-
echo.
echo Login
echo Signup

set /p UserCredsInOut="Signup/Login?: "

if %UserCredsInOut%==Signup (
set /p UsernameStarterCredentials="Username: "
echo ----------------------------------

echo Welcome to the ICCP prompt! (Type "help" to display a list of every command)

::shutdown
set !shutdown
set abortshutdown

if defined abortshutdown (
shutdown /a
)
if defined !shutdown (
call shutdown.bat or set /p ShutdownType=Type of shutdown: 
echo.
echo Logoff 
echo Shutdown
echo Restart
echo.
if %ShutdownType%==Logoff (
::Logoff
set /a TimeUntilLogoff=Seconds until logoff: 
echo Set %TimeUntilLogoff% seconds until logoff.
echo ----------------------------------
set /p ConfirmLogoff="Are you sure (Y/N)?"
if %ConfirmLogoff%==Y (
echo Waiting %TimeUntilLogoff%, valid response is authorized. 
timeout %TimeUntilLogoff%
shutdown /l
)
:N 
echo Cancelling...
timout 3
cls

if not %ConfirmLogoff%==Y(
echo Not valid response.
if not %ConfirmLogoff%==N (
echo Not valid response.
)
)
echo Not valid response.
pause >nul
goto ConfirmLogoff
timeout 1
cls
goto ConfirmLogoff
)
)

:Shutdown
::Shutdown
set /p TimeUntilShutdown=Seconds until shutdown: 

echo Set %TimeUntilShutdown% seconds until shutdown.
echo ----------------------------------

set /p ConfirmShutdown="Are you sure (Y/N)?"
:Y
echo Waiting %TimeUntilShutdown%, valid response is authorized. 
timeout %TimeUntilShutdown%
pause
shutdown /s
:N
echo Cancelling...
timout 3
cls
if not %ConfirmShutdown%==Y(
echo Not valid response.
if not %ConfirmShutdown%==N (
echo Not valid response.
)
)
echo Not valid response.
pause >nul
goto ConfirmShutdown
timeout 1
cls
goto ConfirmShutdown
:Restart (
::Restart
set /p TimeUntilRestart=Seconds until restart: 

echo Set %TimeUntilRestart% seconds until restart.
echo ----------------------------------

set /p ConfirmRestart="Are you sure (Y/N)?"
echo.
:Y
echo Waiting %TimeUntilRestart%, valid response is authorized. 
timeout %TimeUntilRestart%
shutdown /r
:N
echo Cancelling...
timout 3
cls
if not %ConfirmRestart%==Y (
echo Not valid response.
if not %ConfirmRestart%==N (
echo Not valid response.
)
)
echo Not valid response.
pause >nul
goto ConfirmRestart
timeout 1
cls
goto ConfirmRestart
)
::toHome
set !toHome

if do !toHome (
call toHome.bat or set /p ConfirmRedirect=Save (Y/N)?
:Y 
echo Waiting %ConfirmRedirect%, valid response is authorized. 
pause
echo Returning to home (saved, type "abortredirect" to stop going to home and get back to your previous state)...
timout 6
cls
echo -Home-
echo Welcome to the ICCP prompt! (Type "help" to display a list of every command)
pause

:N
echo Returning to home (saved, type "abortredirect" to stop going to home and get back to your previous state)... 
timout 6
cls
echo -Home-
echo Welcome to the ICCP prompt! (Type "help" to display a list of every command)
pause
if not %ConfirmRedirect%==Y or N(
echo Not valid response.
)
if not defined %ConfirmRedirect% (
echo Not valid response.
)
::funPrompt
set funPrompt

if defined funPrompt (
call funPrompt.bat
cls
exit
)

set UserGrants
set updateUserGrants