#!/bin/bash

# Change directory to the judge/.docker folder
echo "Changing directory to judge/.docker..."
cd judge/.docker || { echo "Failed to change directory to judge/.docker. Exiting."; exit 1; }

# Run the `make judge-tier1` command to build the judge image
echo "Running make judge-tier1..."
make judge-tier1

# Inform the user about the manual steps for Judge name, authentication, and port setup
echo "REMINDER:"
echo "1. Judge name and judge authentication were generated via admin page of the site."
echo "2. \$PORT and \$IP should be set according to BRIDGED_JUDGE_ADDRESS in the site's local_settings.py."

# Start the judge container using the specific docker-compose file
echo "Starting the judge container using docker-compose..."
docker compose -f ../../docker-compose.judge.yml up -d

echo "Judge setup completed successfully!"

# to run the SSL bot
# Run this manually
#docker compose run --rm -v ./certbot/www/:/var/www/certbot/:rw -v ./certbot/conf/:/etc/letsencrypt/:rw certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run --network dmoj-windows_backend -d haitin.edu.vn

#echo "SSL bot setup completed successfully!"