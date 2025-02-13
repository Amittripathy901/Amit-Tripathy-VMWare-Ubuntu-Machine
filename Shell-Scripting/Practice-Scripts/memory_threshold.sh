#!/bin/bash

THRESHOLD=20
FREE_MEMORY=$(free | grep Mem | awk '{print $4/$2 * 100.0}')

if (( $(echo "$FREE_MEMORY < $THRESHOLD" | bc -l) )); then
    echo "$(date) - Warning: Free memory is below threshold" | mail -s "Memory Alert" amittripathy.work@gmail.com 
fi
