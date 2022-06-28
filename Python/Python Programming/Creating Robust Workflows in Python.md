Creating Robust Workflows in Python
====================================

# 1. Python Programming Principles

## 1.1 The DRY principle: Don't repeat yourself

```python
# Wet code: waste everyone's time
# Read in dataset info from text files
with open('diabetes.txt', 'r') as file:
	diabetes = file.read()
	
with open('boston.txt', 'r') as file:
	boston = file.read()

with open('iris.txt', 'r') as file:
	iris = file.read()

# Define a function to read text files
def read(filename):
	with open(filename, 'r') as file:
		return file.read()
# call a function	
diabetes = read("diabetes.txt")
boston = read("boston.txt")
iris = read("iris.txt")

# list comprehensions
# create a list of filenames
filenames = ["diabetes.txt", "boston.txt", "iris.txt"]
# read files with for loop
file_list = [read(f) for f in filenames]
# multiple assignment
diabetes, boston, iris = file_list

# standard library
from pathlib import Path
# create a list of filenames
filenames = ["diabetes.txt", "boston.txt", "iris.txt"]
# use pathlib in a list comprehension
diabetes, boston, iris = [Path(f).read_text() for f in filenames]
# use pathlib in a generator expression by replacing square brackets with parentheses
diabetes, boston, iris = (Path(f).read_text() for f in filenames)
```

## 1.2 Modularity

* **What is modularity?**

	* Independent, reusable objects
	* Each object only has one job
	* Separate code into modules and scripts
	* Python code files
	* `.py` extensions

* **Modules**
	* Are imported
	* Provide tools
	* Define functions

```python
# the `say` module
def hello():
	print("Hello World!")
```

* **Scripts**
	* Are run
	* Perform actions
	* Call functions

```python
import say

say.hello()
```

* **Function definition and calls**

```python
def hello():
	print("Hello World!")

hello()

Hello World!
```

```python
import say
say.hello()

Hello World!
Hello World!

from say import hello
hello()

Hello World!
Hello World!
```

* **Module-script hybrid**

```python





# 2. Documentation and Tests

# 3. Shell superpowers

# 4. Projects, pipelines, and parallelism

