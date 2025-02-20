#!/bin/bash

#Automatic Backup 

SOURCE_DIR="/var/www/html"
BACKUP_DIR="/backup/html_$(date +%F_%H-%M-%S)"
REMOTE_SERVER="user@backup-server"
REMOTE_PATH="/remote_backup"

#Create a Local backup directory

mkdir -p "$BACKUP_DIR"

#Copy files

cp -r "$SOURCE_DIR" "$BACKUP_DIR"

#Sync to remote server using rsync

rsync -avz "$BACKUP_DIR" "${REMOTE_SERVER}:${REMOTE_PATH}"

echo "Backup Completed at $(date)."

