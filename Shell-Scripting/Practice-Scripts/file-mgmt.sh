#!/bin/bash

# Write a shell script to find all large files (greater than 500 bytes) in a directory and move them to another directory.

SOURCE_DIR="/home/amittripathy/Desktop/Shell-Scripting/Large-Scripts"
DEST_DIR="/home/amittripathy/Desktop/Shell-Scripting/Practice-Scripts"
LOG_FILE="/var/log/move_large_files.log"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist." >> "$LOG_FILE"
  exit 1
fi

# Check if destination directory exists. Create it if it doesn't.
if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory '$DEST_DIR' does not exist. Creating it." >> "$LOG_FILE"
  mkdir -p "$DEST_DIR"
  if [ $? -ne 0 ]; then
      echo "Error creating destination directory '$DEST_DIR'." >> "$LOG_FILE"
      exit 1
  fi
fi

# Find files larger than 500 bytes and move them to the destination directory.
# Note: Use "+500c" if you mean 500 bytes. (Using "b" means 512-byte blocks.)
find "$SOURCE_DIR" -type f -size +500c -exec mv {} "$DEST_DIR" \;

echo "$(date) - Moved large files (>500 bytes) from $SOURCE_DIR to $DEST_DIR" >> "$LOG_FILE"

