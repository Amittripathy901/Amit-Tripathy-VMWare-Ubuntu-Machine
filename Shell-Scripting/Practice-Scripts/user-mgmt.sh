#!/bin/bash

#User Management Script

#Function to Create a new user

# Function to Create a new user
create_user() {
    read -p "Enter username to create: " username
    if getent passwd "$username" >/dev/null; then
        echo "User $username already exists."
    else
        sudo useradd -m "$username" && echo "User $username created successfully." || echo "Failed to create user $username."
    fi
}

#Function to Modify User
modify_user() {
read -p "Enter username to modify: " username
if id "$username" &>/dev/null; then
	read -p "Enter Groups to add(comma [,] separated):" groups
	sudo usermod -aG $"$groups" "$username" && echo "User $username modified successfully" || echo "Failed to modify user $username."
	else
		echo "User $username does not exist."
fi
}

#Function to delete an existing user 
delete_user() {
	read -p "Enter username to delete: " username
	if id "$username" &>/dev/null; then
		sudo userdel -r "$username" && echo "User $username deleted successfully ." || echo "Failed to delete user $username."
		else
			echo "User $username does not exist."
	fi

}

#Main Menu

while true; do
	echo "User Management Menu:"
	echo "1.Create User"
	echo "2.Modify User"
	echo "3.Delete User"
	echo "4.Exit"
	read -p "Choose an Option (1-4): " option

	case $option in 
		1) create_user ;;
		2) modify_user ;;
		3) delete_user ;;
		4) echo "Exiting Script."; break ;;
		*) echo "Invalid Option. Please choose valid option between [1-4]" ;;
	esac
done


