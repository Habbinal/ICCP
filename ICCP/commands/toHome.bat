set /p ConfirmRedirect=Save (Y/N)?
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