@echo off

echo pre-build

set VERSION=0.0.%BUILD_ID%

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "BUILD_DATE=%YYYY%%MM%%DD%-%HH%%Min%%Sec%"

echo BUILD_DATE: "%BUILD_DATE=%"

 
FOR /R ".\src\" %%G in (*version.h) DO (
   Echo File: %%G
   powershell -Command "(gc %%G) -replace '<VERSION>',    '%VERSION%'    | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '<BUILD_ID>',   '%BUILD_ID%'   | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '<BUILD_DATE>', '%BUILD_DATE%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '<GIT_COMMIT>', '%GIT_COMMIT%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '<GIT_BRANCH>', '%GIT_BRANCH%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '<GIT_URL>',    '%GIT_URL%'    | Out-File -encoding ASCII %%G"
)


