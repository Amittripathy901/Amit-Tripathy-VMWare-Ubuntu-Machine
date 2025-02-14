#!/bin/bash

#User and Group Management Script



###First Phase:-User-Management

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

####Second Phase:-Group Management
#Function for creating a Group
create_group() {
	read -p "Enter Group Name:" group
	#check group already exist or nor, if not then create it
	getent group $group >/dev/null

	if [ $? -ne 0 ]; then
		 echo "**Creating Group $group**........!"
		 sleep 1
                 sudo groupadd "$group" >/dev/null
		 if [ $? -eq 0 ]; then
			 echo "$group Created Successfully!"
		 exit 1
		 fi
	 else
		 echo "$group already exist"
	fi
}

#Function to Delete a Group
delete_group() {
	read -p "Enter Group Name: " group
	#check if it exist or not, if exist then delete or-else promt - group doesn't exist
	getent group $group >/dev/null

	if [ $? -eq 0 ]; then
		echo "**Deleting Group $group**........!"
		sleep 1
                 sudo groupdel "$group" >/dev/null
		 if [ $? -eq 0 ]; then
			 echo "**Successfuly Deleted the Group: $group"
			 sleep 1
			 exit
		 fi
	 else
		 echo "Group: $group doesn't exist!!"
	fi

}

#Main Menu

while true; do
	echo "User Management Menu:"
	echo "1.Create User"
	echo "2.Modify User"
	echo "3.Delete User"
	echo "4.Create Group"
	echo "5.Delete Group"
	echo "6.Exit"
	read -p "Choose an Option (1-6): " option

	case $option in 
		1) create_user ;;
		2) modify_user ;;
		3) delete_user ;;
		4) create_group ;;
		5) delete_group ;;
		6) echo "Exiting Script."; break ;;
		*) echo "Invalid Option. Please choose valid option between [1-4]" ;;
	esac
done


