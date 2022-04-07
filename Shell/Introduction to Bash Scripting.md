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
	
	```bash
	#!/usr/bash
	echo "Hello world"
	echo "Goodbye world"
	```
	
	* run with `./eg.sh`

	```bash
	Hello world
	Goodbye world
	```
	
* Bash and shell commands

	* Each line of your Bash script can be a shell command
	* You can include pipes in your Bash scripts

	```bash
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

	```bash
	#!/usr/bash
	echo $1
	echo $2
	echo $@
	echo "There are " $# "arguments"
	```

	* run the args.sh
	
	```bash
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

```bash
# assign variables with the equals notation
var1="Moon"

# reference with $ notation
echo $var1

Moon
```

```bash
var1 = "Moon"
echo $var1

zsh: command not found: var1
```

* **Assigning string variables**

```bash
firstname='Cynthia'
lastname='Liu'
echo "Hi there" $firstname $lastname

Hi there Cynthia Liu
```

```bash
# if you miss the $ notation - it isn't a variable!
firstname='Cynthia'
lastname='Liu'
echo "Hi there" firstname lastname

Hi there firstname lastname
```

* **Single, double, backticks**

	* Single quotes ('sometext') = Shell interprets what is between literally

	```bash
	~ % now_var='NOW'
  	~ % now_var_singlequote='$now_var'
	~ % echo $now_var_singlequote
	$now_var
	```

	* Double quotes ("sometext") = Shell interprets literally except using `$` and backticks
	
	```bash
	~ % now_var='NOW'
  	~ % now_var_singlequote="$now_var"
	~ % echo $now_var_singlequote
	NOW
	```
	
	* Backticks (`sometext`) = Shell runs the command and captures STDOUT back into a variable

	```bash
	~ % date
	Thu Apr  7 11:07:39 EDT 2022

	~ % rightnow_doublequote="The date is `date`."
	~ % echo $rightnow_doublequote
	The date is Thu Apr  7 11:08:10 EDT 2022.
	```

	* **Parentheses vs backticks**

	```bash
	~ % rightnow_parentheses="The date is $(date)."
	~ % echo $rightnow_parentheses
	The date is Thu Apr  7 11:09:58 EDT 2022.
	```
	
## 2.2 Numeric variables in Bash

* Numbers are not natively supported in the shell

```bash
~ % 1 + 4
zsh: command not found: 1
```

* `expr` is a useful utility program

```bash
~ % expr 1 + 4
5
```

* `expr` cannot handle decimal places

```bash
~ % expr 1 + 2.5
expr: not a decimal number: '2.5'
```

* `bc`: basic calculator, a useful command-line program
	* type 'quit' to quit bc

```bash
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

```bash
~ % echo "5 + 7.5" | bc
12.5
```

* `bc` has a `scale` argument for how many decimal places
	* Note the use of `;` to separate 'lines' in terminal

```bash
~ % echo "10 / 3" | bc
3
~ % echo "scale=3; 10 / 3" | bc
3.333
```

* Assign numeric variables like string variables, but there is no quotes around numeric variables

```bash
dog_name='Roger'
dog_age=6
echo "My dog's name is $dog_name and he is $dog_age years old"

My dog's name is Roger and he is 6 years old
```

* Double bracket notation
	* Beware this method uses `expr`, not `bc` (no decimals!)

```bash
~ % expr 5 + 7
12
~ % echo $((5 + 7))
12
```

* Shell within a shell

```bash
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
	* Declare without adding elements `declare -a my_first_array`
	* Create and add elements at the same time `my_first_array=(1 2 3)
		* No spaces around equals sign!
		* Commas are not used to separate array elements in Bash

* Important array properties

	* `array[@]`: return all array elements. Bash requires curly brackets {} around the array name
	
	```bash
	~ % my_array=(1 3 5 2)
	~ % echo ${my_array[@]}
	1 3 5 2
	```
	
	* `#array[@]`: return the length of an array

	```bash
	~ % echo ${#my_array[@]}
	4
	```

