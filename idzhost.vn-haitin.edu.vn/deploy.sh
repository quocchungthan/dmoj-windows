#!/bin/bash

# Check if set-env-vars.sh exists and source it
if [ -f "./set-env-vars.sh" ]; then
    echo "Found set-env-vars.sh. Sourcing it..."
    source ./set-env-vars.sh
else
    echo "set-env-vars.sh not found. Skipping."
fi

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "Git is not installed. Please install Git first."
    exit 1
fi

# Add submodules
echo "Adding submodules..."
git submodule add https://github.com/DMOJ/site.git
git submodule add https://github.com/DMOJ/judge.git
git submodule add https://github.com/DMOJ/judge-server.git

# Initialize submodules
echo "Initializing submodules..."
git submodule init

# Update submodules recursively and with the latest changes
echo "Updating submodules..."
git submodule update --init --recursive --remote

echo "Submodules added and initialized successfully."
