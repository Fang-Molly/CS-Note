Introduction to NumPy
=====================

# 1. Understanding NumPy Arrays

## 1.1 Introducing arrays

* **NumPy and Python ecosystem**
	* NumPy is the core library for scientific computing in Python. 
	* Foundational Python libraries such as pandas, SciPy, and Matplotlib are built on top of NumPy's API.

* **NumPy arrays**

	* The array is the main object in NumPy. It's a grid-like structure that holds data.
	* An array can have any number of dimensions, and each dimension can be any length.

* **Importing Numpy**

```python
import numpy as np
```

* **Creating 1D arrays from lists**

```python
>>> python_list = [3, 2, 5, 8, 4, 9, 7, 6, 1]
>>> array = np.array(python_list)
>>> array
array([3, 2, 5, 8, 4, 9, 7, 6, 1])
>>> type(array)
<class 'numpy.ndarray'>
```

* **Creating 2D arrays from lists**

```python
>>> python_list_of_lists = [[3, 2, 5], [9, 7, 1], [4, 3, 6]]
>>> np.array(python_list_of_lists)
array([[3, 2, 5],
       [9, 7, 1],
       [4, 3, 6]])
```

* **Python lists and NumPy arrays**

	* Python lists: can contain many different data types
	* NumPy arrays: can contain only a single data type; use less space in memory

* **Creating arrays from scratch**

	* `np.zeros()`
	
	```python
	>>> np.zeros((5, 3))
	array([[0., 0., 0.],
      	  [0., 0., 0.],
     	  [0., 0., 0.],
     	  [0., 0., 0.],
     	  [0., 0., 0.]])
	```
	
	* `np.random.random()`: creat an array of random floats between 0 and 1

	```python
	>>> np.random.random((2, 4))
	array([[0.07085821, 0.24894103, 0.08190571, 0.8037425 ],
    	   [0.67475889, 0.49179409, 0.53331293, 0.58724395]])
	```
	
	* `np.arange()`
	
	```python
	# The start value is included in the output array, but the stop value is not
	>>> np.arange(-3, 4)
	array([-3, -2, -1,  0,  1,  2,  3])
	# The start value can be omitted if the range begins with zero
	>>> np.arange(4)
	array([0, 1, 2, 3])
	# If a third argument is passed, it is interpreted as the step value
	>>> np.arange(-3, 4, 3)
	array([-3,  0,  3])
	```
	
```python
>>> from matplotlib import pyplot as plt
>>> plt.scatter(np.arange(0, 7), np.arange(-3, 4))
<matplotlib.collections.PathCollection object at 0x7f80f5d72fa0>
>>> plt.show()
```

## 1.2 Array dimensionality

* **3D arrays**

```python
array_1_2D = np.array([[1, 2], [5, 7]])
array_2_2D = np.array([[8, 9], [5, 7]])
array_3_2D = np.array([[1, 2], [5, 7]])
array_3D = np.array([array_1_2D, array_2_2D, array_3_2D])

>>> array_1_2D
array([[1, 2],
       [5, 7]])
	   
>>> array_3D
array([[[1, 2],
        [5, 7]],

       [[8, 9],
        [5, 7]],

       [[1, 2],
        [5, 7]]])
```

* **4D arrays**

```python
array_4D = [array_A_3D, array_B_3D, array_C_3D, array_D_3D, array_E_3D, array_F_3D, array_G_3D, array_H_3D, array_I_3D]
```

* **Types of arrays**

	* **Vector arrays**
		* 1D arrays, one-dimensional array
		* There is no difference between row and column (or horizontal and vertical) vectors in NumPy since no second axis is specified. 

	* **Matrix arrays**
		* 2D arrays, two-dimensional array
		* Rows are the first dimension; Columns are the second dimension

	* **Tensor arrays**
		* three or more dimensions

