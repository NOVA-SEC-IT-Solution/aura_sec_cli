@echo off
REM AURA Secure CLI — Guardian Hook (pre-commit)
aura-cli hook-pre-commit
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
