#!/bin/bash

# Specify the directory containing the log files
LOG_DIR="$1" 

if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory '$LOG_DIR' does not exist."
  exit 1
fi

# Find all .log files in the directory and count lines in each
find "$LOG_DIR" -name "*.log" -exec wc -l {} + | awk '{ total += $1 } END { print "Total lines in all .log files:", total }'
