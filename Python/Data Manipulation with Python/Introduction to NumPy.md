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
















## 1.3 NumPy data types










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







