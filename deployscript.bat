@ECHO OFF 

set COMMITCOMMENT=%1
IF [%COMMITCOMMENT%] EQU [] goto :nocomment
IF [%COMMITCOMMENT%] EQU [""] goto :nocomment

@ECHO ON

rm *.nupkg

..\xxcopy "src\ModernHttpClient\bin\**\*.*" "lib\" /R /s /y

nuget pack "ModernHttpClient.nuspec"

nuget push "*.nupkg" 1660902d-ef34-4ce3-8217-bef69d90ba6b -s https://www.myget.org/F/bluechilli-mobile/api/v2/package
