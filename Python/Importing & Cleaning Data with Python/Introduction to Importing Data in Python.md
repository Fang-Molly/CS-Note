01 Introduction to Importing Data in Python
=========================================

# 1. Introduction and flat files

## 1.1 Import data using Python's built-in open function

* Import data from a large variety of import data sources:
	* Flat files. e.g. .txts, .csvs
	* Files from other software: Excel spreadsheets, Stata, SAS and MATLAB files
	* Relational databases: SQLite & PostgreSQL

* Plain text files 

	* containing plain text, such as the opening of Mark Twain's novel The Adventures of Huckleberry Finn
	* containing records, table data, such as titanic.csv, in which each


* Reading a text file

```python
filename = 'example.txt'
file = open(filename, mode='r') # 'r' is to read
text = file.read()
file.close()
# check whether file is closed
print(file.closed)

# print a text file
>>> print(text)
1 shear 5 20.00
2 compressional 10 2.00
3 anisotropy 30 3.50
4 perovskite 2 45.50
5 olivine 25 33.19

# writing to a file
filename = 'example.txt'
file = open(filename, mode='w') # 'w' is to write
file.close()
```

* Context manager `with`

```python
>>> with open('example.txt', 'r') as file:
...     print(file.read())
... 
1 shear 5 20.00
2 compressional 10 2.00
3 anisotropy 30 3.50
4 perovskite 2 45.50
5 olivine 25 33.19
```

* Importing text file line by line

```python
with open('moby_dick.txt') as file:
    print(file.readline()) # print the first line
    print(file.readline()) # print the second line
    print(file.readline()) # print the third line
```

## 1.2 Importing flat files using NumPy

* Why NumPy?
	* NumPy arrays: standard for storing numerical data
	* Essential for other packages: e.g. scikit-learn
	* NumPy has a number of built-in functions
		* loadtxt()
		* genfromtxt()

* Importing flat files using NumPy

```python
import numpy as np
filename = 'MNIST.txt'
data = np.loadtxt(filename, delimiter=',')

# customize: skip the first row
data = np.loadtxt(filename, delimiter=',', skiprows=1)

# only the 1st and 3rd columns
data = np.loadtxt(filename, delimiter=',', skiprows=1, usecols=[0,2])

# import different datatypes
data = np.loadtxt(filename, delimiter=',', dtype=str)

# names tells us there is a header
# dtype=None, it will figure out what types each column should be
data = np.genfromtxt('titanic.csv', delimiter=',', names=True, dtype=None)

# np.recfromcsv()
data = np.genfromtxt('titanic.csv', delimiter=',', names=True)
```

## 1.3 Importing flat files using pandas

* **What a data scientist needs**

	* Two-dimensional labeled data structure(s)
	* Columns of potentially different types
	* Manipulate, slice, reshape, groupby, join, merge
	* Perform statistics
	* Work with time series data

* **Pandas and the DataFrame**

	* Wes McKinney developed the pandas library
	* DataFrame = pythonic analog of R's data frame

* **Manipulating pandas DataFrames**

	* Exploratory data analysis
	* Data wrangling
	* Data preprocessing
	* Building models
	* Visualization 
	* Standard and best practice to use pandas

* **Importing using pandas**

```python
import pandas as pd
filename = 'winequality-red.csv'
data = pd.read_csv(filename)
data1 = pd.read_csv(filename, nrows=5, header=None)
data.head()
data_array = data.values
```

# 2. Importing data from other file types

## 2.1 Introduction to other file types

* **Other file types**
	* Excel spreadsheets
	* MATLAB files
	* SAS files
	* Stata files
	* HDF5 files

* **Pickled files**

	* File type native to Python
	* Motivation: many datatypes for which it isn't obvious how to store them
	* Pickled files are serialized
	* Serialize = convert object to bytestream

```python
import pickle
with open('pickled_fruit.pkl', 'rb') as file:
	data = pickle.load(file)
print(data)

{'peaches': 13, 'apples': 4, 'oranges': 11}
```

* **Importing Excel Spreadsheets**

```python
file = 'urbanpop.xlsx'
data = pd.ExcelFile(file)
print(data.sheet_names)

['1960-1966', '1967-1974', '1975-2011']

df1 = data.parse('1960-1966') # sheet name, as a string
df2 = data.parse(0) # sheet index, as a float
```

## 2.2 Importing SAS/Stata files using pandas

* **SAS and Stata files**

	* SAS: Statistical Analysis System
	* Stata: "Statistics" + "data"
	* SAS: business analytics and biostatistics
	* Stata: academic social sciences research

