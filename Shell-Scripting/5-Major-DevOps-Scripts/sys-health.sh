#!/bin/bash

#Script to check System Health - CPU , Memory , Disk Usage


set -e
 
#Check CPU Usage:
echo "== CPU USAGE (Top 5 Processes) =="
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
echo 

#Check memory usage

echo "==MEMORY USAGE=="
free -h
echo 

#Check Disk Usage
echo "==DISK USAGE=="
df -h | grep -E '^Filesystem|/dev/'
echo 

#Check system load average

echo "==SYSTEM LOAD AVERAGE=="
uptime
echo 

#If usage is too high, send an alert

CPU_THRESHOLD=80
CURRENT_CPU=$(ps -eo %cpu --sort=-%cpu | head -n 2 | tail -1 | awk '{print int($1)}')

if [ "$CURRENT_CPU" -gt "$CPU_THRESHOLD" ]; then
	echo "[ALERT] CPU usage is above ${CPU_THRESHOLD}%!"

fi

