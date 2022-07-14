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
# lead to duplicated output, because the input statement executes Python code files to make imported objects available.
import say
say.hello()

Hello World!
Hello World!

# To avoid this duplicated output, remove the function call in the module
from say import hello
hello()

Hello World!
```

* **Module-script hybrid**

```
# To avoid this duplicated output, add if satement to prevent the function from being called
def hello():
	print("Hello World!")
if __name__ =='__main__':
	hello()

from say import hello
hello()
Hello World!
```

* **The __name__variable**

```python
def name():
	print(__name__)
	
if __name__ == '__main__':
	name()
``` 

* **One function to rule them all**

```python
from pathlib import Path

def do_everything(filename, match):
	matches = (line for line in Path(filename).open() if match in line)
	flat = (string for sublist in matches for string in sublist)
	num_gen = (int(substring) for string in flat for substring in string.split() if substring.isdigit())
	return zip(num_gen, num_gen)
```

* **One job per function**

```python
def generate_matches(filename, match):
	return (line for line in Path(filename).open() if match in line)
def flatten(nested_list):
	return (string for sublist in nested_list for string in sublist)
def generate_numbers(string_source):
	return (int(substring) for string in string_source
		for substring in string.split() if substring.isdigit()
def pair(generator):
	return zip(generator, generator)
```

* **Iterators**

```python
def pair(items):
	iterator = iter(items)
	return zip(iterator, iterator)
pairs = list(pair([1, 2, 3, 4]))

pairs
[(1, 2), (3, 4)]
```

* **Generators are iterators**

```python
def pair(items):
	iterator = iter(items)
	return zip (iterator, iterator)
pairs = list(pair([1, 2, 3, 4]))
pairs
[(1, 2), (3, 4)]
```

* **Adaptable functions**

```python
def pair(items):
	iterator = iter(items)
	return zip(iterator, iterator)
pairs = list(pair([1, 2, 3, 4]))
list(flatten(pairs))
[1, 2, 3, 4]
```  

## Abstraction





# 2. Documentation and Tests

# 3. Shell superpowers

# 4. Projects, pipelines, and parallelism










