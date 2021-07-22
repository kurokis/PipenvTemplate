#! /bin/bash 

# Change the current directory to where this batch file exists
cd "$(dirname "$0")"
cd ..

# Upgrade pip
python3 -m pip install --upgrade pip

# Install pipenv
python3 -m pip install pipenv 

# Change environment variable to let pipenv create a virtual environement under the current directory
export PIPENV_VENV_IN_PROJECT=1

# Install the virtual environment
python3 -m pipenv install

