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








## 2.2 Nested functions

## 2.3 Default and flexible arguments

# 3. Lambda functions and error-handling

## 3.1 Lambda functions

## 3.2 Introduction to error handling

# 4. Lambda functions and error-handling

# 5. List comprehensions and generators

# 6. 
