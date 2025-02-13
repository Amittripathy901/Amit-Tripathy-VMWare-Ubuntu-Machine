#!/bin/bash

#File Extension Changer:

#Goal: Rename files in a directory by changing their extension (e.g., from .txt to .bak).
#Concepts: for loops, string manipulation (parameter expansion).

#Check if the user provided two arguments (old ext and new ext)

if [ "$#" -ne 2 ];then
   echo "Usage: $0 <old_extension> <new_extension>"
   exit 1
fi


#Assign arguments to variable
old_ext=$1
new_ext=$2

#Loop through files with old extension

for file in *."$old_ext";
 do

 #check if files exist with given extension
 [ -e "$file" ] || continue

 #Extract filename without extension
 base_name="${file%.*}"

 #construct new file name with new extension
 new_file="${base_name}.${new_ext}"

 #Rename the file
 mv "$file" "$new_file"

 echo "Renamed: $file -> $new_file"

done

echo "Extension change completed."