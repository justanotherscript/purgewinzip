@echo off
REM
REM
REM    Detects winzip and silently uninstalls
REM    There is a un-stoppable pop-up window. so this will kill
REM    all instances of  IE after the UN-installation.
REM
REM
REM
taskkill /F /IM wzqkpick.exe
wmic product where "name like '%%winzip%%'" call Uninstall
REM
REM This section is for WinZip <12
REM
If Exist "%programfiles(x86)%\Winzip\winzip32.exe" GOTO 64
If Exist "%programfiles%\Winzip\winzip32.exe" "%programfiles%\WinZip\Winzip32.exe" /Uninstallx
taskkill /F /IM iexplore.exe
GOTO :END
:64
"%programfiles(x86)%\WinZip\Winzip32.exe" /Uninstallx
taskkill /F /IM iexplore.exe
:END
