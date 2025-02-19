#!/bin/bash



#Variable Configuration
SERVER="your-server.com"
USERNAME="your-username"
APPLICATION_URL="http://your-server.com/your-app"  # Replace with your application's URL
APPLICATION_NAME="YourWebApp" # Give your application a descriptive name
SSH_KEY="/path/to/your/ssh_key" # Optional: Path to your SSH private key for passwordless login
RESTART_CMD="sudo systemctl restart your-app-service" # Replace with the actual restart command

# Function to check the application status
check_status() {
  if curl -s --fail "$APPLICATION_URL" > /dev/null 2>&1; then  #curl -s --fail "$APPLICATION_URL": curl retrieves the content of the URL. -s makes curl silent (doesn't show progress). --fail makes curl return a non-zero exit code if the request fails (e.g., the server is down, or the URL is incorrect). > /dev/null 2>&1: This redirects both standard output (stdout) and standard error (stderr) to /dev/null, effectively suppressing any output from curl. We only care about the exit code.return 0: If the curl command succeeds (returns a zero exit code), the function returns 0, indicating the application is up.
#return 1: If the curl command fails (returns a non-zero exit code), the function returns 1, indicating the application is down.
    return 0  # Application is up
  else
    return 1  # Application is down
  fi
}
# Function to restart the application
restart_application() {
  echo "Restarting $APPLICATION_NAME on $SERVER..."

  if [[ -n "$SSH_KEY" ]]; then
    if ssh -q -i "$SSH_KEY" "$USERNAME@$SERVER" "$RESTART_CMD"; then # Correct: single argument
      echo "$APPLICATION_NAME restarted successfully."
    else
      echo "Failed to restart $APPLICATION_NAME."
      return 1
    fi
  else
    if ssh -q "$USERNAME@$SERVER" "$RESTART_CMD"; then # Correct: single argument
      echo "$APPLICATION_NAME restarted successfully."
    else
      echo "Failed to restart $APPLICATION_NAME."
      return 1
    fi
  fi
}

# Main script logic
echo "Checking status of $APPLICATION_NAME..."

if check_status; then
  echo "$APPLICATION_NAME is running."
else
  echo "$APPLICATION_NAME is down. Attempting to restart..."
  restart_application
fi

exit 0
