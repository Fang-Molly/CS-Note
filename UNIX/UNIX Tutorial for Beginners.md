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

# 2 Basic Command line

## 2.1 Listing files and directories

* `ls` : lists the contents of your current working directory

* `ls -a` : lists files that are normally hidden

* `ls -l` : (long listing) lists contents of current directory with extra details

* `ls /home/user/*.txt` : lists all files in /home/user ending in .txt

## 2.2 Making Directories

* `mkdir directory` : makes a directory

* `touch file` : creates a file, not a directory. updates the timestamp on the file if it already exists, without modifying its contents

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

## 2.7 Removing files and directories

* `rm file` : remove/delete a file

* `rmdir directory` : remove a directory (make sure it is empty first)

* `rm -f file` : removes myfile without asking you for confirmation. useful if using wildcards to remove files ***

* `rm -rf directory` : delete directory mydir along with all its content without asking you for confirmation! ***

## 2.8 Displaying the contents of a file on the screen

* `clear` : clear screen, clear the terminal window of the previous commands so the output of the following commands can be clearly understood.

* `cat file` : concatenate, display the contents of a file on the screen

* `less file` : displays the contents of the file screen by screen. spacebar to pagedown, q to quit

* `more file` : displays the contents of the file screen by screen. spacebar to pagedown, q to quit

* `head file` : displays first 10 lines of the file

* `head -f new.txt` : displays the contents of a file as it grows, starting with the last 10 lines. ctrl-c to quit.

* `tail file` : displays last 10 lines of the file

* `tail -f new.txt` : displays the contents of a file as it grows, starting with the last 10 lines. ctrl-c to quit.

## 2.9 Searching the contents of a file

* `less file` `/ 'keyword'`

    * in less, type a forward slash [/] followed by the word to search
    * type[n] to search for the next occurrence of the word
    * type[q] to quit

* `grep 'keyword' file`

    * `grep science science.txt`, print out each line containing the word "science"
    * `-i` case sensitive; use the -i option to ignore upper/lower distinctions `grep -i science science.txt`
    * search for a phrase or pattern, enclose it in single quotes `grep -i 'spinning top' science.txt`
    * `-v` display those lines that do NOT match
    * `-n` precede each matching line with the line number
    * `-c` print only the total count of matched lines

* `wc file` : word count

    * `wc -w file` : count how many words
    * `wc -l file` : count how many lines

# 3 Redirecing standard streams

## 3.1 Redirection `command > file`

* `cat`
    * type `cat` without specifing a file to read
    * type a few words on the keyboard and press the [Return] key
    * hold the [Ctrl] key down and press [d] (written as ^D for short) to end the input

## 3.2 Redirecting the Output

* `cat > list`

```unix
# use the > symbol to redirect the output of a command
$ cat > list1
# type in the list contents, press [Return] after each one
pear
banana
apple
# ^D to end
# read the contents of the file
(base) prak01:unix fangliu$ cat list1
pear
banana
apple
```

## 3.3 Appending to a file `command >> file`

* The form >> appends standard output to a file

```
$ cat > list1
pear
banana
apple
$ cat list1
pear
banana
apple
$ cat > list2
orange
plum
mango
grapefruit
$ cat list2
orange
plum
mango
grapefruit
cat >> list1
peach
grape
orange
$ cat list1
pear
banana
apple
peach
grape
orange
cat list1 list2 > biglist
$ cat biglist
pear
banana
apple
peach
grape
orange
orange
plum
mango
grapefruit
```

## 3.4 Redirecting the Input `command < file`

* We use the < symbol to redirect the input of a command

* The command `sort` alphabetically or numerically sorts a list

```
$ sort < biglist
apple
banana
grape
grapefruit
mango
orange
orange
peach
pear
plum
$ sort < biglist > slist
$ cat slist
apple
banana
grape
grapefruit
mango
orange
orange
peach
pear
plum
```

## 3.5 Pipes `command1 | command2`

* The symbol for a pipe is the vertical bar '|'

# 4 

## 4.1 Wildcards

* The * wildcard : match against none or more character(s) in a file (or directory) name

* The ? wildcard : match exactly one character

## 4.2 Filename conventions

* only letters, numbers, underscore_, and dot.
* start with a lower-case letter
* avoid using the characters with special meanings such as / * & %
* avoid using spaces

## 4.3 Getting Help

* On-line Manuals : read the manual page for a particular command

    * `man command` : find out more about the command

    * `whatis command` : gives a one-line description of the command, but omits any information about options etc.
    
* Apropos : give you the commands with keyword in their manual page header

    * `apropos keyword`

# 5

## 5.1 File system security (access rights)

```
$ ls -l 2021*
-rw-r--r--@ 1 fangliu  staff  85488 Jul  8 10:32 2021_serum.txt
```
* Access rights on files
    * r (or -), indicates read permission, the presence or absence of permission to read and copy the file
    * w (or -), indicates write permission, the permission to change a file
    * x (or -), indicates execution permission, the permission to execute a file

* Access rights on directories
    * r allows users to list files in the directory;
    * w means that users may delete files from the directory or move files into it;
    * x means the right to access files in the directory. This implies that you may read files in the directory provided you have read permission on the individual files.

## 5.2 Changing access rights

* `chmod` : changing a file mode

|symbol |meaning             |
|:-----:|:------------------:|
|u      |user                |
|g      |group               |
|o      |other               |
|a      |all                 |
|r      |read                |
|w      |write               |
|x      |execute             | 
|+      |add permission      |
|-      |take away permission|

* `chmod go-rwx biglist` : remove read write and execute permissions on the file biglist for the group and others

* `chmod a+rw biglist` : give read and write permissions on the file biglist to all

## 5.3 Processes and Jobs

* `ps` : (prcess status) see information about your processes, with their associated PID and status

* Running background processes
    * `sleep 10 &` : 

* Backgrounding a current foreground process
    * `bg` : put the process in the backgroud

## 5.4 Listing suspended and background processes

* `jobs` : When a process is running, backgrounded or suspended, it will be entered onto a list along with a job number.

* `fg %jobnumber` : restart a suspended processes

## 5.5 Killing a process

* `kill` : terminate or signal a process
    * `kill %jobnumber`
   
* ^C : kill a job running in the foreground

```
$ sleep 1000 &
[7] 35542
$ ps
  PID TTY           TIME CMD
19589 ttys000    0:00.59 -bash
34624 ttys000    0:00.00 sleep 1000
35187 ttys000    0:00.00 sleep 1000
35542 ttys000    0:00.00 sleep 1000
$ kill 34624
[4]+  Terminated: 15          sleep 1000
```

# 6 Other useful UNIX commands

* `quota -v` : heck your current quota and how much of it you have used

* `df .` : find out how much space is left on the fileserver

* `du -s *` : outputs the number of kilobyes used by each subdirectory
    * The -s flag will display only a summary (total size)
    * The * means all files and directories

* `gzip`
    * `gzip file` : compress the file
    * `gunzip file` : expand the file

* `zcat`
    * `zcat file` : read gzipped files without needing to uncompress them first
    * `zcat file | less` 

* `file *` : report on all files in your home directory

* `diff` : compares the contents of two files and displays the differences.

* `find` : searches through the directories for files and directories
    * `find . -name "*.txt" -print`
    * `find . -size +1M -ls`

* `history` : show command history list
    * `!!` (recall last command)
    * `!-3` (recall third most recent command)
    * `!5` (recall 5th command in list)
    * `!grep` (recall last command starting with grep)
    * `set history=100`

# 7

## 7.1 Compiling UNIX software packages























