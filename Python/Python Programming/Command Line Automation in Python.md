Command Line Automation in Python
=================================

# 1. IPython shell commands

## 1.1 Learn the Python interpreter

* **Three Laws of Automation**

	* Any task that is talked about being automated, will eventually be automated
	* If it isn't automated it is broken
	* If a human is doing it, a machine eventually will do it better

* **Using IPython with shell commands**

	* IPython: execute shell commands directly from within the IPython terminal, don't need to switch between multiple windows.
	
	* Install IPython: `pip3 install ipython`
	
	* The `!` syntax executes shell commands: `!ls`, `!pwd`


* **Capturing output from IPython shell commands**

	* Output of command can be assigned to a variable, the type is an SList
	
	```
	In [1]: ls = !ls

	In [2]: type(ls)
	Out[2]: IPython.utils.text.SList
	```
	
* **Passing programs to the Python interpreter**

	* Passing a script to the Python interpreter
	
	```
	python hellp.py
	```
	
	* Passing a program to the Python interpreter via `-c`

	```
	python -c "import datetime; print(datetime.datetime.utcnow())"
	```
	
	```
	In [1]: !python -c "import datetime; print(datetime.datetime.utcnow())"
	2022-07-21 19:48:49.767378
	```

## 1.2 IPython shell commands

* **Understand Unix Pipes**

```
# count the size of python files
# sum them up using `awk`
ls -l | awk '{ SUM+=$5} END {print SUM}'
8040

# pipe multiple outputs using Pipe operators
ls -l | grep .py | awk '{ SUM+=$5} END {print SUM}'
3776
```

* **Capturing shell output with bash magic function**

	* Magic function `%%bash --out output`

```
In [1]: %%bash --out list
...: ls
...: 
...: 

In [2]: list
Out[2]: 'seq_data\n'

In [3]: type(list)
Out[3]: str
```

* **Capturing shell output with ! Syntax**

	* Alternate method of invoking shell commands
	* The `!` operator invokes shell commands in IPython

```
In [4]: ls_count = !ls -l | awk '{ SUM+=$5} END {print SUM}'

In [5]: type(ls_count)
Out[5]: IPython.utils.text.SList

In [6]: ls_count
Out[6]: ['466899']
```

* **Bash and STDERR**

	* This is a command that will create output to STDERR
	
	```
	%%bash --out output
	ls --turbo
	```
	
	* STDERR isn't captured

* **Capture both STDOUT and STDERR**

```
# `%%magic` allows STDOUT and STDERR capture
In [8]: %%bash --out output --err error
   ...: ls -l | awk '{ SUM+=$5} END {print SUM}'
   ...: echo "no error so far" >&2
   ...: 
   ...: 

# The output of error
In [9]: error
Out[9]: 'no error so far\n'
```

* **Automate with SList**












