# Rename-Replace Script

A little Bash script to batch-rename files (and directories) by replacing a substring in their names.

This can be useful to, for example, remove spaces from your filenames by replacing them with a dash or an underscore.

## Usage

`$ ./rename-replace.sh path "original substring" "replacement substring"`

* `path` can be either a file or a directory. If it is a directory, all the files and directories it contains will be renamed recursively.

## Installation

1. (optional) Create your personal bin directory to store your executables at `~/bin` and make sure it's included in your PATH. Otherwise you can simply place them in `/usr/local/bin/`.
2. Move `rename-replace.sh` to your personal bin directory (or create a link to it) and rename it to `rename-replace`.
4. Make sure it has execution permissions.
5. You can now call it from anywhere in your system!


## Demo

```
$ tree
.
├── file with spaces.txt
└── directory with spaces
    └── file with spaces copy.txt

1 directory, 2 files


$ rename-replace . " " "-"
Renaming "./directory with spaces/file with spaces copy.txt"
      to "./directory with spaces/file-with-spaces-copy.txt"
Renaming "./directory with spaces"
      to "./directory-with-spaces"
Renaming "./file with spaces.txt"
      to "./file-with-spaces.txt"


$ rename-replace . "with" "without"
Renaming "./file-with-spaces.txt"
      to "./file-without-spaces.txt"
Renaming "./directory-with-spaces/file-with-spaces-copy.txt"
      to "./directory-with-spaces/file-without-spaces-copy.txt"
Renaming "./directory-with-spaces"
      to "./directory-without-spaces"
      
      
$ tree
.
├── file-without-spaces.txt
└── directory-without-spaces
    └── file-without-spaces-copy.txt

1 directory, 2 files
```
