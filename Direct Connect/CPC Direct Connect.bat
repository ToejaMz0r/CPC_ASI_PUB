:start
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: README
::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::
:: ** CPC Direct Connect created by ToejaM **
::
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
set cpcname="-name=YOUR NAME HERE"
::  Server IP
set cpcip=188.165.222.198
:: Server Port - DayZ Epoch Arma 2 Default 2302
set cpcport=2302
:: This is your arma 2 exe name. Default is arma2oa.exe
set arma2exe=ArmA2OA_BE.exe
:: This is the old Arma 2 Exe - No need to change but is required. Default is arma2oa.exe
set arma2exeold=arma2oa.exe
:: Operation Arrow Head folder name, default is "ARMA 2 Operation Arrowhead"
set cpcopaon=ARMA 2 Operation Arrowhead
:: This is path that leads up to the folder name above.
set arma2filepath=C:\Program Files (x86)\Steam\SteamApps\common\
:: Base "Arma 2" folder name, default is "Arma 2"
set cpcbasearma=Arma 2
::  DayZ Launch Parameters
set cpclaunch=@DayZ_Epoch
:: Password? None/empty by default
set cpcpassword=
:: Additional launch parameters, nosplash(removes intro movies) and nopause(prevents the game from freezing while minimized but due to being minimized uses little resources) are necessary for idling to prevent slow loading times and the game timing out. You can add your other launch parameters for performance if you wish e.g -maxMem=2047 -cpuCount=4 -exThreads=7 -nosplash -winxp -skipintro -nopause
:: Please see here: https://community.bistudio.com/wiki/Arma2:_Startup_Parameters for more parameters and their explanations
set cpcadd=-nosplash -nopause -skipintro
:: This is the time between informational steps, this can be set to 0 to turn these timeouts off. Default is 5
set cpcinfo=2
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
title Childs Play Corner - www.CPC-Gaming.eu - Chernarus - Direct Connect created by ToejaM
color 0A
@echo.
@echo.
@echo. [CPC] Direct Connect - Created by ToejaM
timeout /t %cpcinfo% /nobreak > NUL
@echo.
@echo.
@echo. Closing this window will NOT close Arma 2/DayZ. You can also skip these informational messages by changing "cpcinfo" to 0.
timeout /t %cpcinfo% /nobreak > NUL
@echo.
@echo.
@echo. Arma 2 kill process signal sent.
taskkill /im %arma2exe%
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
start ""  "%arma2filepath%%cpcopaon%\ArmA2OA_BE.exe" 0 0 -mod=%cpclaunch% %cpcname% %cpcadd% -connect=%cpcip% -port=%cpcport% "-mod=%arma2filepath%%cpcbasearma%;expansion;"
timeout 15
@echo.
@echo.
@echo. Closing batch file.
timeout /t %cpcinfo% /nobreak > NUL
@echo.
@echo.
exit