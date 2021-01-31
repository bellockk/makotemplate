@echo off
Setlocal enabledelayedexpansion
Set >set
For /F "tokens=1* delims==" %%i in (set) do set %% %i =
Del set
robot %* --nostatusrc --noncritical NON_CRITICAL --noncritical KNOWN_FAILURE -P "%~dp0../etc" -V "%~dp0../var/Variables.py" -d "%~dp0../dist" "%~dp0../src/Mako.robot"
