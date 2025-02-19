#!/bin/bash


#Check Disk space on Multiple Servers and alert threshold exceeding 80 percent

SERVERS=("server1" "server2")
THRESHOLD=80

for SERVER in "${SERVERS[@]}"; do
	DISK_USAGE=$(ssh user@"$SERVER" "df / | grep '/' | awk '{print \$5}' | sed 's/%//g'")
	if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
		echo "$(date) - $SERVER disk usage is above threshold: ${DISK_USAGE}%" | mail -s "Disk Space Alert" user@example.com
	fi
done

