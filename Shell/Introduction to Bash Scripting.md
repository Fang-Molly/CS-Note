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

	```
	~ % now_var='NOW'
  ~ % now_var_singlequote='$now_var'
	~ % echo $now_var_singlequote
	$now_var
	```

	* Double quotes ("sometext") = Shell interprets literally except using `$` and backticks
	
	```
	~ % now_var='NOW'
  ~ % now_var_singlequote="$now_var"
	~ % echo $now_var_singlequote
	NOW
	```
	
	* Backticks (`sometext`) = Shell runs the command and captures STDOUT back into a variable

	```
	~ % date
	Thu Apr  7 11:07:39 EDT 2022

	~ % rightnow_doublequote="The date is `date`."
	~ % echo $rightnow_doublequote
	The date is Thu Apr  7 11:08:10 EDT 2022.
	```

	* **Parentheses vs backticks**

	```
	~ % rightnow_parentheses="The date is $(date)."
	~ % echo $rightnow_parentheses
	The date is Thu Apr  7 11:09:58 EDT 2022.
	```
	
## 2.2 Numeric variables in Bash

* Numbers are not natively supported in the shell

```
~ % 1 + 4
zsh: command not found: 1
```

* `expr` is a useful utility program

```
~ % expr 1 + 4
5
```

* `expr` cannot handle decimal places

```
~ % expr 1 + 2.5
expr: not a decimal number: '2.5'
```

* `bc`: basic calculator, a useful command-line program
	* type 'quit' to quit bc

```
~ % bc
bc 1.06
Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 
5 + 7
12
1 + 2.5
3.5
quit
~ %
```

* Using `bc` without opening the calculator by piping

```
~ % echo "5 + 7.5" | bc
12.5
```

* `bc` has a `scale` argument for how many decimal places
	* Note the use of `;` to separate 'lines' in terminal

```
~ % echo "10 / 3" | bc
3
~ % echo "scale=3; 10 / 3" | bc
3.333
```

* Assign numeric variables like string variables, but there is no quotes around numeric variables

```
dog_name='Roger'
dog_age=6
echo "My dog's name is $dog_name and he is $dog_age years old"

My dog's name is Roger and he is 6 years old
```

* Double bracket notation
	* Beware this method uses `expr`, not `bc` (no decimals!)

```
~ % expr 5 + 7
12
~ % echo $((5 + 7))
12
```

* Shell within a shell

```
model1=87.65
model2=89.20
echo "The total score is $(echo "$model1 + $model2" | bc)"
echo "The average score is $(echo "($model1 + $model2) / 2" | bc)"
```

## 2.3 Arrays in Bash

* Two types of arrays in Bash
	* `Normal` numerical-indexed structure

* An array
	* Python: `my_list = [1, 3, 2, 4]`
	* R: `my_vector <- c(1, 3, 2, 4)`

* Creating an array in Bash
	* 







# 3. Control Statements in Bash Scripting

## 3.1 IF statements



## 3.2 FOR loops & WHILE statements

  

## 3.3 CASE statements





# 4. Functions and Automation

## 4.1 Basic functions in Bash


## 4.2 Arguments, return values, and scope



## 4.3 Scheduling your scripts with Cron














