@echo off
setlocal

set RAW=%~dp0
set ROOT=%RAW:~0,-1%
set SOURCE=%ROOT%\src\main\c
set OUTPUT=%ROOT%\target\output\main
set DIST=%ROOT%\dist
set BUILD_TYPE=static_debug


if NOT exist %DIST% mkdir %DIST%
if NOT exist %OUTPUT% mkdir %OUTPUT%

cd %OUTPUT%
@echo on
make -f %ROOT%\src\main\make\windows_amd64.makefile %*
@echo off

rmdir /S /Q artifact
mkdir artifact
cd dist
zip %ROOT%\\artifact\hello.zip *

cd %ROOT%\src\main\resourses
zip -u %ROOT%\artifact\hello.zip hello.ico
