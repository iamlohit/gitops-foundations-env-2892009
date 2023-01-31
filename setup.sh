!/bin/bash

# Get the argument as the replacement string
replacement=$1

# Find all files recursively from the current directory
find . -type f -print0 | while read -d $'\0' file
do
  # Check if the file has "{dockerHubUsername}" in it
  if grep -q -a -I "{dockerHubUsername}" "$file"; then
    # Replace "{dockerHubUsername}" with the argument
    sed -i "s/{dockerHubUsername}/$replacement/g" "$file"
  fi
done