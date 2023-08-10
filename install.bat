@echo off
@rem echo %path%
@rem echo %~dp0
for /f "tokens=3" %%a in ('reg query "HKCU\Environment" /v Path') do set OLD_PATH=%%a
set result=
echo %OLD_PATH% | findstr /c:%~dp0 >nul 2>nul &&set result=true||set result=false

if %result% equ true (
    echo "It's already installed."
	goto :eof
)
reg add "HKCU\Environment" /v Path /d "%~dp0;%OLD_PATH%" /f
echo "Installation complete."