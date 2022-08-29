#!/bin/bash
#
# A little script to batch-rename files (and directories) by replacing a
# substring in their names.
#
# Created by Andrés Salinas Lima on 2020/07/05.

if [[ $# -ne 3 ]]; then
	echo "Usage: $0 path-to-file-or-folder \"original string\" \"replacement string\""
	exit
fi

# For a single file:
if [[ -f $1 ]]; then
	dir_name=$(dirname "$1")
    base_name=$(basename "$1")

    new_base_name=$(echo "$base_name" | sed "s/$2/$3/g")
    # This could also be done entirely with bash string manipulation:
    # new_base_name=${base_name//$2/$3}

    mv -i "$1" "$dir_name/$new_base_name"

# For entire directories:
elif [[ -d $1 ]]; then
    find "$1" -depth -name "*$2*" | while IFS= read -r f; do
        dir_name=$(dirname "$f")
        base_name=$(basename "$f")

        new_base_name=$(echo "$base_name" | sed "s/$2/$3/g")
        # This could also be done entirely with bash string manipulation:
        # new_base_name=${base_name//$2/$3}

        mv -i "$f" "$dir_name/$new_base_name"
    done

# Bad path:
else
    echo "ERROR: The entered path doesn't exist"
fi
