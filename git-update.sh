#!/bin/bash
# This script runs every day and updates files to a GitHub repository

echo "Starting Updating Files for GitHub..."
sleep 1

# Pull from the repo first to get fully updated
git fetch origin main
if [ $? -eq 0 ]; then
    git pull origin main
else
    echo "Failed to Fetch"
    exit 1
fi

# Start pushing
# Stage files to add
git add .
if [ $? -eq 0 ]; then
    git commit -m "Files are Updated"  # Commit message
    if [ $? -eq 0 ]; then
        git push origin main  # Push staged files to the main branch
        if [ $? -eq 0 ]; then
            echo "Pushing Files Successful!"
	    echo "Your Github Repo is Fully Updated for today : $(date +"%Y-%m-%d")"
            exit 0
        else
            echo "Pushing Failed. Try Again."
            exit 1
        fi
	sleep 1
    else
        echo "Committing Failed!!"
        exit 1
    fi
    sleep 1
else
    echo "Can't add files"
    exit 1
fi
