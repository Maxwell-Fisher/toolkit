::Max's Windows toolkit
::https://maxwellcrafter.com
::Source/more recent versions, documentation, and more can be found at https://github.com/Maxwell-Fisher/toolkit

 ::a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870::
::                                                                  ::
::       |\/| ---- _                                                ::
::      =(--)=_____ \                                               ::
::      c___ (______/                                               ::
::                                                                  ::
 ::19ddefabe5c2652a30e671914cf84c49b0a6f45318adacc0aeb3563ae72d134e::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                  ::
::  MIT License                                                                     ::
::                                                                                  ::
::  Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                             ::
::                                                                                  ::
::  Permission is hereby granted, free of charge, to any person obtaining a copy    ::
::  of this software and associated documentation files (the "Software"), to deal   ::
::  in the Software without restriction, including without limitation the rights    ::
::  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ::
::  copies of the Software, and to permit persons to whom the Software is           ::
::  furnished to do so, subject to the following conditions:                        ::
::                                                                                  ::
::  The above copyright notice and this permission notice shall be included in all  ::
::  copies or substantial portions of the Software.                                 ::  
::                                                                                  ::
::  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ::
::  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ::
::  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ::
::  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ::
::  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ::
::  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ::
::  SOFTWARE.                                                                       ::
::                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
setLocal enableDelayedExpansion
set "versionNumber=2022.12.22"

title Max's Windows toolkit [Loading...]
echo. >> toolkitLog
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> toolkitLog
echo. >> toolkitLog
echo Toolkit started %date% @ %time% >> toolkitLog
echo Running toolkit version %versionNumber% >> toolkitLog
echo Logged in as %username% @ %computername% >> toolkitLog
echo [!date! @ !time!] Checking domain type... >> toolkitLog
echo Loading domain info...
set domainType=null
systeminfo | find "WORKGROUP" >nul && set domainType=local
systeminfo | find "Domain" >nul && systeminfo | find "WORKGROUP" >nul || set domainType=nonLocal
echo [!date! @ !time!] Domain type set to %domainType% >> toolkitLog
echo. >> toolkitLog

:beginning
chcp 437
mode 150, 50
cd %~dp0
title Max's Windows toolkit [%versionNumber%]
cls
set "currentAddon=nul"
set addonCount=0
for %%f in (addons\*.tkaddon) do (
	set "firstLine="
	if "%%~xf" == ".tkaddon" (
		set /p firstLine=<%%f
		set "file=%%f"
		if /I "!firstLine:~0,14!" == "::toolkitAddon" (
			set /a addonCount+=1
			set "addonCountPrint=0!addonCount!"
			set "addonCountPrint=!addonCountPrint:~-2!"
			if not "!firstLine:~15,64!" == "" (
				echo !addonCountPrint!^> !firstLine:~15,64!
			) else (
				echo !addonCountPrint!^> !file:~7,-8!
			)
			set "addon_!addonCountPrint!=!file!"
		)
	)
)
echo.
set /p userSelectedAddon=^> 
set "userSelectedAddon=0!userSelectedAddon!"
set "userSelectedAddon=!userSelectedAddon:~-2!"

if "%userSelectedAddon%" == "00" goto :aboutPage

if exist "!addon_%userSelectedAddon%!" (
	title Max's Windows toolkit [%versionNumber%] ^(!addon_%userSelectedAddon%:~7,-8!^)
	copy "!addon_%userSelectedAddon%!" "%tmp%\toolkitTemp.cmd" > nul
	cls
	echo [!date! @ !time!] Started addon !addon_%userSelectedAddon%:~7,-8! >> toolkitLog
	setLocal
	call "%tmp%\toolkitTemp.cmd"
	endLocal
	echo [!date! @ !time!] Ended addon >> toolkitLog
	del "%tmp%\toolkitTemp.cmd"
	echo.
	pause
) else (
	cls
	echo Addon not found^^!
	pause
)
goto :beginning

echo.
pause
exit

:aboutPage
	cls
	echo.
	echo   Max's Windows toolkit
	echo.
	echo   Created by Maxwell Fisher
	echo   @Maxwellcrafter
	echo   https://maxwellcrafter.com
	echo.
	echo   Source, more recent versions, documentation, and more can be found at:
	echo   https://github.com/Maxwell-Fisher/toolkit
	echo.
	pause
	cls
	echo.
	echo   .::a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870::.
	echo   ::                                                                  ::
	echo   ::       ^|\/^| ---- _                                                ::
	echo   ::      =(--)=_____ \                                               ::
	echo   ::      c___ (______/                                               ::
	echo   ::                                                                  ::
	echo   '::19ddefabe5c2652a30e671914cf84c49b0a6f45318adacc0aeb3563ae72d134e::'
	echo.
	pause
	cls
	echo.
	echo   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo   ::                                                                                  ::
	echo   ::  MIT License                                                                     ::
	echo   ::                                                                                  ::
	echo   ::  Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                             ::
	echo   ::                                                                                  ::
	echo   ::  Permission is hereby granted, free of charge, to any person obtaining a copy    ::
	echo   ::  of this software and associated documentation files (the "Software"), to deal   ::
	echo   ::  in the Software without restriction, including without limitation the rights    ::
	echo   ::  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ::
	echo   ::  copies of the Software, and to permit persons to whom the Software is           ::
	echo   ::  furnished to do so, subject to the following conditions:                        ::
	echo   ::                                                                                  ::
	echo   ::  The above copyright notice and this permission notice shall be included in all  ::
	echo   ::  copies or substantial portions of the Software.                                 ::  
	echo   ::                                                                                  ::
	echo   ::  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ::
	echo   ::  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ::
	echo   ::  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ::
	echo   ::  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ::
	echo   ::  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ::
	echo   ::  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ::
	echo   ::  SOFTWARE.                                                                       ::
	echo   ::                                                                                  ::
	echo   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo.
	pause
	goto :beginning