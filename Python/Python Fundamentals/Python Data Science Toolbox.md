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

# 4. Lambda functions and error-handling

# 5. List comprehensions and generators

# 6. 
