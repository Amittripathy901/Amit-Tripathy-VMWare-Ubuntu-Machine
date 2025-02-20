#!/bin/bash

#Simple Deployement Script

REPO_DIR="/home/ubuntu/myapp"
SERVICE_NAME="myapp.service"

cd "$REPO_DIR"

#Pull latest code
git fetch --all
git reset --hard origin/main

#RESTART SERVICES
sudo systemctl restart "$SERVICE_NAME"

if [ $? -eq 0 ]; then
	echo "Deployment Completed Successfully at $(date)."
else
	echo "Deployement Failed! Try Again"
fi

#Integrate with WEBHOOKS from GITHUB or GITLAB for automated deployments

