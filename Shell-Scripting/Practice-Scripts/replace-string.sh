#!/bin/bash

#Replace a specific word in each sentence in each file.

#Prompt user for the current word and the replacement word
read -p "Enter the word to be replaced: " currentWord
read -p "Enter the replacement word: " newWord


#Loop through all files and replace occurences
for file in file{1..5}.txt ; 
do
	if [ -f "$file" ];
	then
		sed -i "s/${currentWord}/${newWord}/g" "$file"
		echo "Updated $file: replaced '$currentWord' with '$newWord'."
	else
		echo "File $file does not exist!."
	fi
done
