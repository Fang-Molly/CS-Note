# 1 Introduction to the UNIX Operating System

## 1.1 What is UNIX?

* an operating system
* fist developed in the 1960s
* have a graphical user interface(GUI)

## 1.2 Types of UNIX

* The most popular varieties of UNIX are Sun Solaris, GNU/Linux, and MacOS X.

## 1.3 The UNIX operating system

* The kernel

    * allocate time and memory to programs
    * handle the filestore and communications in response to system calls

* The shell

    * an interface between the user and the kernel
    * command line interpreter(CLI)

* The programs

## 1.4 Files and processes

* A process is an executing program identified by a unique PID (progress identifier)
* A file is a collection of data.

## 1.5 The Directory Structure

* root directory "/"

* The full path to the file report.doc is "/home/its/ug1/ee51vn/report.doc"

![image](https://user-images.githubusercontent.com/49796592/128805265-a6cd02dc-149a-480b-a088-83f3be278203.png)


## 1.6 Starting an UNIX terminal

# 2 Unix Command line

## 2.1 Listing files and directories

* `ls` : lists the contents of your current working directory

* `ls -a` : lists files that are normally hidden

* `ls -1` : lists contents of current directory with extra details

* `ls /home/user/*.txt` : lists all files in /home/user ending in .txt

## 2.2 Making Directories

* `mkdir mydir` : makes a directory called mydir

* `rmdir mydir` : removes directory called mydir. mydir must be empty

* `touch myfile` : creates a file called myfile, not a directory. updates the timestamp on the file if it already exists, without modifying its contents

## 2.3 Changing to a different directory

* `cd`  : change directory to your home directory

* `cd ~` : change directory to your home directory

* `cd /scratch/user` : change directory to user on scratch

* `cd .` : the current directory

* `cd ..` : the parent directory

* `cd -` : change directory to the last directory you were in before changing to wherever you are now

## 2.4 Pathnames

* `pwd` : (print working directory) display the path of the current directory

## 2.5 Copying Files

* `cp myfile1 myfile2` : copies myfile to myfile2. if myfile2 exists, this will overwrite it! doesn't work on directory!

## 2.6 Moving files

* `mv myfile newlocdir` : moves myfile into the destination directory newlocdir

* `mv myfile newname` : renames file to newname. if a file called newname exists, this will overwrite it!

* `mv dir subdir` : moves the directory called dir to the directory called subdir

* `mv dir newdirname` : renames directory dir to newdirname

## 2.7 Displaying the contents of a file on the screen

* `clear` : clear screen, clear the terminal window of the previous commands so the output of the following commands can be clearly understood.

* `cat` : concatenate, display the contents of a file on the screen

* `less` : writes the contents of a file onto the screen a page at a time

* `head` : writes the first ten lines of a file to the screen

* `tail` : writes the last ten lines of a file to the screen









