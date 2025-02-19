#!/bin/bash


#Script to Update all the installed packages on a system and reboots the system if needed

apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt clean

if [ $? -eq 0 ]; then
	if [ -f /var/run/reboot-required ]; then
		echo "Reboot required. Rebooting in 2minutes!"

		sleep 60

		reboot

	else
		echo "Reboot not required"
	fi
else
	echo "Update and Upgrade Failed"
	exit 1
fi

