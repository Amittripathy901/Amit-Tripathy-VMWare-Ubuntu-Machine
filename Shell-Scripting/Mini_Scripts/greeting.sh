#!/bin/bash

#Greeting Script:

#Goal: Greet the user with a personalized message based on the time of day (e.g., "Good morning," "Good afternoon," "Good evening").
#Concepts: date command, conditional statements (if, elif, else).

# Get the current user's name
user=$(whoami)

# Get the current hour in 24-hour format
time=$(date +"%H")

if [ "$time" -ge 5 ] && [ "$time" -le 12 ]; then
echo "Good Morning! , $user"

elif [ "$time" -ge 12 ] && [ "$time" -le 16 ]; then 
echo "Good Afternoon! , $user"

elif [ "$time" -ge 17 ] && [ "$time" -le 21 ]; then
echo "Good Evening!,$user"

else
echo "Good Night!, $user"

fi

