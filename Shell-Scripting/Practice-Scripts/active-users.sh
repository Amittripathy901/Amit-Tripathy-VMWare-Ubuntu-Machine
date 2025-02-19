#!/bin/bash

#Script to fetch active users logged in the system

users=$(who)
DATE=$(date "+%Y-%m-%d %H:%M:%S")


echo "--------------------------------------------------"
echo "Active Users Report"
echo "Date: $DATE"
echo "--------------------------------------------------"

echo "$users \n"

echo "--------------------------------------------------"
echo "End of Report"
echo "--------------------------------------------------"



