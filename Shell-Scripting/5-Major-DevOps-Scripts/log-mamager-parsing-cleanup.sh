#!/bin/bash

#Log Parsing and Cleanup Script

#Rotate and Compress old logs

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/archive"
DAYS_OLD=7

mkdir -p "$ARCHIVE_DIR"

#Find and compress Logs older than 7 days

find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec gzip {} \;

#Move compressed Logs to Archive

find "$LOG_DIR" -type f -name "*.gz" -exec mv {} "$ARCHIVE_DIR" \;

echo "Log Cleanup and Archiving done at $(date)."

