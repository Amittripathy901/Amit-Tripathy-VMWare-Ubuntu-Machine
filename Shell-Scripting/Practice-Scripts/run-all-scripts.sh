#!/bin/bash

# Directory containing the scripts
script_dir="/home/amittripathy/Desktop/Shell-Scripting/Practice-Scripts"  # **REPLACE THIS WITH THE ACTUAL PATH**

# Find all executable scripts in the directory
find "$script_dir" -type f -executable -print0 | while IFS= read -r -d $'\0' script_file; do
  echo "Running script: $script_file"

  # Execute the script
  "$script_file"  # Or bash "$script_file" if you want to explicitly use bash

  # Check the exit status of the script
  if [[ $? -eq 0 ]]; then
    echo "Script '$script_file' completed successfully."
  else
    echo "Script '$script_file' failed with exit status $?."
    # Optional: Exit the main script if any script fails
    # exit 1 
  fi

  echo "--------------------" # Separator between scripts
done

echo "Finished running all scripts."

exit 0
