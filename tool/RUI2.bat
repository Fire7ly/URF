@echo off
rem this script is the part of URF V02 BY @fire7ly
rem You can use it to flash recovery on your realme devices.
rem just change the findstr commands string.
 
title URF V01 BY @fire7ly
color 3
cls
@echo ======================================================
@echo  				MADE BY fire7ly
@echo   UNIVERSAL RECOVERY FlASHER FOR REALME DEVICES
@echo ======================================================
echo.
echo.
@echo [36mNote:- Your Device Must Be Bootloader Unlocked.
@echo 	This Will Flash Any Recovery On Your Device And Boot You Into Recovery.
@echo 	You No Need Of Any Hassle. Use This Tool On Those Device Which Need To Disable Vbmeta To Flash Recovery.[0m
@echo [91mIF YOU INSTALLING PBRP ON STOCK RUI YOU NEED TO FLAHS MAGISK FROM PBRP TOO AFTER BOOT IT, TO MAKE PBRP PERMANENT.[0m
echo 	Checking device Mode.
:checkadb
.\tool\adb devices -l | findstr "Realme RMX2027 RMX2027 rmx2020 rmx2027" > nul
 if errorlevel 1 (
    echo.
	echo ADB:
    echo Device Not Connected In ADB Mode.
	echo Checking In Fastboot Mode.
	echo.
	goto checkfastboot
 ) else (
    echo.
	echo ADB:
    echo Device Found In ADB Mode!
	echo Booting Into Bootloader Mode.
	tool\adb reboot bootloader
	timeout /t 8 > nul
	)
 
 :checkfastboot 
.\tool\fastboot devices -l | findstr "fastboot" > nul
 if errorlevel 1 (
	echo.
	echo Fastboot:
    echo Devices Not Connected In Fastboot Mode.
	echo Check Again In 2 Second.
	timeout /t 2 > nul
	goto checkadb
 ) else (
	echo.
	echo Fastboot:
    echo Device Found In Bootloader Mode!
	echo Now PBRP Flashing Begin..
	echo  TIGHT YOUR SEAT BELT HAHA.....
	echo.
	timeout /t 2 > nul
	goto pbrp
	pause > nul
	)
	
:pbrp 
echo.
.\tool\fastboot --disable-verification flash vbmeta .\tool\R2\vbmeta.img
echo.
echo flash Vbmeta Done.
echo.
.\tool\fastboot flash recovery .\tool\R2\recovery.img
echo.
echo Flash Revovery Done.
echo.
.\tool\fastboot reboot recovery
echo.
echo Recovery WILL BOOT IN UNDER 30 SECONDS.
timeout /t 25 > nul
echo.
echo This Window Will Close In 10 Seconds.
timeout /t 10
exit