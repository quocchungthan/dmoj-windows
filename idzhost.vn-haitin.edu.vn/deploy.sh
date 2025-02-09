#!/bin/bash

# Check if set-env-vars.sh exists in the current directory and source it
if [ -f "./set-env-vars.sh" ]; then
    echo "Found set-env-vars.sh. Sourcing it..."
    source ./set-env-vars.sh
# Check if set-env-vars.sh exists in another directory and source it
elif [ -f "./idzhost.vn-haitin.edu.vn/set-env-vars.sh" ]; then
    echo "Found set-env-vars.sh in the specified directory. Sourcing it..."
    source ./idzhost.vn-haitin.edu.vn/set-env-vars.sh
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

# Check if Docker and docker-compose are installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "docker-compose is not installed. Please install docker-compose first."
    exit 1
fi

# Build and start the web service
echo "Building and starting the web service..."
docker compose up --build -d web
docker container stop dmoj_app
docker container start dmoj_app
# Wait for 40 seconds
echo "Waiting for 40 seconds before loading data..."
sleep 40

# Load initial data into the dmoj_app container
echo "Loading data into dmoj_app container..."
docker exec -it dmoj_app /app/load_data.sh

# Build and start all services (db, web, etc.)
echo "Building and starting all services..."
docker compose up --build -d

# Load assets into the dmoj_site container
echo "Loading assets into dmoj_site container..."
docker exec -it dmoj_site /app/load_assets.sh

# Additional step: You can add more docker commands as needed.
# For example, running migrations, cleaning up, or checking logs.

# Example: Stopping all services (optional)
# echo "Stopping all services..."
# docker-compose down
echo "Docker setup completed successfully!"