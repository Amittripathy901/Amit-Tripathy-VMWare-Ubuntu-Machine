#!/bin/bash

# Read user from input 
read -p "Enter User Name you want to add: " username
read -p "Enter Group Name for the User: " group

# Define home directory correctly after reading user input
HOME="/home/$username"

# Check if the group already exists, if not, create it
getent group "$group" >/dev/null

if [ $? -ne 0 ]; then
	echo "**Creating Group $group**........!"
	sleep 1
        sudo groupadd "$group"
    if [ $? -eq 0 ]; then
        echo "$group created successfully!."
    else
        echo "Failed to create group $group!"
        exit 1
    fi
fi

echo "Checking if the user $username exists or not..."
getent passwd "$username" >/dev/null

if [ $? -ne 0 ]; then
    echo "*** Creating User: $username, please wait! ***"
    sleep 1
    sudo useradd -m -d "$HOME" -g "$group" "$username"
    
    if [ $? -eq 0 ]; then
        sudo chmod 750 "$HOME"
        echo "$(date) - Created user $username with home directory $HOME"
    else
        echo "Adding user $username was UNSUCCESSFUL!"
        exit 1
    fi
else
    echo "User: $username already exists!"
fi

