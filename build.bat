@echo off
setlocal

set RAW=%~dp0
set ROOT=%RAW:~0,-1%
set SOURCE=%ROOT%\src\main\c
set OUTPUT=%ROOT%\target\output\main
set DIST=%ROOT%\dist
set BUILD_TYPE=static_debug


rmdir /s /q %DIST%
mkdir %DIST%

rmdir /s /q %OUTPUT%
mkdir %OUTPUT%

rmdir /s /q %ROOT%\artifact
mkdir %ROOT%\artifact


cd %OUTPUT%
@echo on
make -f %ROOT%\src\main\make\windows_amd64.makefile %*
if %errorlevel% neq 0 exit /b %errorlevel%
@echo off

cd %ROOT%\dist
copy %ROOT%\src\main\resources\hello.ico 
copy %ROOT%\src\main\scripts\*
zip %ROOT%\artifact\hello.zip * 

