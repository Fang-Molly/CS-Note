# 1 Writing your own functions

## 1.1 User-defined functions

* Built-in functions

    * str()
 
* Defining a function

```python
>>> def square():            # function header
...     new_value = 4 ** 2        # function body
...     print(new_value)
... 
>>> square()
16
```

* Function parameters

```python
>>> def square(value):
...     new_value = value ** 2
...     print(new_value)
... 
>>> square(4)
16
>>> square(9)
81
```

* Return values from functions

```python
>>> def square(value):
...     new_value = value ** 2
...     return new_value
... 
>>> num = square(4)
>>> print(num)
16
```

* Docstrings

    * describe what your function does
    * serve as documentation for your function
    * placed in the immediate line after the function header
    * In between triple double quotes"""

```python
>>> def square(value):
...     """Return the square of a value."""
...     new_value = value ** 2
...     return new_value
... 
>>> square(4)
16
```






