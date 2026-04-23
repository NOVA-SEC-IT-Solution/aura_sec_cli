@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('git rev-parse --show-toplevel 2^>nul') do set ROOT=%%i
if "%ROOT%"=="" set ROOT=%cd%
set STATE_FILE=%ROOT%\.git-aura\commit-editor-state
set REAL_EDITOR_FILE=%ROOT%\.git-aura\editor-real
set COMMIT_FILE=%1

if exist "%STATE_FILE%" (
    set /p TARGET_FILE=<"%STATE_FILE%"
    if "%TARGET_FILE%"=="%COMMIT_FILE%" (
        del "%STATE_FILE%" >nul 2>nul
        exit /b 0
    )
)

if exist "%REAL_EDITOR_FILE%" (
    set /p REAL_EDITOR=<"%REAL_EDITOR_FILE%"
) else if not "%VISUAL%"=="" (
    set REAL_EDITOR=%VISUAL%
) else if not "%EDITOR%"=="" (
    set REAL_EDITOR=%EDITOR%
) else (
    set REAL_EDITOR=notepad
)

call %REAL_EDITOR% %*
