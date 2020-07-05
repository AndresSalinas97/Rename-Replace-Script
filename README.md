# Rename-replace Script

A little script to batch-rename files (and directories) by replacing a substring in their names.

This can be useful to, for example, remove spaces from your filenames by replacing them with a dash or underscore.



## Usage

`./rename-replace.sh path "original string" "replacement string"`

* `path` can be either a file or a directory. If it is a directory, all the files and directories it contains will be renamed.



### Example

```
MacBook-Pro-ASL:test andres$ tree
.
├── file\ with\ spaces
└── folder\ with\ spaces
    └── file\ with\ spaces

1 directory, 2 files
MacBook-Pro-ASL:test andres$ rename-replace . " " "-"
MacBook-Pro-ASL:test andres$ tree
.
├── file-with-spaces
└── folder-with-spaces
    └── file-with-spaces

1 directory, 2 files
MacBook-Pro-ASL:test andres$ 
```
