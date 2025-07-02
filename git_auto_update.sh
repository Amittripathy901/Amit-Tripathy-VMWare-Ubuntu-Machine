#!/bin/bash

# Navigate to the project directory
cd /home/amittripathy/Desktop || exit

# Fetch latest changes from remote
git fetch origin

# Pull latest changes into the current branch
git pull origin $(git rev-parse --abbrev-ref HEAD)

# Stage all local changes
git add .

# Commit with a default message
git commit -m "Automated commit"

# Push changes to the remote repository
git push origin $(git rev-parse --abbrev-ref HEAD)
