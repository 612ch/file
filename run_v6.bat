

@echo off&setlocal enabledelayedexpansion
set startDate=2020/12/31
set end=32
set yyyy=%startDate:~0,4%
set mm=%startDate:~5,2%
set dd=%startDate:~8,2%
set action=0
:actionFlag
set /a od=!dd!-%action%
set /a action+=1

set yyyymmdd=!yyyy!-!mm!-!od!

echo 日期 !yyyymmdd!

set targetDay=!yyyymmdd!

title 处理中V7

set min=0
set max=8
set /a mod=!max!-!min!+1
set /a r=!random!%%!mod!+!min!
set randomNumber=!r!

set n=0


:startFlag

if 0==%randomNumber% goto actionFlag

set addtext= %date% %time%
set filename="test.txt"


if %action%==%end% (
git.exe push --progress "origin" main:main
) 

if %action%==%end% (
exit
) 

echo.>>%filename%

(for /f "delims=" %%a in (%filename%) do echo %%a%addtext%)>temp.txt 

del /s/q test.txt 

ren temp.txt test.txt

git commit -a -m "commit test by demon" --date="%targetDay% %time%"



set /a n+=1

if %n%==%randomNumber% goto actionFlag

echo actionNumber %action%
echo 日期 !yyyymmdd!
echo commitNumber %n%
echo %randomNumber%

goto startFlag



title 处理完成

pause