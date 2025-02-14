#!/bin/bash

#Check uptime of a server and log the time is less than 24 hours

UPTIME=$(uptime -p | awk '{print $2}')

if [ "$UPTIME" -lt 24 ];
then
	echo "$(date) - Server uptime is less than 24 hours" >> /var/log/server_uptime.log
fi