```python
>>> array_1D_1 = np.array([1, 2, 3, 4, 5])
>>> array_1D_1
array([1, 2, 3, 4, 5])
>>> array_1D_1.shape
(5,)

>>> array_1D_2 = np.array([1,
...                        2,
...                        3,
...                        4,
...                        5])
>>> array_1D_2
array([1, 2, 3, 4, 5])
>>> array_1D_2.shape
(5,)

>>> array_2D_1 = np.array([[1], [2], [3], [4], [5]])
>>> array_2D_1
array([[1],
       [2],
       [3],
       [4],
       [5]])
>>> array_2D_1.shape
(5, 1)

>>> array_2D_2 = np.array([[1, 2, 3, 4, 5]])
>>> array_2D_2
array([[1, 2, 3, 4, 5]])
>>> array_2D_2.shape
(1, 5)
```

* **Shapeshifting**

	* **Array attribute**
	
		* `.shape`

		```python
		>>> array = np.zeros((3, 5))
		>>> array
		array([[0., 0., 0., 0., 0.],
		       [0., 0., 0., 0., 0.],
		       [0., 0., 0., 0., 0.]])
		>>> array.shape
		(3, 5)
		```
	
	* **Array methods**

		* `.flatten()`
		
		```python
		>>> array = np.array([[1, 2], [5, 7], [6, 6]])
		>>> array
		array([[1, 2],
      		   [5, 7],
      		   [6, 6]])
		>>> array.flatten()
		array([1, 2, 5, 7, 6, 6])
		```
		
		* `.reshape()`
	
		```python
		>>> array = np.array([[1, 2], [5, 7], [6, 6]])
		>>> array.reshape((2, 3))
		array([[1, 2, 5],
		       [7, 6, 6]])
		```

## 1.3 NumPy data types

* **NumPy vs. Python data types**

	* Sample Python data types:
		* `int`
		* `float`
	* Sample NumPy data types:
		* `np.int64`
		* `np.int32`
		* `np.float64`
		* `np.float32`

* **Bits and bytes**

	* Bit is short for binary digit. A bit can hold only values of zero or one; it is the smallest unit of memory data available on a computer.
	
	* A byte is a sequence of eight bits.

	* `np.int32`: can store two to the 32nd power integers: 2^32 = 4,294,967,296, from -2,147,483,648 to 2,147,483,648.

* **The `.dtype` attribute**: find the data type of elements in an array

```python
# `float64` is the default for an array made of Python floats
>>> np.array([1.32, 5.78, 175.55]).dtype
dtype('float64')

# `int64` is the default for an array made of Python integers
>>> np.array([[1, 2, 3], [4, 5, 6]]).dtype
dtype('int64')

# "<U12" indicates that the data type is a Unicode string with maximum length 12
>>> np.array(["Introduction", "to", "NumPy"]).dtype
dtype('<U12')
```

* **dtype as an argument**

```python
>>> float32_array = np.array([1.32, 5.78, 175.55], dtype=np.float32)
>>> float32_array.dtype
dtype('float32')
```

* **Type conversion**

```python
>>> boolean_array = np.array([[True, False], [False, False]], dtype=np.bool_)
>>> boolean_array.astype(np.int32)
array([[1, 0],
       [0, 0]], dtype=int32)
```

* **Type coercion**

	* When we try to make an array out of a Python list with several data types all the data changes to one data type.

```python
# change numbers into strings
>>> np.array([True, "Boop", 42, 42.42])
array(['True', 'Boop', '42', '42.42'], dtype='<U32')

# change integers into floats
>>> np.array([0, 42, 42.42]).dtype
dtype('float64')

# change booleans into integers
>>> np.array([True, False, 42]).dtype
dtype('int64')
```

# 2. Selecting and Updating Data

## 2.1 Indexing and slicing arrays

* **NumPy indexing**
	* Zero-based
	* Square brackets

* **Indexing 1D arrays**

```python
>>> array = np.array([2, 4, 6, 8, 10])
>>> array[3]
8
```

* **Indexing 2D arrays**

