#!/bin/bash


#Script to Monitor System Resources

MAIL="amit.pravuji@gmail.com"

while true;
	do
		clear ###Clear the Terminal
	
		echo "System Resource Monitoring"
		echo "**************************"


		#Display CPU Usage
		echo "CPU Usage: "
		top -n 1 -b | grep "Cpu"
                echo "*******************************"
		#Display memory usage
		echo -e "Memory Usage:"
		free -h
                echo "*******************************"

		#Display disk space usage
		echo -e "\nDisk Space Usage:"
                df -h

		sleep 5 # Wait for 5 seconds before the next update

	done

