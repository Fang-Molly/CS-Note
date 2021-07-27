# 1 Python Basics

## 1.1 Hello Python!

* Python

* IPython Shell : Execute Python commands

* Python Script : Text files - `.py` 

## 1.2 Variables and Types

* Variable : specific, case-sensitive name

* Types : `type()`

    * int :  `int()`
    * float : `float()`
    * str : `str()`
    * bool : `bool()`

# 2 Python Lists

## 2.1 list

* enclose in square bracket `[a, b, c]`

* contain any type, different types

* list type : list

## 2.2 Create a list

```python
a = "is"
b = 34
my_list = ["my", a, b]
```

## 2.3 Subsetting lists

* list index

    * forward : from 0
    * backward : from -1

* list slicing

    * include the start noninclude the end : `fam[3:5]`, include index3 and index4

## 2.4 Manipulating lists

```Python
>>> fam = ["liz", 1.73, "emma", 1.68, "mom", 1.71, "dad", 1.89]
>>> fam
['liz', 1.73, 'emma', 1.68, 'mom', 1.71, 'dad', 1.89]

# change elements
>>> fam[7] = 1.86
>>> fam
['liz', 1.73, 'emma', 1.68, 'mom', 1.71, 'dad', 1.86]
>>> fam[0:2] = ["lisa", 1.74]
>>> fam
['lisa', 1.74, 'emma', 1.68, 'mom', 1.71, 'dad', 1.86]

# add elements
>>> fam_ext = fam + ["me", 1.79]
>>> fam_ext
['lisa', 1.74, 'emma', 1.68, 'mom', 1.71, 'dad', 1.86, 'me', 1.79]

# remove elements
>>> del(fam[2])
>>> fam
['lisa', 1.74, 1.68, 'mom', 1.71, 'dad', 1.86]

# copy elements
>>> x = ["a", "b", "c"]
>>> y = x
>>> y[1] = "z"
>>> y
['a', 'z', 'c']
>>> x
['a', 'z', 'c']

# copy elements by using list() or [:], no affect on original
>>> x = ["a", "b", "c"]
>>> y = list(x)  # different from y = x
>>> y 
['a', 'b', 'c']
>>> y = x[:]
>>> y
['a', 'b', 'c']
>>> y[1] = "z"
>>> x            # x no change
['a', 'b', 'c']
>>> y
['a', 'z', 'c']
```

# 3 Functions and Packages

## 3.1 Functions

* `print()`
* `type()`
* `str()`, `int()`, `bool()`, `float()`
* `max()`, `len()`
* `round()`: `round(number)` `round(number, ndigits)`

```python
>>> round(3.1415926)
3
>>> round(3.1415926,3)
3.142
```

* `help()` : `help(max)`

* `sorted()`

```python
>>> # Create lists first and second
>>> first = [11.25, 18.0, 20.0]
>>> second = [10.75, 9.50]
>>> 
>>> # Paste together first and second: full
>>> full = first + second
>>> 
>>> # Sort full in descending order: full_sorted
>>> full_sorted = sorted(full, key = None, reverse = True)
>>> 
>>> # Print out full_sorted
>>> print(full)
[11.25, 18.0, 20.0, 10.75, 9.5]
>>> print(full_sorted)
[20.0, 18.0, 11.25, 10.75, 9.5]
```

## 3.2 Methods

* Built-in Functions

    * `max()`
    * `len()`

* list methods

    * `list.index(element)`
    * `list.count(element)`
    * `list.append(element)`
    * `list.remove()`
    * `list.reverse()`

* str methods

    * `str.capitalize()` : `liz.capitalize()`
    * `str.replace(a, b)`: `liz.replace("z", "sa")`
    * `str.index()`

## 3.3 Packages

* Packages
    * directory of Python Scripts
    * each script = module
    * specify functions, methods, types
    * thousands of packages available
        * Numpy
        * Matplotlib
        * Scikit-learn

* Install packages

* Import package

```python
import math
C = 2 * r * math.pi
```

* Selective import

```python
from math import pi
```

* Different ways of importing

