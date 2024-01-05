#!/bin/bash

# Function to get file extension
get_extension() {
    echo "${1##*.}"  # Extracts the extension from the filename
}

# Function to organize files
organize_files() {
    total_files=$(find "$SOURCE_DIR" -type f | wc -l)
    current_file=0

    for file in "$SOURCE_DIR"/*; do
        if [ -f "$file" ]; then
            ((current_file++))
            extension=$(get_extension "$file")

            case $extension in
                jpg|jpeg|png|gif)
                    mv "$file" "$IMAGE_DIR" ;;
                doc|docx)
                    mv "$file" "$DOCUMENT_DIR" ;;
		pdf)
                    mv "$file" "$PDF_DIR" ;;
		txt)
                    mv "$file" "$TEXT_DIR" ;;
		mkv|mp4)
                    mv "$file" "$VIDEO_DIR" ;;
		zip)
                    mv "$file" "$ZIP_DIR" ;;
		xlx|xlsx)
                    mv "$file" "$EXCEL_DIR" ;;
		exe)
                    mv "$file" "$EXE_DIR" ;;
		zip)
                    mv "$file" "$ZIP_DIR" ;;
		php|py)
                    mv "$file" "$PROGRAMS_DIR" ;;
                *)
                    mv "$file" "$OTHER_DIR" ;;
            esac

            # Calculate progress
            progress=$((current_file * 100 / total_files))
            echo "Progress: $progress% - File $current_file of $total_files organized..."
        fi
    done
}

# Predefined directories
SOURCE_DIR="C:\Users\User\Downloads"

IMAGE_DIR="C:\Users\User\Downloads/Images"
DOCUMENT_DIR="C:\Users\User\Downloads/Docs"
OTHER_DIR="C:\Users\User\Downloads/Others"
PROGRAMS_DIR="C:\Users\User\Downloads/Programs"
EXE_DIR="C:\Users\User\Downloads/Exe"
PDF_DIR="C:\Users\User\Downloads/Pdf"
EXCEL_DIR="C:\Users\User\Downloads/Excel"
TEXT_DIR="C:\Users\User\Downloads/Txt"
VIDEO_DIR="C:\Users\User\Downloads/Video"
ZIP_DIR="C:\Users\User\Downloads/Zip"

# Ensure destination directories exist
mkdir -p "$IMAGE_DIR" "$DOCUMENT_DIR" "$OTHER_DIR"

# Execute the file organization
organize_files

echo "File organization completed."
