@echo off

echo pre-build

rem VERSION="0.0.$((${BUILD_ID}))"
rem TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
rem     
rem find . -name "Version.java" | while read versionfile; do
rem 
rem     echo "Replacing tags in ${versionfile}"
rem 
rem     sed -i "s@<VERSION>@${VERSION}@g"            ${versionfile}    
rem     sed -i "s@<BUILD_ID>@${BUILD_ID}@g"          ${versionfile}
rem     sed -i "s@<BUILD_DATE>@${TIMESTAMP}@g"       ${versionfile}
rem     sed -i "s@<GIT_COMMIT>@${GIT_COMMIT}@g"      ${versionfile}
rem     sed -i "s@<GIT_BRANCH>@${GIT_BRANCH}@g"      ${versionfile}
rem     sed -i "s@<GIT_URL>@${GIT_URL}@g"            ${versionfile}
rem done

rem powershell -Command "(gc myFile.txt) -replace 'foo', 'bar' | Out-File -encoding ASCII myFile.txt"

FOR /R ".\" %%G in (version.h) DO (
   Echo now in %%G
   powershell -Command "(gc %%G) -replace '<BUILD_ID>', '%BUILD_ID%' | Out-File -encoding ASCII %%G"
)
Echo "back home"


