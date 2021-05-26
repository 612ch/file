

@echo off&setlocal enabledelayedexpansion
set startDate=2021/05/14
set end=6
set yyyy=%startDate:~0,4%
set mm=%startDate:~5,2%
set dd=%startDate:~8,2%
set action=0
:actionFlag
set /a od=!dd!-%action%
set /a action+=1
if !od!==0 call :dd0
if !mm!==0 call :mm0
set yyyymmdd=!yyyy!-!mm!-!od!

echo 日期 !yyyymmdd!

set targetDay=!yyyymmdd!

title 处理中V7

set min=4 
set max=15 
set /a mod=!max!-!min!+1
set /a r=!random!%%!mod!+!min!
set randomNumber=!r!

set n=0


:startFlag

set addtext= %date% %time%
set filename="test.txt"

 
if %action%==%end% exit

echo.>>%filename%

(for /f "delims=" %%a in (%filename%) do echo %%a%addtext%)>temp.txt 

del /s/q test.txt 

ren temp.txt test.txt

git commit -a -m "commit test by demon" --date="%targetDay% %time%"

git.exe push --progress "origin" file_v7


set /a n+=1

if %n%==%randomNumber% goto actionFlag

echo actionNumber %action%
echo 日期 !yyyymmdd!
echo commitNumber %n%
echo %randomNumber%

goto startFlag



title 处理完成

