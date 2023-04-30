@echo off
@setlocal EnableDelayedExpansion
title Improved Commands for Command Prompt (Windows)
color 2
:NullAccHome
echo -Home-
for %%A in iccp.bat do echo.%%~tA
echo.
echo Login
echo Signup
echo.
set /p UserCredsInOut="Signup/Login?: "
GOTO %UserCredsInOut%
echo.
:Signup
set /p UsernameStarterCredentials="Username: "
if defined %UsernameStarterCredentials% (
goto UsernameSet 
)
if not defined %UsernameStarterCredentials% (
echo Please enter a password. 
)
:UsernameSet
echo Username set
echo.
set /p PasswordStarterCredentials="Password: "
echo Password set
echo.
set /p AccountSave="Would you like to save your account so it isn't deleted for next login? (Yes/No)"
:No
set /p ConfirmNoSaveCreds="Are you sure? (Y/N)"
:
cls
GOTO NullAccHome
:N
GOTO AccountSave

if not defined %ConfirmNoSaveCreds% (
echo Not valid response.
)
if not %ConfirmNoSaveCreds%==Y (
if not %ConfirmNoSaveCreds%==N (
echo Not valid response.
)	
)

:Yes
echo %UsernameStarterCredentials% > iccp-username.txt
echo %PasswordStarterCredentials% > iccp-password.txt
echo.
echo Saved!
timeout /t 2
goto HomeMenu
:Login
set /a CredentialsIncorrectMax=5
::usernameLogin

set /p UsernameLocalCredentials="Username: "
for /f "Delims=" %%b in iccp-username.txt do (

set usernameLoginText=%%b
)

if %UsernameLocalCredentials%=%usernameLoginText% goto HomeMenu

if not %UsernameLocalCredentials%=%usernameLoginText% (
set CredentialsIncorrectMax = %CredentialsIncorrectMax% - 1

echo.
echo "Incorrect. You have %CredentialsIncorrectMax% tries left." 

::passwordLogin

set /p PasswordLocalCredentials="Password: "
for /f "Delims=" %%c in iccp-password.txt do (

set passwordLoginText=%%c
)

if %PasswordLocalCredentials%=%passwordLoginText% goto HomeMenu

if not %PasswordLocalCredentials%=%passwordLoginText% (
set CredentialsIncorrectMax = %CredentialsIncorrectMax% - 1

echo.
echo "Incorrect. You have %CredentialsIncorrectMax% tries left." 
:HomeMenu
cls
echo ----------------------------------
echo Welcome to the ICCP prompt, %UserCredsInOut%! (Type "help" to display a list of every command)
echo.
echo.
set /p CommandInput="Input/Enter a command into the ICCP console: "
::shutdown
set !shutdown
set abortshutdown

if %CommandInput%==abortshutdown (
shutdown /a
)
if %CommandInput%==!shutdown (
set /p ShutdownType=Type of shutdown: 
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
set /p ConfirmLogoff="Are you sure (Y/N)?"
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

if %ShutdownType%==Shutdown (
::Shutdown
set /p TimeUntilShutdown=Seconds until shutdown: 

echo Set %TimeUntilShutdown% seconds until shutdown.
echo ----------------------------------
:ConfirmShutdown
set /p ConfirmShutdown="Are you sure (Y/N)?"
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
if %ShutdownType%==Restart (
::Restart
set /p TimeUntilRestart=Seconds until restart: 

echo Set %TimeUntilRestart% seconds until restart.
echo ----------------------------------
:ConfirmRestart
set /p ConfirmRestart="Are you sure (Y/N)?"
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
if %ConfirmRedirect%==Y (
echo Waiting %ConfirmRedirect%, valid response is authorized. 
pause
echo Returning to home (saved, type "abortredirect" to stop going to home and get back to your previous state)...
timout 6
cls
echo -Home-
echo Welcome to the ICCP prompt! (Type "help" to display a list of every command)
pause
)
if %ConfirmRedirect%==N (
echo Returning to home (saved, type "abortredirect" to stop going to home and get back to your previous state)... 
timout 6
cls
echo -Home-
echo Welcome to the ICCP prompt! (Type "help" to display a list of every command)
pause
)
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