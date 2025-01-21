#!/bin/bash

# Update the system and install necessary dependencies
sudo apt-get update -y

# Install Python and pip if not already installed
sudo apt-get install -y python3 python3-pip

# Navigate to the application directory or clone the repo
APP_DIR="/home/ubuntu/fastapi-app"
if [ ! -d "$APP_DIR" ]; then
    git clone <your-repo-url> $APP_DIR
fi

cd $APP_DIR

# Pull the latest changes
git pull origin main

# Install dependencies
pip3 install -r requirements.txt

# Run the application
pkill -f "uvicorn"  # Stop any existing uvicorn processes
nohup python3 -m uvicorn main:app --host 0.0.0.0 --port 5000 &> fastapi.log &