```python
# Indexing elements
>>> array_2D = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
>>> array_2D
array([[ 1,  2,  3,  4],
       [ 5,  6,  7,  8],
       [ 9, 10, 11, 12],
       [13, 14, 15, 16]])
>>> array_2D[2, 2]
11

# Indexing rows
>>> array_2D[0]
array([1, 2, 3, 4])

# Indexing columns
>>> array_2D[:, 0]
array([ 1,  5,  9, 13])
```

* **Slicing 1D arrays**

```python
>>> array = np.array([2, 4, 6, 8, 10])
>>> array[2:4]
array([6, 8])
```

* **Slicing 2D arrays**

```python
>>> array_2D
array([[ 1,  2,  3,  4],
       [ 5,  6,  7,  8],
       [ 9, 10, 11, 12],
       [13, 14, 15, 16]])
>>> array_2D[1:3, 1:3]
array([[ 6,  7],
       [10, 11]])

# Slicing with steps: start value, stop value, step value
>>> array_2D[0:3:2, 0:3:2] 
array([[ 1,  3],
       [ 9, 11]])
```

* **Sorting arrays**

	* Axis order
		* axis 0: refer to row
		* axis 1: refer to column
	* `np.sort()`: sort the array along the columns, with the highest number from each row in the far right
	* `np.sort(sudoku_game, axis=0)`: To sort the array by row, so that the highest numbers in each column are at the bottom of the array

## 2.2 Filtering arrays

* **Two ways to filter**

	* Masks and fancy indexing: 
		* returns array of elements
	* `np.where()`: 
		* returns array of indices
		* Can create an array based on whether elements do or don't meet condition

* **Boolean masks**

```python
# import numpy
>>> import numpy as np

# create an array
>>> one_to_five = np.arange(1, 6)
>>> one_to_five
array([1, 2, 3, 4, 5])

# create a Boolean mask
>>> mask = one_to_five % 2 == 0
>>> mask
array([False,  True, False,  True, False])

# filter with fancy indexing
>>> one_to_five[mask]
array([2, 4])
```

* **2D fancy indexing**

```python
>>> classroom_ids_and_sizes = np.array([[1, 22], [2, 21], [3, 27], [4, 26]])
>>> classroom_ids_and_sizes
array([[ 1, 22],
       [ 2, 21],
       [ 3, 27],
       [ 4, 26]])
>>> classroom_ids_and_sizes[:, 1] % 2 == 0
array([ True, False, False,  True])
>>> classroom_ids_and_sizes[:, 0][classroom_ids_and_sizes[:, 1] % 2 == 0]
array([1, 4])
```

* Filtering with `np.where()`

```python
>>> classroom_ids_and_sizes
array([[ 1, 22],
       [ 2, 21],
       [ 3, 27],
       [ 4, 26]])
>>> np.where(classroom_ids_and_sizes[:, 1] % 2 == 0)
(array([0, 3]),)
```

## 2.3 Adding and removing data

* **Concatenating rows with `np.concatenate()`**

```python
>>> classroom_ids_and_sizes = np.array([[1, 22], [2, 21], [3, 27], [4, 26]])
>>> new_classrooms = np.array([[5, 30], [5, 17]])
>>> np.concatenate((classroom_ids_and_sizes, new_classrooms))
array([[ 1, 22],
       [ 2, 21],
       [ 3, 27],
       [ 4, 26],
       [ 5, 30],
       [ 5, 17]])
```

* **Concatenating columns**

```python
>>> classroom_ids_and_sizes = np.array([[1, 22], [2, 21], [3, 27], [4, 26]])
>>> grade_levels_and_teachers = np.array([[1, "James"], [1, "George"], [3, "Amy"], [3, "Meehir"]])
>>> np.concatenate((classroom_ids_and_sizes, grade_levels_and_teachers), axis=1)
array([['1', '22', '1', 'James'],
       ['2', '21', '1', 'George'],
       ['3', '27', '3', 'Amy'],
       ['4', '26', '3', 'Meehir']], dtype='<U21')
```

* **Shape compatibility**

