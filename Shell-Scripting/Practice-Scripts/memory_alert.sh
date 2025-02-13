#!/bin/bash

THRESOHOD=1
FREE_MEMORY=$(free -h | grep mem | awk '{print $3}')

if [ $FREE_MEMORY -gt  $THRESHOLD ];
then
echo "Memory Running Low"
else
echo "Memory is in optimal usage! "

fi