* **Manipulating array elements**

	* Accessing array elements using square brackets
		* Bash uses zero-indexing for arrays like Python (but unlike R)
	
	```bash
	~ % my_first_array=(15 20 300 42)
	~ % echo ${my_first_array[2]}
	300
	```

	* Set array elements using the index notation
		* Don't use the $ when overwriting an index
	
	```bash
	~ % my_first_array=(15 20 300 42 23 2 4 33 54 67 66)
	~ % my_first_array[0]=999
	~ % echo ${my_first_array[0]}
	```
	* `array[@]:N:M`: slice out a subset of the array
		* N: the starting index
		* M: how many elements to return
	
	```bash
	~ % my_first_array=(15 20 300 42 23 2 4 33 54 67 66)
	~ % echo ${my_first_array[@]:3:2}
	42 23
	```

	* `array+=(elements)`: Appending to arrays

	```bash
	~ % my_array=(300 42 23 2 4 33 54 67 66)                 
	~ % my_array+=(10)
	~ % echo ${my_array[@]}
	300 42 23 2 4 33 54 67 66 10
	```

	* If you don't add parentheses around what you want to append, the string will just be added to the first element

	```bash
	~ % my_array=(300 42 23 2 4 33 54 67 66)                 
	~ % my_array+=10
	~ % echo ${my_array[@]}
	30010 42 23 2 4 33 54 67 66
	```
	
* **Associative arrays**

	* Similar to a normal array, but with key-value pairs, not numerical indexes
	* Similar to Python's dictionary or R's list
		* Python: `my_dict = {'city_name': "New York", 'population': 14000000}`
		* R: `my_list =list(city_name =c('New York'), population =c(14000000))`
	* Only available in Bash 4 onwards, check bash version by `bash --version`
	
* **Creating an associative array**

	* Using declare syntax (and uppercase `-A`)
	* Declare first, then add elements or do it all on one line
		* Surround 'key' in square brackets, then associate a value after the equals sign.
			* You may add multiple elements at once

```bash
# Declare
declare -A city_details  
# Add elements
firstcity_details=([city_name]="New York" [population]=14000000) 
# Index using key to return a value
echo ${city_details[city_name]} 
```

```bash
# add multiple elements on one line
declare -A city_details=([city_name]="New York" [population]=14000000)
# Return all the keys with an `!`
echo ${!city_details[@]} 
```

# 3. Control Statements in Bash Scripting

## 3.1 IF statements

* **A basic IF statement**
	* Spaces between square brackets and conditional elements inside (first line)
	* Semi-colon after close-bracket `];`

```bash
if [ CONDITION ]; then
	# SOME CODE
else
	# SOME OTHER CODE
fi
```

* Do a basic string comparison in an IF statement

```bash
x="Queen"
if [ $x == "King" ]; then
	echo "$x is a King!"
else
	echo "$x is not a King!"
fi
```

* Arithmetic IF statements

	* use the double-parenthesis structure

	```bash
	x=10
	if (($x > 5)); then
		echo "$x is more than 5!"
	fi
	```
	
	* use square brackets and an arithmetic flag
		* `-eq`: equal to
		* `-ne`: not equal to
		* `-lt`: less than
		* `-le`: less than or equal to
		* `-gt`: greater than
		* `-ge`: greater than or equal to

	```bash
	x=10
	if [ $x -gt 5 ]; then
		echo "$x is more than 5!"
	fi
	```

* Other Bash conditional flags

	* `-e`: if the file exists
	* `-s`: if the file exists and has size greater than zero
	* `-r`: if the file exists and is readable
	* `-w`: if the file exists and is writable

* **Using AND and OR in Bash**

	* `&&`: AND
	* `||`: OR

```bash
x=10
if [ $x -gt 5 ] && [ $x -lt 11 ]; then    
	echo "$x is more than 5 and less than 11!"
fi
```

