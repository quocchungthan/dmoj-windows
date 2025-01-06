#!/bin/bash

# Load the navbar data
echo "Loading navbar data..."
python3 manage.py loaddata navbar

# Load the language_small data
echo "Loading language_small data..."
python3 manage.py loaddata language_small

# Load the demo data
echo "Loading demo data..."
python3 manage.py loaddata demo

# Load the language_all data
echo "Loading language_all data..."
python3 manage.py loaddata language_all

echo "All data loaded successfully!"
