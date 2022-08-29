#!/bin/bash
#
# A little Bash script to batch-rename files (and directories) by replacing a
# substring in their names.
#
# Created by Andrés Salinas Lima on 2020/07/05.
# Complete rewrite by Andrés Salinas Lima on 2022/08/29.



#######################################
# Rename a file/directory by replacing a substring in its name.
# Arguments:
#   $1: file path
#   $2: original substring
#   $3: replacement substring
#######################################
function rename_file() {
    path=$(dirname "$1")
    filename_with_extension=$(basename "$1")
    filename="${filename_with_extension%.*}"
    extension="${filename_with_extension##*.}"

    # Only if the filename actually contains the string
    if [[ "$filename" == *"$2"* ]]; then
        if [[ "$extension" == "$filename" ]]; then
            # To avoid problems with files without extension / directories
            dot_extension=""
        else
            dot_extension=".""$extension"
        fi

        # Perform the substring substitution
        new_filename=${filename//$2/$3}

        echo "Renaming \"$1\""
        echo "      to \"$path/$new_filename$dot_extension\""

        mv -i "$1" "$path/$new_filename$dot_extension"
    fi
}



# Check command line arguments
if [[ $# -ne 3 ]]; then
    echo "ERROR: 3 arguments needed"
    echo "Usage: $0 path-to-file-or-directory \"original substring\" \"replacement substring\""
    exit
fi

# A single file
if [[ -f $1 ]]; then
    rename_file "$1" "$2" "$3"

# An entire directory
elif [[ -d $1 ]]; then
    # Recursively find files/directories (using depth first method) containing $2 (and ignoring hidden files)
    find "$1" -depth -name "*$2*" -not -path '*/.*' | while IFS= read -r file; do
        rename_file "$file" "$2" "$3"
    done

# Bad path
else
    echo "ERROR: The entered path doesn't exist"
fi