```bash
x=10
if [[ $x -gt 5 && $x -lt 11 ]]; then
	echo "$x is more than 5 and less than 11!"
fi
```

* IF and command-line programs
	* removing the square brackets

```bash
if grep -q Hello words.txt; then    
	echo "Hello is inside!"
fi
```

```bash
if $(grep -q Hello words.txt); then    
	echo "Hello is inside!"
fi
```

## 3.2 FOR loops & WHILE statements

* Basic FOR Loop structure

	* In Python:
	
	```python
	for x in range(3):
		print(x)
	```
	
	* In R:
	
	```R
	for (x in seq(3)){
		print(x)
	}
	```
	
	* In Bash:
	
	```bash
	for x in 1 2 3
	do
		echo $x
	done
	```
	
* FOR Loop number ranges

	* brace expasion: `{start..stop..increment}`
	
```bash
for x in {1..5..2}
do
	echo $x
done

1
3
5
```

* FOR Loop three expression syntax

	* Surround three expressions with double parenthesis
	* The first part is the start expression (x=2)
	* The middle part is the terminating condition (x<=4)
	* The end part is the increment (or decrement) expression (x+=2)
	
```bash
for ((x=2;x<=4;x+=2))
do
	echo $x
done
```
	
* Glob expansions: pattern-matching expansions

```bash
for book in books/*
do
	echo $book
done
```

* Shell-within-a-shell to FOR Loop

```bash
for book in $(ls books/ | grep -i 'air')
do
	echo $book
done
```

* **WHILE statement syntax**

```bash
x=1
while [ $x -le 3 ];
do
	echo $x
	((x+=1))
done
```

## 3.3 CASE statements

* **Basic CASE statement format**
	* Begin by selecting which variable or string to match against
	* Add as many possible matches & actions as you like
	* Ensure to separate the pattern and code to run by a close-parenthesis and finish commands with double semi-colon
	* `*) DEFAULT COMMAND;;`: not required, common to finish with a default command that runs if none of the other patterns match
	* `esac`: 'case' spelled backwards

```bash
case 'STRINGVAR' in
	PATTERN1)
	COMMAND1;;
	PATTERN2)
	COMMAND2;;
	*)
	DEFAULT COMMAND;;
esac
```

```bash
if grep -q 'sydney' $1; then    
	mv $1 sydney/
fi

if grep -q 'melbourne|brisbane' $1; then    
	rm $1
fi

if grep -q 'canberra' $1; then    
	mv $1 "IMPORTANT_$1"
fi
```

```bash
case $(cat $1) in
	*sydney*)
	mv $1 sydney/ ;;
	*melbourne*|*brisbane*)
	rm $1 ;;
	*canberra*)
	mv $1 "IMPORTANT_$1 ;;
	*)
	echo "No cities found" ;;
esac
```

# 4. Functions and Automation

## 4.1 Basic functions in Bash

* **Bash function anatomy**
	* Start by naming the function 
	* Add open and close parenthesis after the function name
	* Add the code inside curly brackets

```bash
function_name(){
	#function_code
	return #something
}
```

* Alternate Bash function structure
	* Use the word "function" to denote starting a function build
	* You can drop the parenthesis on the opening line if you like, though many people keep them by convention

```bash
function function_name {
	#function_code
	return #something
}
```

* Calling a Bash function

```bash
function print_hello() {
	echo "Hello world!"
}

print_hello

Hello world!
```

* Fahrenheit to Celsius Bash function

```bash
temp_f=30
function convert_temp () {
	temp_c=$(echo "scale=2; ($temp_f - 32) * 5 / 9" | bc)
	echo $temp_c
}
```

## 4.2 Arguments, return values, and scope

* Passing arguments into Bash functions

```bash
function print_filename {
    echo "The first file was $1"
    for file in $@
    do
        echo "This file has name $file"
    done
}
print_filename "LOTR.txt" "mod.txt" "A.py"
```








## 4.3 Scheduling your scripts with Cron














