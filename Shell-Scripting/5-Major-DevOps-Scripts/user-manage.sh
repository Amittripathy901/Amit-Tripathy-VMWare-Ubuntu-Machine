#!/usr/bin/env bash
# manage_users.sh: Script to create new users and set up SSH keys

USERNAME="$1"
SSH_KEY="$2"

if [ -z "$USERNAME" ] || [ -z "$SSH_KEY" ]; then
  echo "Usage: $0 <username> <ssh_key>"
  exit 1
fi

# Create user if not exists
if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists."
else
  sudo useradd -m -s /bin/bash "$USERNAME"
  echo "User $USERNAME created."
fi

# Create .ssh directory
sudo mkdir -p /home/"$USERNAME"/.ssh
sudo bash -c "echo '$SSH_KEY' > /home/$USERNAME/.ssh/authorized_keys"

# Set permissions
sudo chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"/.ssh
sudo chmod 700 /home/"$USERNAME"/.ssh
sudo chmod 600 /home/"$USERNAME"/.ssh/authorized_keys

echo "SSH key added for $USERNAME."

