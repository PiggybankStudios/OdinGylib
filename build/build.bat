@echo off

rem The "Safe" name doesn't have spaces or invalid characters and also doesn't change for Demo vs non-Demo
set ProjectName=Odin Gylib Test
set ProjectNameSafe=OdinGylibTest
set RunProgram=0
set CopyToDataDirectory=1

set LibDirectory=..\lib
set CodeDirectory=..\code
set DataDirectory=..\data
set TempSourceFolder=temp
set TimeString=%date:~-4,4%%date:~-10,2%%date:~-7,2%%time:~0,2%%time:~3,2%%time:~6,2%

echo [Compiling OdinGylib Test...]

python CollectAllOdinFiles.py "%CodeDirectory%" "%TempSourceFolder%"

rem odin build "%CodeDirectory%\test" -out:"%ProjectNameSafe%.exe" -debug

rem -debug             = enabled .pdb generation
rem -subsystem:windows = makes it a windows-style application rather than a command-line-style one
rem -show-timings      = prints out compile times after successful build
odin build "%TempSourceFolder%" -out:"%ProjectNameSafe%.exe" -debug -subsystem:windows

if "%CopyToDataDirectory%"=="1" (
	echo [Copying %ProjectNameSafe%.exe to data directory]
	XCOPY ".\%ProjectNameSafe%.exe" "%DataDirectory%\" /Y > NUL
) else (
	echo [Build Finished!]
)

if "%RunProgram%"=="1" (
	echo [Running Program...]
	pushd ..\data
	..\build\%ProjectNameSafe%.exe
	popd
)
