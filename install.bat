@echo off
setlocal enabledelayedexpansion

set HELP_TRIGGER=false
set PARENT_TRIGGER=false
set FORCE_TRIGGER=false

set HELP_FLAG=--help
set HELP_ALIAS=-h
set PARENT_FLAG=--parent
set PARENT_ALIAS=-p
set FORCE_FLAG=--force
set FORCE_ALIAS=-f

set HELP_MESSAGE=neovim config install script

for %%A in (%*) do (
  if "%%A"=="%HELP_FLAG%" set HELP_TRIGGER=true
  if "%%A"=="%HELP_ALIAS%" set HELP_TRIGGER=true

  if "%%A"=="%PARENT_FLAG%" set PARENT_TRIGGER=true
  if "%%A"=="%PARENT_ALIAS%" set PARENT_TRIGGER=true

  if "%%A"=="%FORCE_FLAG%" set FORCE_TRIGGER=true
  if "%%A"=="%FORCE_ALIAS%" set FORCE_TRIGGER=true
)

if "%HELP_TRIGGER%"=="true" (
  echo.
  echo neovim config install script
  echo.
  echo usage: install.bat [FLAG^(S^)]
  echo.
  echo flags:
  echo     --help   ^| -h   Prints the help panel
  echo     --parent ^| -p   Enables parent directory creating
  echo     --force  ^| -f   Overrides existing nvim config
  echo.
  exit /b 0
)

set APPDATA=%LOCALAPPDATA%

if "%APPDATA%"=="" (
  echo error: LOCALAPPDATA is empty
  exit /b 1
)

if not exist "%APPDATA%" (
  if "%PARENT_TRIGGER%"=="true" (
    mkdir "%APPDATA%"
  ) else (
    echo error: %APPDATA% path does not exist
    exit /b 1
  )
)

set NVIM=%APPDATA%\nvim

if exist "%NVIM%" (
  if "%FORCE_TRIGGER%"=="true" (
    echo WARNING: nvim config already exists.
    set /p ans=This will erase all data. Continue? [y/n]:
    if /i "!ans!" NEQ "y" (
        echo Aborting...
        exit /b 0
    )
    rmdir /s /q "%NVIM%"
    mkdir "%NVIM%"
  ) else (
    echo error: nvim config already exists.
    exit /b 1
  )
) else (
  echo Creating nvim config directory...
  mkdir "%NVIM%"
)

echo.
echo Copying files from %CD%
echo to %NVIM%
echo.

xcopy "%CD%\*" "%NVIM%" /E /H /Y >nul

if errorlevel 1 (
  echo error: copy failed
  exit /b 1
)

echo done!
exit /b 0
