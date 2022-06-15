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
>>> python_list_of_lists = [[3, 2, 5], 
							[9, 7, 1], 
							[4, 3, 6]]
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


8. dtype as an argument
Rather than changing an array's data type after creation, it's possible to declare a data type when you create the array using the optional dtype keyword argument. A keyword argument is an argument preceded by an identifying word in a function or method call. The dtype keyword argument exists in many NumPy functions, including np-dot-zeros, np-dot-random-dot-random, and np-dot-arange.

9. Type conversion
Type conversion occurs when we explicitly tell NumPy to convert the data type of elements within an array. This is done with the dot-astype method. For example, to convert a Boolean array to zero and one values, we could change the data type of the array to an integer type. Notice that the np-dot-bool_ data type has no bitsize because booleans do not vary in size.

10. Type coercion
What happens if we try to make an array out of a Python list with several data types? All the data changes to one data type: in this case, a string! Since NumPy did this without us telling it to, this is called type coercion. NumPy did this because while numbers are easily cast into strings, strings are not easily cast into numbers while still preserving the original data.

11. Type coercion hierarchy
We just saw that adding a single string to an array means that NumPy will cast all elements into strings. Similarly, adding a single float to an array of integers will change all integers into floats, and adding a single integer to an array of Booleans will change all Booleans into integers. As we know, using one data type is one reason that NumPy has a lower memory consumption, but pay attention to the data type of the elements in your array as they can change without notice. 








# 2. Selecting and Updating Data

## 2.1 Indexing and slicing arrays




## 2.2 Filtering arrays



## 2.3 Adding and removing data



# 3. Array Mathematics!

## 3.1 Summarizing data


## 3.2 Vectorized operations



## 3.3 Broadcasting




# 4. Array Transformations

## 4.1 Saving and loading arrays


## 4.2 Array acrobatics



## 4.3 Stacking and splitting







