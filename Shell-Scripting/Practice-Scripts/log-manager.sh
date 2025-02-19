#!/bin/bash

# Set the directory to clean up
LOG_DIR="/var/log" 

# Number of days to consider a log file "old"
DAYS_OLD=7

# Find and delete old log files
find "$LOG_DIR" -type f -mtime +"$DAYS_OLD" -delete
echo "$(date) - Removed logs older than 7 days " >> /var/log/old_logs.log

THRESHOLD=1000000

find $LOG_DIR -type f -size +${THRESHOLD}c -exec echo "Large log file: {}" \; | mail -s "Log File Size Alert" amit.pravuji@gmail.com
