@echo off 
cls
title URF V01 BY @fire7ly
color 3
@echo ======================================================
@echo  				MADE BY fire7ly
@echo   UNIVERSAL RECOVERY FlASHER FOR REALME DEVICES
@echo ======================================================
:start
timeout /t 1 > nul
echo 1. RUI 1
echo 2. RUI 2
echo 3. Exit
@echo =============================================
echo Choose Your Realme UI version. 
timeout /t 2 > nul
set choice=
set /p choice=Enter Your Choice = 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto RUI1
if '%choice%'=='2' goto RUI2
if '%choice%'=='3' goto Exit
echo "%choice%" is not valid, try again
echo.
goto start

:RUI1
if exist .\tool\R1 ( 
echo Folder Found No Need To Open Folder.
timeout /t 5 
Start /max .\tool\RUI1.bat
goto Exit 
 ) else ( 
mkdir .\tool\R1
echo Please Put Your RUI 1 RECOVERY.img And Vbmeta.img Into RUI1 Folder.
Start .\tool\R1
pause
Start /max .\tool\RUI1.bat
goto Exit )

:RUI2
if exist .\tool\R2 ( 
echo Folder Found No Need To Open Folder.
timeout /t 5 
Start /max .\tool\RUI2.bat
goto Exit 
 ) else ( 
mkdir .\tool\R2
echo Please Put Your RUI 2 RECOVERY.img And Vbmeta.img Into RUI2 Folder.
Start .\tool\R2
pause
Start /max .\tool\RUI2.bat
goto Exit )

:Exit
echo This Command Prompt Will Terminate In 2 Seconds.
timeout /t 2 > nul
exit
