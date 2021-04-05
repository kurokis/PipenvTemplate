rem Change the current directory to where this batch file exists
cd /d %~dp0
cd /d ..

rem Confirm deletion of the virtual environment
@echo off
set /p choice="Delete Pipfile.lock and .venv in the parent directory? (y/n) "
if /i {%choice%}=={y} (goto :yes)

exit

:yes
rem delete Pipfile.lock
del /s Pipfile.lock

rem delete virtual environment within current directory
del /s /q .venv
rmdir /s /q .venv

pause