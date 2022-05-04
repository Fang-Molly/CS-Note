Python Data Science Toolbox 
===========================

# 1. Writing your own functions

## 1.1 User-defined functions

* **Defining a function**

```python
>>> def square():            # Function header
...     new_value = 4 ** 2   # Function body
...     print(new_value)
... 
>>> square()
16
```

* **Function parameters**

```python
>>> def square(value):
...     new_value = value ** 2
...     print(new_value)
... 
>>> square(4)
16
>>> square(5)
25
```

* **Return values from functions**

```python
>>> def square(value):
...     new_value = value ** 2
...     return new_value
... 
>>> num = square(4)
>>> print(num)
16
```

* **Docstromgs**

	* Docstrings describe what your function does
	* Serve as documentation for your function
	* Placed in the immediate line after the function header
	* In between triple double quotes """

```python
>>> def square(value):
...     """Return the square of a value."""
...     new_value = value ** 2
...     return new_value
```

## 1.2 Multiple parameters and return values

* **Multiple parameters**

```python
>>> def raise_to_power(value1, value2):
...     """Raise value1 to the power of value2."""
...     new_value = value1 ** value2
...     return new_value
... 
>>> result = raise_to_power(2, 3)
>>> print(result)
8
```

* **Tuples**

	* Like a list - can contain multiple values
	* Immutable - can't modify values!
	* Constructed using parentheses ()

	```python
	>>> even_nums = (2, 4, 6)
	>>> type(even_nums)
	<class 'tuple'>
	```

	* Unpacking tuples into several variables

	```python
	>>> even_nums = (2, 4, 6)
	>>> a, b, c = even_nums
	>>> a
	2
	>>> b
	4
	>>> c
	6
	```

	* Accessing tuple elements using zero-indexing

	```python
	>>> even_nums = (2, 4, 6)
	>>> even_nums[1]
	4
	```

* **Returning multiple values**

```python
>>> def raise_both(value1, value2):
...     """Raise value1 to the power of value2 and vice versa."""
...     new_value1 = value1 ** value2
...     new_value2 = value2 ** value1
...     new_tuple = (new_value1, new_value2)
...     return new_tuple
... 
>>> result = raise_both(2, 3)
>>> print(result)
(8, 9)
```

```python
# Import pandas
import pandas as pd

# Import Twitter data as DataFrame: df
df = pd.read_csv('tweets.csv')

# Initialize an empty dictionary: langs_count
langs_count = {}

# Extract column from DataFrame: col
col = df['lang']

# Iterate over lang column in DataFrame
for entry in col:

    # If the language is in langs_count, add 1
    if entry in langs_count.keys():
        langs_count[entry] += 1
    # Else add the language to langs_count, set the value to 1
    else:
        langs_count[entry] = 1

# Print the populated dictionary
print(langs_count)
```

```python
# Define count_entries()
def count_entries(df, col_name):
    """Return a dictionary with counts of occurrences as value for each key."""

    # Initialize an empty dictionary: langs_count
    langs_count = {}
    
    # Extract column from DataFrame: col
    col = df[col_name]

    # Iterate over lang column in DataFrame
    for entry in col:

        # If the language is in langs_count, add 1
        if entry in langs_count.keys():
            langs_count[entry] += 1
        # Else add the language to langs_count, set the value to 1
        else:
            langs_count[entry] = 1

    # Return the langs_count dictionary
    return langs_count

# Call count_entries(): result
result = count_entries(tweets_df, 'lang')

# Print the result
print(result)
```

# 2. Default arguments, variable-length arguments and scope

## 2.1 Scope and user-defined functions

* **Scope in functions**

	* Not all objects are accessible everywhere in a script
	* Scope - part of the program where an object or name may be accessible
		* Global scope - defined in the main body of a script
		* Local scope - defined inside a function
		* Built-in scope - names in the pre-defined built-ins module

* **Global vs. local scope**

```python
>>> def square(value):
...     """Returns the square of a number."""
...     new_val = value ** 2
...     return new_val
... 
>>> square(3)
9
```

```python
>>> new_val = 10
>>> def square(value):
...     """Returns the square of a number."""
...     new_val = value ** 2
...     return new_val
... 
>>> square(3)
9
>>> new_val
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'new_val' is not defined
```

```python
>>> new_val = 10
>>> def square(value):
...     """Returns the square of a number."""
...     new_value2 = new_val ** 2
...     return new_value2
... 
>>> square(3)
100
>>> new_val = 20
>>> square(new_val)
400
```
```
>>> new_val = 10
>>> def square(value):
...     """Returns the square of a number."""
...     global new_val
...     new_val = new_val ** 2
...     return new_val
... 
>>> square(3)
100
>>> new_val
100
```

## 2.2 Nested functions

```python
def outer( ... ):
	""" ... """
	x = ...
	
	def inner( ... ):
		""" ... """
		y = x ** 2
	return ...
```

```python
def mod2plus5(x1, x2, x3):
	"""Returns the remainder plus 5 of three values."""
	
	new_x1 = x1 % 2 + 5
	new_x2 = x2 % 2 + 5
	new_x3 = x3 % 2 + 5
	
	return (new_x1, new_x2, new_x3)
```

```python
def mod2plus5(x1, x2, x3):
	"""Returns the remainder plus 5 of three values."""

	def inner(x):
		"""Returns the remainder plus 5 of a value."""
		return x % 2 + 5
		
	return (inner(x1), inner(x2), inner(x3))

print(mod2plus5(1, 2, 3))
(6, 5, 6)
```

```python
def raise_val(n):
	"""Return the inner function."""
	
	def inner(x):
	"""Raise x to the power of n."""
		raised = x ** n
		return raised
		
	return inner

square = raise_val(2)
cube = raise_val(3)
print(square(2), cube(4))

4, 64
```

* **Using nonlocal**

```python
def outer():
	"""prints the value of n."""
	
	def inner():
		nonlocal n
		n = 2
		print(n)
		
	inner()
	print(n)
	
outer()
2
2
```

## 2.3 Default and flexible arguments

* **Add a default argument**

```python
def power(number, pow=1):
	"""Raise number to the power of pow."""
	new_value = number ** pow
	return new_value
	
power(9, 2)
81

power(9, 1)
9

power(9)
9
```

```python
def add_all(*args):
	"""Sum all values in *args together."""
	
	# Initialize sum
	sum_all = 0
	
	# Accumlate the sum
	for num in args:
		sum_all += num
		
	return sum_all

add_all(1)
1

add_all(1, 2)
3 

add_all(5, 10, 15, 20)
50
```

* **Flexible arguments: **kwargs**

```python
print_all(name="Hugo Bowne-Anderson", employer="DataCamp")

name: Hugo Bowne-Anderson
employer: DataCamp
```

```python
def print_all(**kwargs):
	"""print out key-value pairs in **kwargs."""
	
	# print out the key-value pairs
	for key, value in kwargs.items():
		print(key + ": " + value)

print_all(name="dumbledore", job="headmaster")

job: headmaster
name: dumbledore
```

# 3. Lambda functions and error-handling

## 3.1 Lambda functions

* **Lambda functions**

```python
>>> raise_to_power = lambda x, y: x ** y
>>> raise_to_power(2, 3)
8
```

* **Anonymous functions**

	* Function map takes two arguments: `map(func, seq)`
	* `map()` applies the function to ALL elements in the sequence

```python
nums = [48, 6, 9, 21, 1]
square_all = map(lambda num: num ** 2, nums)
print(square_all)

<map object at 0x1273536a0>

print(list(square_all))

[2304, 36, 81, 441, 1]
```

## 3.2 Introduction to error handling

* **Passing valid arguments**

```python
>>> def sqrt(x):
...     """Returns the square root of a number."""
...     return x ** (0.5)
... 
>>> sqrt(4)
2.0
>>> sqrt(10)
3.1622776601683795
>>> sqrt('hello')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 3, in sqrt
TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'float'
```

* **Errors and exceptions**

	* Exceptions - caught during execution
	* catch exceptions with try-except clause
		* Runs the code following try
		* If there's an exception, run the code following except

```python
def sqrt(x):
    """Returns the square root of a number."""
    try: 
        return x ** 0.5
    except:
        print('x must be an int or float')

>>> sqrt(4)
2.0
>>> sqrt(10)
3.1622776601683795
>>> sqrt('hi')
x must be an int or float
```


```python
def sqrt(x):
    """Returns the square root of a number."""
    try: 
        return x ** 0.5
    except TypeError:
        print('x must be an int or float')

>>> sqrt(-9)
(1.8369701987210297e-16+3j)
>>> sqrt(9)
3.0
>>> sqrt('hi')
x must be an int or float
```

```python
def sqrt(x):
    """Returns the square root of a number."""
    if x < 0:
        raise ValueError('x must be non-negative')
    try: 
        return x ** 0.5
    except TypeError:
        print('x must be an int or float')

>>> sqrt(-9)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 4, in sqrt
ValueError: x must be non-negative
```


# 4. Using iterators in PythonLand

## 4.1 Introduction to iterators

* **Iterating with a for loop**

```python
# iterate over a list
employees = ['Nick', 'Lore', 'Hugo']
for employee in employees:
    print(employee)

Nick
Lore
Hugo

# iterate over a string
for letter in 'DataCamp':
    print(letter)
	
D
a
t
a
C
a
m
p

# iterate over a range object
for i in range(4):
    print(i)
	
0
1
2
3
```

* **Iterators vs. iterables**

	* Iterable
		* Examples: lists, strings, dictionaries, file connections
		* An object with an associated `iter()` method
		* Applying `iter()` to an iterable creates an iterator

	* Iterator
		* Produces next value with `next()`

* **Iterating over iterables : `next()`**

```python
>>> word = 'Da'
>>> it = iter(word)
>>> next(it)
'D'
>>> next(it)
'a'
>>> next(it)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

* **Iterating at once with `*`**

```python
>>> word = 'Data'
>>> it = iter(word)
>>> print(*it)
D a t a
```

* **Iterating over dictionaries**

```python
pythonistas = {'hugo':'bowne-anderson', 'francis':'castro'}
for key, value in pythonistas.items():
    print(key, value)
	
hugo bowne-anderson
francis castro
```

* **Iterating over file connections**

```python
file = open('file.txt')
it = iter(file)
print(next(it))

This is the first line.

print(next(it))

This is the second line.
```

## 4.2 Playing with iterators

* **Using enumerate()**

```python
avengers = ['hawkeye', 'iron man', 'thor', 'quicksilver']
e = enumerate(avengers)

>>> e
<enumerate object at 0x1421c7200>
>>> print(type(e))
<class 'enumerate'>

>>> e_list = list(e)
>>> print(e_list)
[(0, 'hawkeye'), (1, 'iron man'), (2, 'thor'), (3, 'quicksilver')]

>>> for index, value in enumerate(avengers):
...     print(index, value)
... 
0 hawkeye
1 iron man
2 thor
3 quicksilver

>>> for index, value in enumerate(avengers, start=10):
...     print(index, value)
... 
10 hawkeye
11 iron man
12 thor
13 quicksilver
```

* **Using zip()**

```python
>>> avengers = ['hawkeye', 'iron man', 'thor', 'quicksilver']
>>> names = ['barton', 'stark', 'odinson', 'maximoff']
>>> z = zip(avengers, names)
>>> print(type(z))
<class 'zip'>

>>> print(z)
<zip object at 0x1421c7480>
>>> print(*z)
('hawkeye', 'barton') ('iron man', 'stark') ('thor', 'odinson') ('quicksilver', 'maximoff')

>>> z_list = list(z)
>>> z_list
[('hawkeye', 'barton'), ('iron man', 'stark'), ('thor', 'odinson'), ('quicksilver', 'maximoff')]

>>> for z1, z2 in zip(avengers, names):
...     print(z1, z2)
... 
hawkeye barton
iron man stark
thor odinson
quicksilver maximoff
```

## 4.3 Using iterators to load large files into memory

* **Loading data in chunks**

	* There can be too much data to hold in memory
	* Solution: load data in chunks!
	* `pandas` function: `read_csv()`
		* Specify the chunk: `chunksize`

* **Iterating over data**

```python
import pandas as pd
result = []
for chunk in pd.read_csv('data.csv', chunksize=1000):
	result.append(sum(chunk['x']))
total = sum(result)
print(total)

4252532
```

```python
import pandas as pd
total = 0
for chunk in pd.read_csv('data.csv', chunksize=1000):
	total += sum(chunk['x'])
print(total)

4252532
```


# 5. List comprehensions and generators

## 5.1 List comprehensions

* **Populate a list with a for loop**

```python
>>> nums = [12, 8, 21, 3, 16]
>>> new_nums = []
>>> for num in nums:
...     new_nums.append(num + 1)
... 
>>> print(new_nums)
[13, 9, 22, 4, 17]
```

* **A list comprehension**

```pyhton
>>> nums = [12, 8, 21, 3, 16]
>>> new_nums = [num + 1 for num in nums]
>>> print(new_nums)
[13, 9, 22, 4, 17]
```

* **List comprehension with range()**

```python
>>> result = [num for num in range(11)]
>>> print(result)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

* **List comprehesions**

	* Collapse for loops for building lists into a single line
	* Components
		* Iterable
		* Iterator variable (represent members of iterable)
		* Output expression

* **Nested loops**

```python
pairs_1 = []
for num1 in range(0, 2):
    for num2 in range(6, 8):
        pairs_1.append((num1, num2))
		
>>> print(pairs_1)
[(0, 6), (0, 7), (1, 6), (1, 7)]

pairs_2 = [(num1, num2) for num1 in range(0, 2) for num2 in range(6, 8)]
>>> print(pairs_2)
[(0, 6), (0, 7), (1, 6), (1, 7)]
```

## 5.2 Advanced comprehensions

* **Conditionals in comprehensions**

	* Conditionals on the iterable

	```python
	>>> [num ** 2 for num in range(10) if num % 2 == 0]
	[0, 4, 16, 36, 64]
	```
	
	* Conditionals on the output expression

	```python
	>>> [num ** 2 if num % 2 == 0 else 0 for num in range(10)]
	[0, 0, 4, 0, 16, 0, 36, 0, 64, 0]
	```

* **Dict comprehensions**

	* Create dictionaries
	* Use curly braces `{}` instead of brackets `[]`

	```python
	>>> pos_neg = {num: -num for num in range(9)}
	>>> print(pos_neg)
	{0: 0, 1: -1, 2: -2, 3: -3, 4: -4, 5: -5, 6: -6, 7: -7, 8: -8}
	>>> print(type(pos_neg))
	<class 'dict'>
	```

## 5.3 Introduction to generator expressions

```python
>>> [2 * num for num in range(10)]
[0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

>>> (2 * num for num in range(10))
<generator object <genexpr> at 0x1421a9c10>
```

* **List comprehensions vs. generators**

	* List comprehension - returns a list
	* Generators - returns a generator object
	* Both can be iterated over

* **Printing values from generators**

```python
>>> result = (num for num in range(6))
>>> for num in result:
...     print(num)
... 
0
1
2
3
4
5

>>> result = (num for num in range(6))
>>> print(list(result))
[0, 1, 2, 3, 4, 5]
```

* **Lazy evaluation

```
>>> result = (num for num in range(6))
>>> print(next(result))
0
>>> print(next(result))
1
>>> print(next(result))
2
>>> print(next(result))
3
>>> print(next(result))
4
```

* **Conditionals in generator expressions**

```python
>>> even_nums = (num for num in range(10) if num % 2 == 0)
>>> print(list(even_nums))
[0, 2, 4, 6, 8]
```

* **Generator functions**

	* Produces generator objects when called
	* Defined like a regular function - `def`
	* Yields a sequence of values instead of returning a single value
	* Generates a value with `yield` keyword

* **Build a generator function**

	* sequence.py
	
	```python
	def num_sequence(n):
    """Generate values from 0 to n."""
    i = 0
    while i < n:
        yield i
        i += 1
		
	>>> result = num_sequence(5)
	>>> print(type(result))
	<class 'generator'>
	>>> for item in result:
	...     print(item)
	... 
	0
	1
	2
	3
	4
	```
	
