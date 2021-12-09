How to rename files in terminal on Mac OSX
==========================================

# 1. `mv` command

## 1.1 rename a single file

```mv oldnamefile newnamefile```

```mv example.txt test.txt```

## 1.2 rename multiple files

* The `mv` command can only rename one file, but it can be used with other commands to rename multiple files.

```
# change all files in your directory from .txt extension to .pdf extension
for f in *txt; do
   mv -- "$f" "${f%.txt}.pdf"
done
```

# 2. `rename` command

```
# Install rename on Mac OSX
% brew install rename

# create a new folder
% mkdir rename
% cd rename

# create files
% touch file{1..5}.txt
% ls
file1.txt	file2.txt	file3.txt	file4.txt	file5.txt

# rename a single file
% rename 's/file1/newfile1/' file1.txt
% ls
file2.txt	file3.txt	file4.txt	file5.txt	newfile1.txt

# change the extension to all files
% rename 's/.txt/.php/' *.txt
% ls
file2.php	file3.php	file4.php	file5.php	newfile1.php

# convert filenames to uppercase
% rename 'y/a-z/A-Z/' *

# Convert filenames to lowercase
% rename 'y/A-Z/a-z/' *

# place spaces in filenames with underscores
% rename 'y/ /_/' *
```







