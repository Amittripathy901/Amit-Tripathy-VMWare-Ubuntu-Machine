#!/bin/bash

# This is the backup of mini-scripts directory and archiving it

# Specify source and destination directory
source_dir="/home/amittripathy/Desktop/Shell-Scripting/Mini_Scripts"
backup_dir="/home/amittripathy/Desktop/Shell-Scripting/Backup-Directory"
backup_filename="backup-$(date +"%Y%m%d%H%M%S").tar.gz"

# Check if backup directory is present or not! If not present, create it
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    echo "Directory Created! : $backup_dir"
else
    echo "Directory $backup_dir already exists!"
fi

# Create Backup using TAR
tar -cvf "${backup_dir}/${backup_filename}" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"

# Check if the backup was successful!
if [ $? -eq 0 ]; then
    echo "Backup successful: ${backup_filename} created in ${backup_dir}"
else
    echo "Backup Failed"
fi

