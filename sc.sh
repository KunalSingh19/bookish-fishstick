#!/bin/bash

# Check if the source directory is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"
HISTORY_FILE="file_history.txt"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Initialize the history file
echo "File Copy History" > "$HISTORY_FILE"
echo "=================" >> "$HISTORY_FILE"

# Counter for folder naming
folder_counter=1
file_counter=0

# Loop through each file in the source directory
for file in "$SOURCE_DIR"/*; do
    # Check if it's a file
    if [ -f "$file" ]; then
        # Create a new folder if we have 10 files already
        if [ $file_counter -eq 10 ]; then
            folder_counter=$((folder_counter + 1))
            file_counter=0
        fi

        # Create the destination folder
        DEST_FOLDER="$DEST_DIR/folder_$folder_counter"
        mkdir -p "$DEST_FOLDER"

        # Copy the file to the destination folder
        cp "$file" "$DEST_FOLDER/"

        # Log the file and its destination in the history file
        echo "$(basename "$file") -> $DEST_FOLDER" >> "$HISTORY_FILE"

        # Increment the file counter
        file_counter=$((file_counter + 1))
    fi
done

echo "File copying completed. Check '$HISTORY_FILE' for details."
