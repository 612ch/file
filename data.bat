echo Wscript.echo dateadd("d",-1,date)>vbs.vbs
for /f %%a in ('cscript //nologo vbs.vbs') do del vbs.vbs&&set yyyymmdd=%%a
for /f "tokens=1,2,3* delims=// " %%i in ('echo %yyyymmdd%') do set yyyy=%%i&set mm=%%j&set dd=%%k
if   %mm%   LSS   9   set   mm=0%mm%
if   %dd%   LSS   9   set   dd=0%dd%
echo %yyyy%++++%mm%++++%dd%
pause