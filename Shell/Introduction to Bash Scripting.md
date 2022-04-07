Introduction to Bash Scripting
================================

# 1. From Command-Line to Bash Script

## 1.1 Introduction and refresher

* **Why Bash scripting? (Bash)**

  * Bash stands for "Bourne Again Shell" 
  * Developed in the 80's but a very popular shell today. Default in many Unix systems, Macs
  * Unix is the internet! (Running ML Models, Data Pipelines)
    * AWS, Google, Microsoft all have CLI's to their products

* **Why Bash scripting? (scripting)**
  * Ease of execution of shell commands (no need to copy-paste every time!)
  * Powerful programming constructs

* **A reminder of REGEX**

  * 'Regex' or regular expressions are a vital skill for Bash scripting

## 1.2 Your first Bashscript

* Bash script anatomy

	* It usually begins with `#!/usr/bash` (on its own line)
		* So your interpreter knows it is a Bash script and to use Bash located in `/usr/bash`
		* This could be a different path if you installed Bash somewhere else such as `/bin/bash` (type `which bash` to check)

	* Middle lines contain code
		* This may be line-by-line commands or programming constructs

	* To save and run

		* It has a file extension `.sh`
			* Technically not needed if first line has the she-bang(#!) and path to Bash, but a convertion
		* Can be run in the terminal using `bash script_name.sh`
			* Or if you have mentioned first line (#!/usr/bash) you can simply run using `./script_name.sh`

* Bash script example

	* eg.sh
	
	```
	#!/usr/bash
	echo "Hello world"
	echo "Goodbye world"
	```
	
	* run with `./eg.sh`

	```
	Hello world
	Goodbye world
	```
	
* Bash and shell commands

	* Each line of your Bash script can be a shell command
	* You can include pipes in your Bash scripts

	```
	#!/usr/bash
	cat animals.txt | cut -d " " -f 2 | sort | uniq -c
	```
	
## 1.3 Standard streams & arguments

* **STDIN-STDOUT-STDERR**

	* STDIN: standard input, a stream of data into the program
	* STDOUT: standard output,  a stream of data out of the program
	* STDERR: standard error, errors in your program

* **STDIN vs ARGV**

	* arguments: Bash scripts can take arguments to be used inside by adding a space after the script execution call
	* ARGV: the array of all the arguments given to the program
		* Each argument can be accessed via the `$`  notation. The first as `$1`, the second as `$2` etc
		* `$@` and `$*` give all the arguments in ARGV
		* `$#` gives the length (number) of arguments

* **ARGV example**

	* args.sh

	```
	#!/usr/bash
	echo $1
	echo $2
	echo $@
	echo "There are " $# "arguments"
	```

	* run the args.sh
	
	```
	bash args.sh one two three four five
	
	one
	two
	one two three four five
	There are 5 arguments
	```

# 2. Variables in Bash Scripting

## 2.1 Basic variables in Bash

* **Assigning variables**
	* Beware of adding spaces!

```
# assign variables with the equals notation
var1="Moon"

# reference with $ notation
echo $var1

Moon
```

```
var1 = "Moon"
echo $var1

zsh: command not found: var1
```

* **Assigning string variables**

```
firstname='Cynthia'
lastname='Liu'
echo "Hi there" $firstname $lastname

Hi there Cynthia Liu
```

```
# if you miss the $ notation - it isn't a variable!
firstname='Cynthia'
lastname='Liu'
echo "Hi there" firstname lastname

Hi there firstname lastname
```

* **Single, double, backticks**

	* Single quotes ('sometext') = Shell interprets what is between literally
	* Double quotes ("sometext") = Shell interprets literally except using `$` and backticks
	* Backticks (`sometext`) = Shell runs the command and captures STDOUT back into a variable











## 2.2 Numeric variables in Bash


## 2.3 Arrays in Bash




# 3. Control Statements in Bash Scripting

## 3.1 IF statements



## 3.2 FOR loops & WHILE statements

  

## 3.3 CASE statements





# 4. Functions and Automation

## 4.1 Basic functions in Bash


## 4.2 Arguments, return values, and scope



## 4.3 Scheduling your scripts with Cron














