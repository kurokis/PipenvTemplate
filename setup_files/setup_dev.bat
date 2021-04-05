rem Change the current directory to where this batch file exists
cd /d %~dp0
cd /d ..

rem Upgrade pip
pip install --upgrade pip

rem Install pipenv
pip install pipenv 

rem Change environment variable to let pipenv create a virtual environement under the current directory
set PIPENV_VENV_IN_PROJECT=1

rem Install the virtual environment (use --dev option to install dev-package dependencies)
pipenv install --dev

pause