# 4 Numpy

## 4.1 Numpy

* Numeric Python
* Alternative to Python List: Numpy Array
* Calculations over entire arrays
* Easy and Fast
* Installation
    * In the terminal: pip3 install numpy

```python
>>> height = [1.73, 1.68, 1.71, 1.89, 1.79]
>>> weight = [65.4, 59.2, 63.6, 88.4, 68.7]
>>> import numpy as np
>>> np_height = np.array(height)
>>> np_weight = np.array(weight)
>>> bmi = np_weight /np_height ** 2
>>> bmi
array([21.85171573, 20.97505669, 21.75028214, 24.7473475 , 21.44127836])
```

* Numpy arrays: contain only one type

```python
>>> np.array([1.0, "is", True])
array(['1.0', 'is', 'True'], dtype='<U32')
```

* Numpy arrays : diffrent from list

```python
>>> python_list = [1, 2, 3]
>>> numpy_array = np.array([1, 2, 3])
>>> python_list + python_list
[1, 2, 3, 1, 2, 3]
>>> numpy_array + numpy_array
array([2, 4, 6])
```

* Numpy Subsetting

```python
>>> bmi
array([21.85171573, 20.97505669, 21.75028214, 24.7473475 , 21.44127836])
>>> bmi[1]
20.97505668934241
>>> bmi > 23
array([False, False, False,  True, False])
>>> bmi[bmi > 23]
array([24.7473475])
```

* Numpy Side Effects

```python
>>> np.array([True, 1, 2]) + np.array([3, 4, False])
array([4, 5, 2])
```

## 4.2 2D Numpy Arrays

* Type of Numpy Arrays

```python
>>> type(np_weight)
<class 'numpy.ndarray'>
```

* 2D Numpy Arrays

```python
>>> np_2d = np.array([[1.73, 1.68, 1.71, 1.89, 1.79],
...                [65.4, 59.2, 63.6, 88.4, 68.7]])
>>> np_2d
array([[ 1.73,  1.68,  1.71,  1.89,  1.79],
       [65.4 , 59.2 , 63.6 , 88.4 , 68.7 ]])
       
>>> np_2d.shape
(2, 5)
# 2 rows, 5 columns

>>> np.array([[ 1.73,  1.68,  1.71,  1.89,  1.79],
...        [65.4 , 59.2 , 63.6 , 88.4 , 68.7 ]])
array([[ 1.73,  1.68,  1.71,  1.89,  1.79],
       [65.4 , 59.2 , 63.6 , 88.4 , 68.7 ]])
```

* Subsetting

```python
>>> np_2d[0]
array([1.73, 1.68, 1.71, 1.89, 1.79])
>>> np_2d[0][2]
1.71
>>> np_2d[0, 2]
1.71
>>> np_2d[:, 1:3]
array([[ 1.68,  1.71],
       [59.2 , 63.6 ]])
>>> np_2d[1, :]
array([65.4, 59.2, 63.6, 88.4, 68.7])
```

* Arithmetic

```python
>>> import numpy as np
>>> np_mat = np.array([[1, 2],
...                    [3, 4],
...                    [5, 6]])
>>> np_mat * 2 
array([[ 2,  4],
       [ 6,  8],
       [10, 12]])
>>> np_mat + np.array([10, 10])
array([[11, 12],
       [13, 14],
       [15, 16]])
>>> np_mat + np_mat
array([[ 2,  4],
       [ 6,  8],
       [10, 12]])
```

## 4.3 Numpy: Basic Statistics

* Functions
    * `np.mean(np_city[:,0])`
    * `np.median(np_city[:,0])`
    * `np.corrcoef(np_city[:,0], np_city[:,1])
    * `np.std(np_city[:,0 ])`
    * `sum()`
    * `sort()`
  
```python
>>> import numpy as np
>>> x = [1, 4, 8, 10, 12]
>>> np.mean(x)
7.0
>>> np.median(x)
8.0
```

* Generate data
    * Arguments for `np.random.normal()`
        * distribution mean
        * distribution standard deviation
        * number of samples














