#!/bin/bash
# This script updates the code from a Git repository, builds the project, and deploys it.

# Define variables
REPO_URL="https://github.com/your_username/your_repository.git"
TARGET_DIR="/path/to/deployment/directory"   # Directory where the repo is checked out
BRANCH="main"                                  # Branch to deploy
BUILD_DIR="/path/to/build/dir"                 # Directory where the build process occurs

# Update the code from the repository
echo "Updating code from the repository: $REPO_URL..."
cd "$TARGET_DIR" || { echo "Error: TARGET_DIR not found: $TARGET_DIR"; exit 1; }
git pull origin "$BRANCH" || { echo "Error: git pull failed"; exit 1; }

# Build the project (if needed)
echo "Building the project..."
cd "$BUILD_DIR" || { echo "Error: BUILD_DIR not found: $BUILD_DIR"; exit 1; }

# Insert your build command below (e.g., for Node.js: npm install && npm run build)
# Example for a Node.js project:
# npm install && npm run build || { echo "Error: Build failed"; exit 1; }

# Deploy the project
echo "Deploying the project..."
# Insert your deploy commands here.
# For example, copying the build output to the deployment directory:
# cp -R "$BUILD_DIR/dist/." "$TARGET_DIR/deployed_app/" || { echo "Error: Deployment failed"; exit 1; }

echo "Deployment Complete!"

