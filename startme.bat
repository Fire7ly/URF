@echo off 
cls
@title URF V01 BY Fire7ly
for /F "delims=" %%i in ('date /t') do set mydate=%%i
for /F "delims=" %%i in ('time /t') do set mytime=%%i
color 3
@echo ======================================================
@echo    	         MADE BY fire7ly
@echo   UNIVERSAL RECOVERY FlASHER FOR REALME DEVICES
@echo     Current time is %mydate%: %mytime%
@echo ======================================================
:start
tool\adb devices 
tool\adb wait-for-usb-device
tool\adb root 
echo.
for /F "delims=" %%a in ('tool\adb.exe shell getprop ro.product.odm.model') do set DEVICE=%%a
for /F "delims=" %%a in ('tool\adb.exe shell getprop ro.build.product') do set PRODUCT=%%a
for /F "delims=" %%a in ('tool\adb.exe shell getprop ro.build.display.ota') do set ID=%%a
for /F "delims=" %%a in ('tool\adb.exe shell getprop ro.oppo.market.name') do set NAME=%%a
for /F "delims=" %%a in ('tool\adb.exe shell getprop ro.build.version.sdk') do set SDK=%%a
echo.
echo device checked.
@echo.[91m
echo Hostname: %NAME%
echo Detected: %DEVICE% (%PRODUCT%)
echo Firmware: %ID%
echo SDK: %SDK%[0m
rem script starts.
echo.

if %SDK%==29 (
    echo "Your device is Running Realme Ui 1 And sdk is 29.."
    echo "Flashing PBRP For Rui 1.."
    goto RUI1    
)

if %SDK%==30 (
    echo "Your device is Running Realme Ui 2 And sdk is 30.."
    echo "Flashing PBRP For Rui 2.."
    goto RUI2
)
color 3
:RUI1
if exist \tool\R1 ( 
echo Folder Found No Need To Open Folder.
timeout /t 5 
Start /max .\tool\RUI1.bat
goto Exit 
 ) else ( 
mkdir .\tool\R1
echo. > .\tool\R1\"recovery.img+vbmeta.img_Here!"
echo Please Put Your RUI 1 recovery.img And Vbmeta.img Into RUI1 Folder.
Start .\tool\R1
pause
#Start /max .\tool\RUI1.bat
goto Exit )

:RUI2
if exist .\tool\R2 ( 
echo Folder Found No Need To Open Folder.
timeout /t 5 
Start /max .\tool\RUI2.bat
goto Exit 
 ) else ( 
mkdir .\tool\R2
echo. > .\tool\R2\"recovery.img+vbmeta.img_Here!"
echo Please Put Your RUI 2 recovery.img And Vbmeta.img Into RUI2 Folder.
Start .\tool\R2
pause
Start /max .\tool\RUI2.bat
goto Exit )

:Exit
echo This Command Prompt Will Terminate In 2 Seconds.
timeout /t 2 > nul
exit
