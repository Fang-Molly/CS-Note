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

## 2.3 How can I look at the start of a file?

* `head`: prints the first few lines of a file (where "a few" means 10)

## 2.4 How can I type less?

* tab completion
	* If you start typing the name of a file and then press the tab key, the shell will do its best to auto-complete the path. 
	* If the path is ambiguous, pressing tab a second time will display a list of possibilities. Typing another character or two to make your path more specific and then pressing tab will fill in the rest of the name.

## 2.5 How can I control what commands do?

* command-line flag (or just "flag" for short)

`head -n 3 seasonal/summer.csv`: only display the first three lines of the file

* A flag's name usually indicates its purpose

	* `-n` is meant to signal "number of lines"

* Command flags don't have to be a `-` followed by a single letter, but it's a widely-used convention.

* `tail -n +7 file`: display all but the first six lines of the file
* `tail -n 5 file`: display the last 5 lines of the file

## 2.6 How can I list everything below a directory?

* `ls -R`: shows every file and directory in the current level, then everything in each sub-directory

* `ls -R -F`: prints a / after the name of every directory and a * after the name of every runnable program. 
	* The order of the flags doesn't matter, but the directory name must come last.

## 2.7 How can I get help for a command?

* `man`: short for "manual", `man head`
	* `man` automatically invokes `less`, so you may need to press spacebar to page through the information and `:q` to quit.

## 2.8 How can I select columns from a file?

* `cut -f 2-5,8 -d , values.csv`: select columns 2 through 5 and columns 8, using comma as the separator
	* flag order doesn't matter
		* `-f`: meaning "fields", specify columns, `-f 1` is same as `-f1`
		* `-d`: meaning "delimiter", specify the separator

* `cut` is a simple-minded command. It doesn't understand quoted strings.

## 2.9 How can I repeat commands?

* `history`: print a list of commands you have run recently. Each one is preceded by a serial number to make it easy to re-run particular commands

	* `!55`: re-run the 55th command in your history
	* `!head`: re-run a command by typing an exclamation mark followed by the command's name


## 2.10 How can I select lines containing specific values?

* `grep`: selects lines according to what they contain

	* `grep bicuspid seasonal/winter.csv`: prints lines from winter.csv that contain "bicuspid".

* `grep`'s more common flags
	* `-c`: print a count of matching lines rather than the lines themselves
	* `-h`: do not print the names of files when searching multiple files
	* `-i`: ignore case (e.g., treat "Regression" and "regression" as matches)
	* `-l`: print the names of files that contain matches, not the matches
	* `-n`: print line numbers for matching lines
	* `-v`: invert the match, i.e., only show lines that don't match

* square parentheses are a matching set such as `[eyfv]`
	* `grep '[pc]' fruits.txt`


# 3. Combining tools

## 3.1 How can I store a command's output in a file?

* `>`: the greater-than sign tells the shell to redirect to save the command's output anywhere you want. `head -n 5 seasonal/summer.csv > top.csv`

## 3.2 How can I use a command's output as an input?

* Using redirection to combine commands

```
# display lines 3-5 
head -n 5 seasonal/winter.csv > top.csv
tail -n 3 top.csv
```

* Two drawbacks:
	* It leaves a lot of intermediate files lying around.
	* The commands to produce your final result are scattered across several lines of history.


## 3.3 What's a better way to combine commands?

* `pipe`: using the vertical bar `|`

`head -n 5 seasonal/summer.csv | tail -n 3`

`cut -d , -f 2 seasonal/summer.csv | grep -v Tooth`

`cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | head -n 1`

## 3.4 How can I count the records in a file?

* `wc`: short for "word count", prints the number of characters, words, and lines in a file.

	* `-c`: for characters
	* `-w`: for words
	* `-l`: for lines

`grep 2017-07 seasonal/spring.csv | wc -l`

## 3.5 How can I specify many files at once?

`cut -d , -f 1 seasonal/winter.csv seasonal/spring.csv seasonal/summer.csv seasonal/autumn.csv`

* wildcards: specify a list of files with a single expression

	* `*`: match zero or more characters, `cut -d , -f 1 seasonal/*` or `cut -d , -f 1 seasonal/*.csv`
	* `?`: matches a single character
		* `201?.txt` will match `2017.txt` or `2018.txt`, but not `2017-01.txt`
	* `[...]`: matches any one of the characters inside the square brackets
		* `201[78].txt` matches `2017.txt` or `2018.txt`, but not `2016.txt`.
	* `{...}`: matches any of the comma-separated patterns inside the curly brackets
		* `{*.txt, *.csv}` matches any file whose name ends with `.txt` or `.csv`, but not files whose names end with `.pdf`

## 3.6 How can I sort lines of text?

* `sort`: by default it does this in ascending alphabetical order
	* `-n`: sort numerically
	* `-r`: reverse the order of its output
	* `-b`: ignore leading blanks
	* `-f`: fold case (i.e., be case-insensitive) 
	
`cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | sort -r`

## 3.7 How can I remove duplicate lines?

* `uniq`: remove duplicated lines

	* `uniq -c`: display unique lines with a count of how often each occurs

`cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort | uniq -c`

## 3.8 How can I save the output of a pipe?

* put redirection at the front of a pipeline

`> result.txt head -n 3 seasonal/winter.csv`

## 3.9 How can I stop a running program?

* `Ctrl` + `C`
	* written `^C`
	* `C` can be lowercase

# 4. Batch processing

## 4.1 How does the shell store information?

* shell stores information in variables

	* environment variables: are available all the time. Their names are conventionally written in upper case.

|Variable	|Purpose	                        |Value                |
|:-------:|:-------------------------------:|:-------------------:|
|`HOME`	  |User's home directory            |	`/home/repl`        |
|`PWD`	  |Present working directory	      |Same as `pwd` command|
|`SHELL`	|Which shell program is being used|`/bin/bash`          |
|`USER`	  |User's ID                        |`repl`               |

* `set`: get a complete list of environment variables

`set | grep HISTFILESIZE`

## 4.2 How can I print a variable's value?

* `echo`: A simpler way to find a variable's value 
* `echo $X`: get the value of a variable

```
# print its arguments
$ echo hello DataCamphello DataCamp!
hello DataCamp!
# print the variable's name
$ echo USER
USER
# print the variable's value
$ echo $USER
repl
```

## 4.3 How else does the shell store information?

* shell variable: like a local variable in a programming language

```
# create a shell variable, assign a value to a name, without any spaces before or after the `=` sign
training=seasonal/summer.csv

# check the variable's value
echo $training
seasonal/summer.csv

# get the first line 
$ head -n 1 $training
```

## 4.4 How can I repeat a command many times?

* loop: repeat commands many times

	* The structure is `for` …variable… `in` …list… `; do` …body… `; done`

```
$ for filetype in gif jpg png; do echo $filetype; done

gif
jpg
png
```

## 4.5 How can I repeat a command once for each file?

```
for filename in seasonal/*.csv; do echo $filename; done

seasonal/autumn.csv
seasonal/spring.csv
seasonal/summer.csv
seasonal/winter.csv
```

## 4.6 How can I record the names of a set of files?

```
datasets=seasonal/*.csv
for filename in $datasets; do echo $filename; done
```

## 4.7 How can I run many commands in a single loop?

`for file in seasonal/*.csv; do head -n 2 $file | tail -n 1; done`


## 4.8 Why shouldn't I use spaces in filenames?

`mv 'July 2017.csv' '2017 July data.csv'`


# 5. Creating new tools

## 5.1 How can I edit a file?

* `nano`: `nano filename`, it will open filename for editing (or create it if it doesn't already exist). 

	* arrow keys: move around
	* backspace: delete characters
	* `Ctrl` + `K`: delete a line, cut the line
	* `Ctrl` + `U`: un-delete a line, paste the line
	* `Ctrl` + `O`: save the file ('O' stands for 'output'). You will also need to press Enter to confirm the filename!
	* `Ctrl` + `X`: exit the editor

## 5.2 How can I record what I just did?

```
$ cp seasonal/spring.csv seasonal/summer.csv ~
$ > temp.csv grep -h -v Tooth spring.csv summer.csv
# keep a record
$ > steps.txt history | tail -n 3
```

## 5.3 How can I save commands to re-run later?

* `.sh` file: put the command in a file
	* `headers.sh`: `head -n 1 seasonal/*.csv`

* Run the `.sh` file using `bash`
	* `bash headers.sh`

```
# create a .sh file 
$ nano dates.sh
# use bash to run the file
$ bash dates.sh
```

## 5.4 How can I re-use pipes?

* shell script: a file full of shell commands, don't have to have names ending in `.sh`

* all-dates.sh: `cut -d , -f 1 seasonal/*.csv | grep -v Date | sort | uniq`

	* `bash all-dates.sh > dates.out`

## 5.5 How can I pass filenames to scripts?

* `$@`: dollar sign followed by at-sign, to mean "all of the command-line parameters given to the script".

* unique-lines.sh: contains `sort $@ | uniq`

```
# the shell replaces $@ with seasonal/summer.csv and processes one or two files
bash unique-lines.sh seasonal/summer.csv
bash unique-lines.sh seasonal/summer.csv seasonal/autumn.csv
```

## 5.6 How can I process a single argument?

* `$1`, `$2`: refer to specific command-line parameters

* column.sh: `cut -d , -f $2 $1`
	* `$1`: the first parameter, filename
	* `$2`: the second parameter, column
	* run: `bash column.sh seasonal/autumn.csv 1`

## 5.7 How can I write loops in a shell script?

```
# Print the first and last data records of each file.
# You can write them using semi-colons, or split them across lines without semi-colons to make them more readable

for filename in $@
do
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done
```





