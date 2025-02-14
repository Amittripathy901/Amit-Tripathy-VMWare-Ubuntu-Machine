#!/bin/bash
#
#Write a script to Downlaod the latest backup file


#Configuration
REMOTE_SERVER="YOUR_SERVER_ADDRESS"
USERNAME="YOUR_USERNAME"
REMOTE_BACKUP_FILE="/PATH/TO/REMOTE/BACKUP-DIR/backup.tar.gz"
LOCAL_BACKUP_DIR="/PATH/TO/BACKUP-DIR"
LOGFILLE="/VAR/LOG/BACKUP-DOWNLOAD.LOG"

#ENSURE THE BACKUP DIRECTORY EXIST

mkdir -p "$LOCAL_BACKUP_DIR"

#Get the latest backup filename
#This script assumes backups are named with dates

LATEST_BACKUP=$(ssh "$USERNAME@$SERVER" "ls -ltr $REMOTE_BACKUP_PATH | tail -n 1")
#make sure you have password-less authentication enabled for remote server otherwisw the script will failed


if [ -z "$LATEST_BACKUP" ];
then
	echo "Error: No Backup Files found on the server."
	exit 1
fi

echo "Latest backup file: $LATEST_BACKUP"

#Construct the remote and local file paths
REMOTE_FILE="$REMOTE_BACKUP_PATH$LATEST_BACKUP"
LOCAL_FILE="$LOCAL_BACKUP_DIR$LATEST_BACKUP"

#Download the backup file using scp(secure copy)

start_time=$(date +%s) #Record start time in seconds since epoch

scp "$USERNAME@$SERVER:$REMOTE_FILE" "$LOCAL_FILE"

end_time=$(date +%s) #Record end time
download_time=$(( end_time - start_time )) #Calculate download time

#Log the download information
current_datetime=$(date)

echo "$current_datetime: Downloaded $LATEST_BACKUP from $SERVER to $LOCAL_FILE in $download_time seconds." >> "$LOGFILE"

echo "Download complete. Logged to $LOGFILE"

#Optional: Add errpr handling
if [ $? -ne 0 ]; 
then
	echo "Error: Backup download Failed!."
	echo "$current_datetime: ERROR:Download of $LATEST_BACKUP failed." >> $LOGFILE
	exit 1
fi

exit 0
