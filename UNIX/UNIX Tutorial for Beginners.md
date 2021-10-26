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

* `ls -lh` : show in human readable format the size fo the files

* `ls /home/user/*.txt` : lists all files in /home/user ending in .txt

## 2.2 Making Directories

* `mkdir directory` : makes an empty directory

* `touch file` : creates an empty file; updates the timestamp on the file if it already exists, without modifying its contents

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

* `cp directory1 -r directory2` : copy a whole folder and its content.

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
    * `-F` search a fixed string
    * `-f` using patterns specified in a file

* `wc file` : word count

    * `wc -w file` : count how many words
    * `wc -l file` : count how many lines

* `cut` : cutting out the sections from each line of files and writing the result to standard output

> `cut OPTION... [FILE]...`

    * `-b (--bytes=LIST)` - Select by specifying a byte or bytes.
    
```
$ cut -b 1,2,3 state.txt  # list without ranges
$ cut -b 1-3,5-7 state.txt  # list with ranges
$ cut -b 1- state.txt
$ cut -b -3 state.txt
```

    * `-c (--characters=LIST)` - Select by specifying a character or characters.
        * `$cut -c [(k)-(n)/(k),(n)/(n)] filename`
```
$ cut -c 2,5,7 state.txt
$ cut -c 1-7 state.txt
$ cut -c 1- state.txt
$ cut -c -5 state.txt
```
    
    * `-f (--fields=LIST)` - Select by specifying a field or fields. This is the most commonly used option.
        * `$cut -d "delimiter" -f (field number) file.txt`
```
$ cut -d " " -f 1 state.txt
$ cut -d " " -f 1-4 state.txt
```
    * -complement : complement the output
        
        * with `-f` : `cut --complement -d " " -f 1 state.txt`
        * with `-c` : `cut --complement -c 5 state.txt`

    * -output-delimiter : `cut -d " " -f 1,2 state.txt --output-delimiter='%'`
    
    * -version : `cut --version`
    
* `tr` : translate    `$ tr [OPTION] SET1 [SET2]`

    * convert lower case to upper case
        * `tr “[a-z]” “[A-Z]”`
        * `tr “[:lower:]” “[:upper:]”`

    * convert white-space to tabs
        * `tr [:space:] '\t'`

    * convert braces to parenthesis
        * `tr '{}' '()'`
        
    * -c : complements the set of characters in string.i.e., operations apply to characters not in the given set
        * `$ echo "my ID is 73535" | tr -cd [:digit:]` (remove all characters except digits)
    
    * -d : delete characters in the first set from the output.
        * `$ echo "Welcome To GeeksforGeeks" | tr -d 'w'`
        * `$ echo "my ID is 73535" | tr -d [:digit:]`
    
    * -s : squeeze repeated characters listed in the set1 with single occurrence
        * `$ echo "Welcome    To    GeeksforGeeks" | tr -s [:space:] ' '`
    
    * -t : truncates set1

* `awk` :  abbreviated from the names of the developers – Aho, Weinberger, and Kernighan

    * awk operations 
        * Scans a file line by line
        * Splits each input line into fields 
        * Compares input line/fields to pattern 
        * Performs action(s) on matched lines 

    * `awk options 'selection _criteria {action }' input-file > output-file`
    
    * prints every line of data from the specified file
```
$ awk '{print}' em*.txt
ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000
amit manager account 47000
tarun peon sales 15000
deepak clerk sales 23000
sunil peon sales 13000
satvik director purchase 80000 
```
    * Print the lines which matches with the given pattern. 
```    
$ awk '/manager/ {print}' em*.txt
ajay manager account 45000
varun manager sales 50000
amit manager account 47000
```
    * Splitting a Line Into Fields, ($0 is the whole line)
```    
$ awk '{print $1,$4}' employee.txt 
ajay 45000
sunil 25000
varun 50000
amit 47000
tarun 15000
deepak 23000
sunil 13000
satvik 80000
```


## 2.10 Replace the contents of a file

* `sed` : a stream editor, used to perform basic text transformations on an input stream.

* `sed SCRIPT INPUTFILE...`

```
# replace 'hello' to 'world'
sed 's/hello/world/' input.txt > output.txt
sed 's/hello/world/' < input.txt > output.txt
cat input.txt | sed 's/hello/world/' - > output.txt
```



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

```
$ echo "ATGTACTGACTGCATGCATGCCATGCA" > dna.txt
$ cat dna.txt
ATGTACTGACTGCATGCATGCCATGCA
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

* The pipe character is the vertical bar '|'
* Pipe is used to combine two or more commands

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
    
* `shuf` : writes a random permutation of the input lines to standard output. 

```
prak01:downloads fangliu$ seq 5
1
2
3
4
5
prak01:downloads fangliu$ seq 5 | shuf
4
2
3
5
1
```

* `uniq` : reports or filters out the repeated lines in a file

```
$cat kt.txt
I love music.
I love music.
I love music.

