#!/bin/bash

#Small Script to test network connectivity

host="google.com"

log="/var/log/network-connectivity.log"

ping -c 4 $host &> /dev/null

if [ $? -eq 0 ];
then
echo "Netowork Available!" 
else
echo "$(date) -> Network Unreachable! Try Again!" >> $log

fi

