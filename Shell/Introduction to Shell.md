Introduction to Shell
======================

# 1. Manipulating files and directories

## 1.1 How does the shell compare to a desktop interface?

* graphical file explorer: translates clicks and double-clicks into commands to open files and run programs

* command-line shell: people typed instructions into a program

## 1.2 Where am I

* filesystem: manages files and directories (or folders)
* absolute path: shows how to reach it from the filesystem's root directory `/home/repl`; An absolute path is like a latitude and longitude: it has the same value no matter where you are. 
* `/`: root directory 
* `/home`: home directory
* `~`: the tilde character, means "your home directory"
* `/tmp`: where people and programs often keep files they only need briefly

* `pwd` : short for "print working directory", prints the absolute path of your current working directory

## 1.3 How can I identify files and directories?

* `ls` : short for "listing", lists the contents of your current directory `ls /home/repl`

* relative path: specifies a location starting from where you are

* The shell decides if a path is absolute or relative by looking at its first character: 
	* If it begins with /, it is absolute. 
	* If it does not begin with /, it is relative.

## 1.4 How can I move to another directory?

* `cd`: stands for "change directory"

## 1.5 How can I move up a directory?

* The parent of a directory is the directory above it

* `..`: (two dots with no spaces) means "the directory above the one I'm currently in"
* `cd ..`: moves you up to the parent of a directory

* `.`: A single dot on its own, means "the current directory"
* `ls .`: do the same thing as `ls` on its own
* `cd .`: has no effect

* `~`: the tilde character, means "your home directory"
* `ls ~`: No matter where you are, always list the contents of your home directory
* `cd ~`: take you home

## 1.6 How can I copy files?

* `cp` : short for "copy"

```
# create a copy of the file
# If there already was a file called duplicate.txt, it is overwritten
cp original.txt duplicate.txt

# If the last parameter to cp is an existing directory
cp seasonal/autumn.csv seasonal/winter.csv backup
```

## 1.7 How can I move a file?

* `mv`: short for "move", `mv autumn.csv winter.csv ..`

* Rename the file

```
# overwrite existing files, rename the first name
mv course.txt old-course.txt
```
## 1.8 How can I delete files?

* `rm`: short for "remove", you can delete many files one time `rm thesis.txt backup/thesis-2017-08.txt`
* the shell doesn't have a trash can, we can't get the deleted files back any more.

## 1.9 How can I create and delete directories?

* `mv` treats directories the same way it treats files
* `rm` only remove files, can't remove directories
* `rmdir` remove the empty directories. You must delete the files in a directory before you delete the directory.
* `mkdir` create a new empty directory

# 2. Manipulating data

## 2.1 How can I view a file's contents?

* `cat`: short for "concatenate", prints the contents of files onto the screen
`cat agarwal.txt`

## 2.2 How can I view a file's contents piece by piece?

* `more`: page the output
* `less`: one page is displayed at a time; you can press spacebar to page down or type q to quit.
	* If you give less the names of several files, you can type 
		* :n (colon and a lower-case 'n') to move to the next file
		* :p to go back to the previous one
		* :q to quit.


