I love music of Kartik.
I love music of Kartik.

Thanks.

$uniq kt.txt
I love music.

I love music of Kartik.

Thanks.
```

* `curl` command 
    *  transfer data to or form a server, using any of the supported protocols(HTTP, FTP, IMAP, POP3, SCP, SFTP, SMTP, TFTP, TELNET, LDAP or FILE)
    * Syntax : `curl [options] [URL...]`
    * Options
        * `-o` : saves the downloaded file on the local machine with the name provided in the parameters. `curl -o hello.zip ftp://speedtest.tele2.net/1MB.zip`
        * 



# 7

## 7.1 Compiling UNIX software packages

* The steps to install software 

    * Locate and download the source code (which is usually compressed)
    * Unpack the source code
    * Compile the code
    * Install the resulting executable
    * Set paths to the installation directory

* Compiling Source Code

* `make` and the Makefile

* configure

    * The simplest way to compile a package is:

        * cd to the directory containing the package's source code.
        * Type ./configure to configure the package for your system.
        * Type make to compile the package.
        * type make check to run any self-tests that come with the package.
        * Type make install to install the programs and any data files and documentation.
        * type make clean to remove the program binaries and object files from the source code directory 

    * --help
    * --prefix
    * --exec-prefix

## 7.2 Downloading source code

## 7.3 Extracting the source code

# 8

## 8.1 UNIX Variables

* environment variables : have a farther reaching significance, and those set at login are valid for the duration of the session. UPPER CASE name!

* shell variables : apply only to the current instance of the shell and are used to set short-term working conditions. lower case names!

## 8.2 Environment Variables

* examples : 

    * OSTYPE
    * USER (your login name) 
    * HOME (the path name of your home directory)
    * HOST (the name of the computer you are using)
    * ARCH (the architecture of the computers processor)
    * DISPLAY (the name of the computer screen to display X windows)
    * PRINTER (the default printer to send print jobs)
    * PATH (the directories the shell should search to find a command)

* `echo` : print values to standard output   
    * `echo $OSTYPE`

* Finding out the current values of these variables

    * `setenv` : set the environment variables
    * `printenv` or `env` : display the environment variables
    * `unsetenv` : unset the environment variables

## 8.3 Shell variables

* examples :
    * history
    * cwd (your current working directory) 
    * home (the path name of your home directory)
    * path (the directories the shell should search to find a command)
    * prompt (the text string used to prompt for interactive commands shell your login shell)

* Finding out the current values of these variables
    * `set` : set and display the shell variables
    * `unset` : unset the shell variables

* What is the difference between PATH and path?



## 8.4 Using and setting variables

## 8.5 Setting shell variables in the .cshrc file

## 8.6 Setting tha path


# 9 Download files from repositories

* `wget file_address`

```
$ wget http://ftp.ensembl.org/pub/release-104/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.10.fa.gz
```
# 10 Manipulate files, piping, parsing, reformatting

* `grep`
```
grep ">" Homo_sapiens.GRCh38.dna.chromosome.10.fa > seq_names.txt
```

* `cut`

# 11. `printf` command

* `printf` :display the given string, number or any other format specifier on the terminal window

* syntax: `$printf [-v var] format [arguments]`

* Format Specifiers: The most commonly used printf specifiers are %s, %b, %d, %x and %f.

* `%s` specifier : It is basically a string specifier for string output.

```
$ printf "%s\n" "Hello, World!"
Hello, World!
```

* `%b` specifier : It is same as string specifier but it allows us to interpret escape sequences with an argument.

```
$ printf "%s\n" "Hello, World! \n" "From Geeks For Geeks\n"
Hello, World! \n
From Geeks For Geeks\n
$ printf "%b\n" "Hello, World! \n" "From Geeks For Geeks\n"
Hello, World! 

From Geeks For Geeks

% printf "%b\n" "Geeks" "for" "\nGeeks\n"
Geeks
for

Geeks

```

* `%d` specifier : It is an integer specifier for showing the integral values.

```
% printf "%d\n" "213" "109"
213
109
```

* `%f` specifier: It is used for output of floating point values.

```
% printf "%f\n" "1.32" "3.14"
1.320000
3.140000
```

* `%x` specifier: It is used for output of lowercase hexadecimal values for integers and for padding the output.

```
% printf "%08x\n" "1024"
00000400
```



