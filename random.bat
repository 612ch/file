@echo off&setlocal enabledelayedexpansion
set min=4 
set max=12 
set /a mod=!max!-!min!+1
set /a r=!random!%%!mod!+!min!
echo !r!
pause