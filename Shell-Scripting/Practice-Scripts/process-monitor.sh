#!/bin/bash

#Write a script that monitors the status of a list of processes and restarts them if they are not running.


#!/bin/bash

PROCESSES=("postfix" "apache2")
for PROCESS in "${PROCESSES[@]}"; do
    if ! pgrep -x "$PROCESS" > /dev/null; then
        echo "$(date) - $PROCESS is not running, restarting..." >> /var/log/process_monitor.log
        systemctl restart $PROCESS
    fi
done
