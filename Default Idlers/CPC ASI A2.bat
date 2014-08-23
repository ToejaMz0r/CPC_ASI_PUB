:start
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: README
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: ** CPC AUTO ARMA2/DAYZ IDLE BATCH FILE CREATED BY ToejaM **
::
:: If you do not have nircmd.exe then visit the [CPC] forums @ www.CPC-Gaming.eu for more information.
::
:: I recommend you use Notepad++ (http://notepad-plus-plus.org/download/v6.5.1.html) to help you see better inside of this batch file, it automatically colour codes commented out lines and actual settings.  
:: 
:: Any errors in file names, file paths and possibly letter case will result in a failure. The code will only do what you tell it to do and nothing else.
::
:: When editing the settings, after the = put your desired settings in.
::
:: The top 3 settings are the most important, if you have Arma 2 and OA installed to your C:\ drive and you installed this installer to the default of C:\CPC then you will only need to change the top 3 options, if you use custom locations, file names or anything else not default, change the settings below as necessary. Otherwise all the settings below will work to connect you to the [CPC] Childs Play Corner - DayZ Epoch Chernarus server. Many of the settings below will not need changing and already have the working default values needed. If you run into problems make sure to set the cpcinfo setting to a value that gives you enough time to see what step it fails on, you will also need to turn debugging on which is explained below.
::
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: README
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::


::SETTINGS
:: To turn debugging on, comment out the first line below "@echo off" with :: so it looks like this: ::@echo off
:: All timing values are in seconds unless stated otherwise.
@echo off
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: Profile Name - Putting a name here that does not correspond to a profile you have made, will create a default profile. So put any name here you like.
set cpcname="-name=Girl Gamer"
:: This is where your nircmd.exe is located.
set cpcnir=C:\CPC
::  Server IP
set cpcip=188.165.222.198
:: Server Port - DayZ Epoch Arma 2 Default 2302
set cpcport=2302
:: This is your arma 2 exe name that is used to launch the game, since the Steam changeover it launches through Arma2OA_BE by default which then continues to load Arma2OA.exe so we now need two exes for this batch to work. Default is arma2oa_be.exe
set arma2exe=ArmA2OA_BE.exe
:: This is the old Arma 2 Exe - No need to change but is required. Default is arma2oa.exe
set arma2exeold=arma2oa.exe
:: Operation Arrow Head folder name, default is "ARMA 2 Operation Arrowhead"
set cpcopaon=ARMA 2 Operation Arrowhead
:: This is path that leads up to the folder name above.
set arma2filepath=C:\Program Files (x86)\Steam\SteamApps\common\
:: Base "Arma 2" folder name, default is "Arma 2"
set cpcbasearma=Arma 2
::  DayZ Launch Parameters, you only need @DayZ_Epoch to idle but you can insert your other mods such as @ACEX_SM. Separate with semi colons e.g @DayZ_Epoch;@ACEX_SM;@Othermodshere
set cpclaunch=@DayZ_Epoch
:: Password? None/empty by default
set cpcpassword=
:: Additional launch parameters, nosplash(removes intro movies) and nopause(prevents the game from freezing while minimized but due to being minimized uses little resources) are necessary for idling to prevent slow loading times and the game timing out. You can add your other launch parameters for performance if you wish e.g -maxMem=2047 -cpuCount=4 -exThreads=7 -nosplash -winxp -skipintro -nopause - -window is untested for full screen and I recommend you leave it in but feel free to test and feedback me.
set cpcadd=-nosplash -nopause -skipintro
:: This is how long your game takes to get into the lobby. As soon as you are in the lobby, the countdown timer to start the mission starts but you must reach the lobby first. Please do a few tests to perfect it or allow a few seconds for variance. Your Arma window will be minimized after this time. Default for debugging is is 60, amend as necessary.
set cpclobbyidle=60
:: This number represents how long the first short cycle will last, if you are the first person on the server after a restart, you will activate the mission start timer, this timer for mission starting is 90 seconds. You do not need to change this number, just make sure the value above is set correctly to coincide for when you reach the lobby to start the timer off. This will prevent you from being spawned in and dying as the game will be shut down and the next part of the cycle will land you in the lobby for idling.
set cpcioffset=180
:: This is the time between informational steps, this can be set to 0 to turn these timeouts off. Default is 2
set cpcinfo=2
:: This is how long before the loop (cmd) window will close. Default is 10.
set cpcloopwin=10
:: This is how often the loop will be restarted. Default is 1800 seconds (30minutes)
set cpcloop=1800
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
::SETTINGS    
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING ::
::
::
::
::
title Childs Play Corner - www.CPC-Gaming.eu - Chernarus - Auto Server Idle created by ToejaM
color 0A
@echo.
@echo.
@echo. [CPC] Auto Server Idle - Created by ToejaM
timeout /t %cpcinfo% /nobreak > NUL
@echo.
@echo.
@echo. You can stop this loop at any time by closing this window. Closing this window will NOT close Arma 2. You can also skip these informational messages by changing "cpcinfo" to 0.
timeout /t %cpcinfo% /nobreak > NUL
@echo.
@echo.
@echo. Arma 2 kill process signal sent.
taskkill /im %arma2exe%
timeout 1
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
timeout /t %cpcinfo% /nobreak > NUL

cd\
cd /D %arma2filepath%%cpcopaon%
@echo.
@echo.
@echo. Starting Arma 2 and connecting to the server. This is the first stage, it will disconnect in enough time to start the mission to prevent you from idling alive in game. Do not close the loop at this stage.
start ""  "%arma2filepath%%cpcopaon%\ArmA2OA_BE.exe" 0 0 -mod=%cpclaunch% %cpcname% -password=%cpcpassword% -connect=%cpcip% -port=%cpcport% -password=%cpcpassword% "-mod=%arma2filepath%%cpcbasearma%;expansion;%cpcadd%" -window
@echo.
@echo.
timeout /t %cpcinfo% /nobreak > NUL
@echo. Waiting for Arma 2 to connect to the server.
timeout /t %cpclobbyidle% /nobreak > NUL
start %cpcnir%\nircmd.exe win min process arma2oa.exe
@echo.
@echo.
@echo. Waiting to make sure the DayZ mission starts. You can skip this step by pressing any key.
timeout /t %cpcioffset%
taskkill /im %arma2exe%
timeout 1
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
taskkill /im %arma2exeold%
timeout /t %cpcinfo% /nobreak > NUL
cd\
cd /D %arma2filepath%%cpcopaon%
@echo.
@echo.
@echo. Starting Arma 2 and connecting to the server.
start ""  "%arma2filepath%%cpcopaon%\ArmA2OA_BE.exe" 0 0 -mod=%cpclaunch% %cpcname% -connect=%cpcip% -port=%cpcport% -password=%cpcpassword% "-mod=%arma2filepath%%cpcbasearma%;expansion;%cpcadd%" -window
@echo.
@echo.
timeout /t %cpcinfo% /nobreak > NUL
@echo. Waiting for Arma 2 to connect to the server before minimizing the game.
timeout /t %cpclobbyidle% /nobreak > NUL
start %cpcnir%\nircmd.exe win min process %arma2exeold%
@echo.
@echo.
@echo. Arma 2 window minimized. This loop will minimize in %cpcloopwin% seconds.
timeout /t %cpcloopwin% /nobreak > NUL
start %cpcnir%\nircmd.exe win min process cmd.exe
@echo.
@echo.
@echo. The timer below indicates how long before the loop is automatically restarted, press any key to automatically restart the loop.
timeout %cpcloop%
goto start