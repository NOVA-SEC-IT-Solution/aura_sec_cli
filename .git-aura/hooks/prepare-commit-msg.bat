@echo off
REM AURA Secure CLI — Guardian Hook (prepare-commit-msg)
set COMMIT_MSG_FILE=%1
set COMMIT_SOURCE=%2
set SHA1=%3

if "%COMMIT_SOURCE%"=="" (
    aura-cli hook-prepare-commit-msg --commit-msg-file "%COMMIT_MSG_FILE%"
) else if "%SHA1%"=="" (
    aura-cli hook-prepare-commit-msg --commit-msg-file "%COMMIT_MSG_FILE%" --commit-source "%COMMIT_SOURCE%"
) else (
    aura-cli hook-prepare-commit-msg --commit-msg-file "%COMMIT_MSG_FILE%" --commit-source "%COMMIT_SOURCE%" --sha1 "%SHA1%"
)
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