```python
>>> array_1D = np.array([1, 2, 3])
>>> column_array_2D = array_1D.reshape((3, 1))
>>> column_array_2D
array([[1],
       [2],
       [3]])
>>> row_array_2D = array_1D.reshape((1, 3))
>>> row_array_2D
array([[1, 2, 3]])
```

* **Deleting rows with `np.delete()`**

```python
>>> classroom_data
array([['1', '22', '1', 'James'],
       ['2', '21', '1', 'George'],
       ['3', '27', '3', 'Amy'],
       ['4', '26', '3', 'Meehir']],)
>>> np.delete(classroom_data, 1, axis=0)
array([['1', '22', '1', 'James'],
       ['3', '27', '3', 'Amy'],
       ['4', '26', '3', 'Meehir']])
```

* **Deleting columns**

```python
>>> np.delete(classroom_data, 1, axis=1)
array([['1', '1', 'James'],
       ['2', '1', 'George'],
       ['3', '3', 'Amy'],
       ['4', '3', 'Meehir']])

# delete without an axis
>>> np.delete(classroom_data, 1)
array(['1', '1', 'James', '2', '21', '1', 'George', '3', '27', '3', 'Amy',
       '4', '26', '3', 'Meehir'])
```

# 3. Array Mathematics!

## 3.1 Summarizing data

* **Aggregating methods**

	* `.sum()`
	* `.min()`
	* `.max()`
	* `.mean()`
	* `.cumsum()`

```python
>>> security_breathes
array([[0, 5, 1],
       [0, 2, 0],
       [1, 1, 2],
       [2, 2, 1],
       [0, 0, 0]])
	   
>>> security_breathes.sum()
17

# axis equals to zero sums the values of all rows in each column
>>> security_breathes.sum(axis=0)
array([ 3, 10,  4])

# axis equals to one sums the values of all columns in each row
>>> security_breathes.sum(axis=1)
array([6, 2, 4, 5, 0])

# keepdims argument
>>> security_breathes.sum(axis=1, keepdims=True)
array([[6],
       [2],
       [4],
       [5],
       [0]])
	   
>>> security_breathes.min()
0

>>> security_breathes.min(axis=1)
array([0, 0, 1, 1, 0])

>>> security_breathes.max()
5

>>> security_breathes.mean()
1.1333333333333333

>>> security_breathes.mean(axis=1)
array([2.        , 0.66666667, 1.33333333, 1.66666667, 0.        ])

# cumulative sum
>>> security_breathes.cumsum(axis=0)
array([[ 0,  5,  1],
       [ 0,  7,  1],
       [ 1,  8,  3],
       [ 3, 10,  4],
       [ 3, 10,  4]])
```

## 3.2 Vectorized operations

* **Vectorized operations**

```python
>>> np.arange(1000000).sum()
499999500000
```

* **Numpy syntax**

```python
>>> array = np.array([[1, 2, 3], [4, 5, 6]])

>>> array
array([[1, 2, 3],
       [4, 5, 6]])
	   
>>> array + 3
array([[4, 5, 6],
       [7, 8, 9]])
	   
>>> array * 3
array([[ 3,  6,  9],
       [12, 15, 18]])
	   
>>> array_a = np.array([[1, 2, 3], [4, 5, 6]])
>>> array_b = np.array([[0, 1, 0], [1, 0, 1]])
>>> array_a + array_b
array([[1, 3, 3],
       [5, 5, 7]])
>>> array_a * array_b
array([[0, 2, 0],
       [4, 0, 6]])	   

>>> array = np.array([[1, 2, 3], [4, 5, 6]])
>>> array > 2
array([[False, False,  True],
       [ True,  True,  True]])	   
	   
>>> array = np.array(["NumPy", "is", "awesome"])
>>> len(array) > 2
True

>>> vectorized_len = np.vectorize(len)
>>> vectorized_len(array) > 2
array([ True, False,  True])
```

## 3.3 Broadcasting




# 4. Array Transformations

## 4.1 Saving and loading arrays


## 4.2 Array acrobatics



## 4.3 Stacking and splitting







