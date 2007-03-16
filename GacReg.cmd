@echo off

IF "%Type%"=="" set Type=Debug

set GacUtil="%VS80COMNTOOLS%..\..\SDK\v2.0\Bin\gacutil.exe"
set NemerleInstall=%ProgramFiles%\Nemerle

@echo NemerleInstall=%NemerleInstall%
@echo VS80COMNTOOLS=%VS80COMNTOOLS%
@echo GacUtil=%GacUtil%

md "%NemerleInstall%"
cd /D "%NemerleInstall%"

%GacUtil% /u Nemerle
%GacUtil% /u Nemerle.Compiler
%GacUtil% /u Nemerle.MSBuild.Tasks
%GacUtil% /u Nemerle.Macros

@echo errorlevel=%errorlevel%
set errorlevel=0

%GacUtil% /i "%NemerleInstall%\Nemerle.dll"
%GacUtil% /i "%NemerleInstall%\Nemerle.Compiler.dll"
%GacUtil% /i "%NemerleInstall%\Nemerle.Macros.dll"
rem It doesn't have a strong name
rem %GacUtil% /i "%NemerleInstall%\Nemerle.MSBuild.Tasks.dll"

cd "%~dp0"

pause 
