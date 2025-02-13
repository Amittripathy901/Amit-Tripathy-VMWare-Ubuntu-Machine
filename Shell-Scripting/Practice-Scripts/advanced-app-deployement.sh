#!/bin/bash

# Variables (Update these based on your project)
PROJECT_DIR="/home/amittripathy/my-app"  # Path to your application
GIT_REPO="git@github.com:your-repo.git"  # Replace with your repo
BRANCH="main"
BUILD_COMMAND="npm run build"            # Change based on tech stack
DEPLOY_DIR="/var/www/html/my-app"        # Change based on server setup
SERVICE_NAME="my-app-service"            # If using a systemd service

echo "🚀 Starting Deployment Process..."

# Step 1: Navigate to the Project Directory
cd "$PROJECT_DIR" || { echo "❌ Project directory not found!"; exit 1; }

# Step 2: Pull Latest Code
echo "📥 Pulling latest code from $BRANCH branch..."
git reset --hard origin/$BRANCH
git pull origin $BRANCH

# Step 3: Install Dependencies
echo "📦 Installing dependencies..."
npm install  # Change to `pip install -r requirements.txt` for Python

# Step 4: Build the Application
echo "🛠️ Building the application..."
$BUILD_COMMAND || { echo "❌ Build failed!"; exit 1; }

# Step 5: Run Tests (Optional)
echo "✅ Running tests..."
npm test || { echo "❌ Tests failed! Stopping deployment."; exit 1; }

# Step 6: Deploy the Application
echo "🚀 Deploying application..."
rm -rf "$DEPLOY_DIR/*"
cp -R build/* "$DEPLOY_DIR"

# Step 7: Restart Service (Optional)
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "🔄 Restarting service: $SERVICE_NAME"
    sudo systemctl restart "$SERVICE_NAME"
else
    echo "⚠️ Service $SERVICE_NAME not found. Skipping restart."
fi

echo "🎉 Deployment successful!"
exit 0

