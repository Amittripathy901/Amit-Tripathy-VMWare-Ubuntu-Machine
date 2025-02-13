#!/bin/bash

#Advanced System Resource Management Script

#Send EMAIL Alert when Usage reaches Maximum Threshold


#Variable Configuration

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
MAIL_RECIPIENT="amit.pravuji@gmail.com" 
MAIL_SUBJECT="System Resource Usage Alert"

#Function to check reosurce usage and send alert if threshold exceeded 

check_resource() {
	#cpu_usage
	CPU_USAGE=$(top -bn1 -i -c | grep "Cpu(s)" | awk '{print $2 + $4}')
	CPU_USAGE=$(echo "CPU_USAGE" | cut -d'.' -f1) #Extract integer part

	#MEMORY USAGE
	MEMORY_TOTAL=$(free -m | awk 'NR==2{print $2
