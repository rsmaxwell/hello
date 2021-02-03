@echo off
setlocal

set RAW=%~dp0
set ROOT=%RAW:~0,-1%

%ROOT%/hello.exe

pause
