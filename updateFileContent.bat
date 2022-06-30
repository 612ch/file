@echo off 
set addtext=输入要在后面增加的字符
(for /f "delims=" %%a in (test.txt) do echo %%a%addtext%)>temp.txt 
del /s/q test.txt 
ren temp.txt test.txt