#!/bin/bash

# Wait for the database to be ready (optional, can be added if needed)
# Example using `wait-for-it` or similar scripts to wait for MySQL/MariaDB container
# /wait-for-it.sh db:3306 --timeout=30 --strict -- echo "Database is up"
/app/wait-for-it.sh db:3306 -- /app/wait-for-it.sh redis-server:6379 -- echo "Both DB and Redis are up!"

# Run Django management commands
echo "Running Django migrations..."
python3 manage.py migrate --noinput
# Optionally load initial data (uncomment if needed)
# echo "Loading initial data..."
# python3 manage.py loaddata navbar
# python3 manage.py loaddata language_small
# python3 manage.py loaddata demo
# python3 manage.py loaddata language_all

# Start Django development server (or gunicorn for production)
echo "Starting Django server..."
python3 manage.py runserver 0.0.0.0:8000
