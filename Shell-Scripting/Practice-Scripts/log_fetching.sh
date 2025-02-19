#!/bin/bash

#Script to fetch log from remote server and analyze the error message within the logs

#Variable Configuration

SERVER="your-server.com"
USERNAME="your-username"
REMOTE_LOG_FILE="/path/to/remote/logfile.log/"
LOCAL_LOG_FILE="/path/to/local/logfile.log"
ERROR_LOG_FILE="/path/to/error_logfile.log"


#Fetch the log file from the remote server using "scp" (secure copy)
if ! scp "$USERNAME@$SERVER:$REMOTE_LOG_FILE" "$LOCAL_LOG_FILE"; then # Negated scp for error check
    echo "Error: Failed to fetch log file from Remote Server $SERVER.!Try Again!"
    exit 1
fi

#Analyze the log file for error message, use grep to find lines containing "error"

grep -i "error" "$LOCAL_LOG_FILE" > "$ERROR_LOG_FILE" #This searches for error in case-insensitive manner and redirect the output to error_log_file

#Check if any errors were found 

if [ -s "$ERROR_LOG_FILE" ]; then #-s checks if file is not empty
	echo "Error messages found. see $ERROR_LOG_FILE"
else
	echo "No error messages found in the log file."
fi

exit 0
