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

## 1.3 Automate with SList

* **SList methods**

	* `fields`
	* `grep`
	* `sort`

* **Using SList fields**

```
# List the items in a directory and save the variable
ls = !ls -l /usr/bin

# Collect whitespace-separated fields
ls.fields(1, 5)[1:4]
['1 jan', '1 Jul', '1 Sep']
```

* **Using SList grep**

```
# Assign `ls` output to an `SList`
ls = !ls -l /usr/bin

# Grep a pattern
ls.grep("Kill")

# Only results matching pattern are displayed
['lrwxrwxrwx 1 root root         5 May 14  2018 pkill -> pgrep','-rwxr-xr-x 1 root root     26704 May 14  2018 skill']
```

* **Using SList sort**

```
# Capture df unix command
disk_usage = !df -h

# Sort by usage
disk_usage.sort(5, nums = True)

['/dev/nvme0n1p1  335G  177G  158G  53% /etc/hosts',
 'Filesystem      Size  Used Avail Use% Mounted on',
 'overlay         335G  177G  158G  53% /',
 'shm              64M   24K   64M   1% /dev/shm']
```

* **SList and regular Python lists**

```
# An SList can be popped using `.pop()`
var = ls.pop()
print(var)
'pear84.txt'

# slicing operations work on SLists
ls[-4:]
['pear5.txt', 'pear52.txt', 'pear56.txt', 'pear6.txt']
```
	
* **Wrapping up SList**

```
# SList to list workflow
type(ls)
'IPython.utils.text.SList'
newls = list(ls)
'list'

# SList to set
sls = set(ls)

# SList to dictionary
dls = dict(vals=ls)
```

# 2. Shell commands with subprocess

## 2.1 Execute shell commands in subprocess



