* **SAS files useds for**

	* Advanced analytics
	* Multivariate analysis
	* Business intelligence
	* Data management
	* Predictive analytics
	* Standard for computational analysis

* **Importing SAS files**

```python
import pandas as pd
from sas7bdat import SAS7BDAT
with SAS7BDAT ('urbanpop.sas7bdat') as file:
	df_sas = file.to_data_frame()
```

* **Importing Stata files**

```python
import pandas as pd
data = pd.read_stata('urbanpop.dta')
```

## 2.3 Importing HDF5 files

* **HDF5 files**

	* Hierarchical Data Format version 5
	* Standard for storing large quantities of numerical data
	* Datasets can be hundreds of gigabytes or terabytes
	* HDF5 can scale to exabytes

* **Importing HDF5 files** 

```python
import h5py
filename = 'H-H1_LOSC_4_V1-815411200-4096.hdf5'
data = h5py.File(filename, 'r') # 'r' is to read
print(type(data))

<class 'h5py._hl.files.File'>
```

* **The structure of HDF5 files**

```python
for key in data.keys():
	print(key)
	
meta
quality
strian

print(type(data['meta']))
<class 'h5py._hl.group.Group'>

for key in data['meta'].keys():
	print(key)

print(np.array(data['meta']['Description']), np.array(data['meta']['Detector']))
```

* **The HDF Project**

	* Actively maintained by the HDF Group
	* Based in Champaign, Illinois

## 2.4 Importing MATLAB files

* **MATLAB**

	* Matrix Laboratory
	* Industry standard in engineering and science
	* Data saved as .mat files

* **SciPy to the rescue!**

	* scipy.io.loadmat() - read .mat files
	* scipy.io.savemat() - write .mat files

* **Importing a .mat file**

```python
import scipy.io
filename = 'workspace.mat'
mat = scipy.io.loadmat(filename)
print(type(mat))

<class 'dict'>
```

* keys = MATLAB variable names
* values = objects assigned to variables

```python
print(type(mat['x']))
<class 'numpy.ndarray'>
```

# 3. Working with relational databases in Python

## 3.1 Introduction to relational databases

* **What is a relational database?**

	* Based on relational model of data
	* First described by Edgar "Ted" Codd

* **Relational model**

	* Widely adopted
	* Codd's 12 Rules/Commandments
		* Consists of 13 rules (zero-indexed!)
		* Describes what a Relational Database Management System should adhere to to be considered ralational

* **Relational Database Management Systems**

	* PostgreSQL
	* MySQL
	* SQLite
	* SQL = Structured Query Language

## 3.2 Creating a database engine in Python

* Creating a database engine

	* SQLite database
		* Fast and simple
	* SQLAlchemy
		* Works with many Relational Database Management Systems

```python
from sqlalchemy import create_engine
engine = create_engine('sqlite:///Northwind.sqlite')

table_names = engine.table_names()
print(table_names)
```

## 3.3 Querying relational databases in Python

* **Basic SQL query**

```
SELECT * FROM Table_Name
```

* Returns all columns of all rows of the table

```
SELECT * FROM Orders
```

* We'll use SQLAlchemy and pandas

* **Workflow of SQL querying**

	* Import packages and functions
	* Create the database engine
	* Connect to the engine
	* Query the database
	* Save query results to a DataFrame
	* Close the connection

```python
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('sqlite:///Northwind.sqlite')
con = engine.connect()
rs = con.execute("SELECT * FROM Orders")
df = pd.DataFrame(rs.fetchall())
# set column names
df.columns = rs.keys()
con.close()
```

* **Using the context manager**

```
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('sqlite:///Northwind.sqlite')

with engine.connect() as con:
	rs = con.execute("SELECT OrderID, orderDate, ShipName From Orders")
	df = pd.DataFrame(rs.fetchmany(size=5))
	df.columns = rs.keys()
```

## 3.4 Querying relational databases directly with pandas

```
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('sqlite:///Northwind.sqlite')

with engine.connect() as con:
	rs = con.execute("SELECT * FROM Orders")
	df = pd.DataFrame(rs.fetchmany())
	df.columns = rs.keys()

df = pd.read_sql_query("SELECT * FROM Orders", engine)
```

## 3.5 Advanced querying: exploiting table relationships

* **INNER JOIN in Python (pandas)**

```
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('sqlite:///Northwind.sqlite')
df = pd.read_sql_query("SELECT OrderID, CompanayName FROM Orders INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID", engine)
print(df.head())
```




















