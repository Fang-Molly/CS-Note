# 1 Matplotlib

## 1.1 Basic plots with Matplotlib

* Matplotlib : visualization packages
    * pyplot : subpackage
        
> Line plot

```python
>>> import matplotlib.pyplot as plt
>>> year = [1950, 1970, 1990, 2010]
>>> pop = [2.519, 3.692, 5.263, 6.972]
>>> plt.plot(year, pop)
[<matplotlib.lines.Line2D object at 0x7f9b5f4636a0>]
>>> plt.show()  # display a plot
```

> Scatter plot
    
```python
>>> import matplotlib.pyplot as plt
>>> year =[1950, 1970, 1990, 2010]
>>> pop = [2.519, 3.692, 5.263, 6.972]
>>> plt.scatter(year, pop)
<matplotlib.collections.PathCollection object at 0x7f9b60fc0a00>
>>> plt.show()
```

```python
# put the x-axis on a logarithmic scale
plt.xscale('log')
```

## 1.2 Histogram

* Histogram

    * Explore dataset
    * Get idea about distribution

* Matplotlib 

```python
>>> import matplotlib.pyplot as plt
>>> values = [0, 0.6, 1.4, 1.6, 2.2, 2.5, 2.6, 3.2, 3.5, 3.9, 4.2, 6]
>>> plt.hist(values, bins=3)
(array([4., 6., 2.]), array([0., 2., 4., 6.]), <BarContainer object of 3 artists>)
>>> plt.show()
```

* `plt.clf()` clean it up again so you can start afresh

```python
# Build histogram with 5 bins
plt.hist(life_exp, bins=5)

# Show and clean up plot
plt.show()
plt.clf()

# Build histogram with 20 bins
plt.hist(life_exp, bins=20)

# Show and clean up again
plt.show()
plt.clf()
```

## 1.3 Customization

* Data visualization

    * Many options
        * Different plot types
        * Many customizations

    * Choice depends on
        * Data
        * Story you want to tell

*  Customization plot

```python
import matplotlib.pyplot as plt
year = [1950, 1951, 1952, ... , 2100]
pop = [2.538, 2.57, 2.62, ..., 10.85]

# add more data
year = [1800, 1850, 1900] + year
pop = [1.0, 1.262, 1.650] + pop

plt.plot(year, pop)

# Axis labels
plt.xlabel('Year')
plt.ylabel('Population')

# Title
plt.title('World Population Projections')

# Ticks
plt.yticks([0, 2, 4, 6, 8, 10],
           ['0', '2B', '4B', '6B', '8B', '10B'])

plt.show()
```

* Colors
    * alpha: 0-1, 0 is totally transparent, 1 is not at all transparent

```python
# Specify c and alpha inside plt.scatter()
plt.scatter(x = gdp_cap, y = life_exp, s = np.array(pop) * 2, c = col, alpha = 0.8)
```

* Additional customizations

```python
# Additional customizations
plt.text(1550, 71, 'India')
plt.text(5700, 80, 'China')

# add grid() call
plt.grid(True)
```

# 2 Dictionaries & Pandas

## 2.1 Dictionaries

* List

```python
>>> pop = [30.55, 2.77, 39.21]
>>> countries = ["afghanistan", "albania", "algeria"]
>>> ind_alb = countries.index("albania")
>>> ind_alb
1
>>> pop[ind_alb]
2.77
```

* Dictionaries

```python
>>> world = {"afghanistan":30.55, "albania":2.77, "algeria":39.21}
>>> world
{'afghanistan': 30.55, 'albania': 2.77, 'algeria': 39.21}
>>> world["albania"]
2.77
# keys() method
>>> world.keys()
dict_keys(['afghanistan', 'albania', 'algeria'])
```

* Keys have to be "immutable" objects
    * list cann't be keys

```python
>>> {0:"hello", True:"dear", "two":"world"}
{0: 'hello', True: 'dear', 'two': 'world'}
>>> {["just", "to", "test"]: "value"}
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'
```

```python
# add elements
>>> world = {"afghanistan":30.55, "albania":2.77, "algeria":39.21}
>>> world["sealand"] = 0.000027
>>> world
{'afghanistan': 30.55, 'albania': 2.77, 'algeria': 39.21, 'sealand': 2.7e-05}

# in
>>> "sealand" in world
True

# update  the element
>>> world["sealand"] = 0.000028
>>> world
{'afghanistan': 30.55, 'albania': 2.77, 'algeria': 39.21, 'sealand': 2.8e-05}

# remove the element
>>> del(world['sealand'])
>>> world
{'afghanistan': 30.55, 'albania': 2.77, 'algeria': 39.21}
```

* List vs Dictionary

 
## 2.2 Pandas

* Tabular dataset

* Datasets in Python

    * 2D Numpy array
        * One data type

    * pandas!
        * High level data manipulation tool
        * Wes Mckinney
        * Built on Numpy
        * DataFrame

* DataFrame from Dictionary

```python
>>> dict = {
... "country" : ["Brazil", "Russia", "India", "China", "South Africa"],
... "capital" : ["Brasilia", "Moscw", "New Delhi", "Beijing", "Pretoria"],
... "area" : [8.156, 17.10, 3.286, 9.597, 1.221],
... "population" : [200.4, 143.5, 1252, 1357, 52.98]}
>>> import pandas as pd
>>> brics = pd.DataFrame(dict)
>>> brics
        country    capital    area  population
0        Brazil   Brasilia   8.156      200.40
1        Russia      Moscw  17.100      143.50
2         India  New Delhi   3.286     1252.00
3         China    Beijing   9.597     1357.00
4  South Africa   Pretoria   1.221       52.98

# update the index
>>> brics.index = ["BR", "RU", "IN", "CH", "SA"]
>>> brics
         country    capital    area  population
BR        Brazil   Brasilia   8.156      200.40
RU        Russia      Moscw  17.100      143.50
IN         India  New Delhi   3.286     1252.00
CH         China    Beijing   9.597     1357.00
SA  South Africa   Pretoria   1.221       52.98
```

* DataFrame from CSV file

    * CSV = comma-separated values
    
> brics.csv          
,country,capital,area,population
BR,Brazil,Brasilia,8.156,200.40
RU,Russia,Moscw,17.100,143.50
IN,India,New Delhi,3.286,1252.00
CH,China,Beijing,9.597,1357.00
SA,South Africa,Pretoria,1.221,52.98

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv")
>>> brics
  Unnamed: 0       country    capital    area  population
0         BR        Brazil   Brasilia   8.156      200.40
1         RU        Russia      Moscw  17.100      143.50
2         IN         India  New Delhi   3.286     1252.00
3         CH         China    Beijing   9.597     1357.00
4         SA  South Africa   Pretoria   1.221       52.98

# set the first column as row labels
>>> brics = pd.read_csv("brics.csv", index_col=0)
>>> brics
         country    capital    area  population
BR        Brazil   Brasilia   8.156      200.40
RU        Russia      Moscw  17.100      143.50
IN         India  New Delhi   3.286     1252.00
CH         China    Beijing   9.597     1357.00
SA  South Africa   Pretoria   1.221       52.98
```

* Index and select data

    * square brackets: limited functionality
        * Column access `brics[["country", "capital"]]
        * Row access: only through slicing  `brics[1:4]`
    * ideally
        * 2D Numpy arrays
        * my_array[rows, columns]
    * pandas
        * loc (label-based)
            * Row access `brics.loc[["RU", "IN", "CH"]]
            * Column access `brics.loc[:, ["country", "capital"]]
            * Row & Column access  `brics.loc[["RU", "IN", "CH"], ["country", "capital"]]`
        * illoc (integer position-based)
                
> Column Access []

```python
>>> brics['country']
BR          Brazil
RU          Russia
IN           India
CH           China
SA    South Africa
Name: country, dtype: object

>>> type(brics['country'])
<class 'pandas.core.series.Series'>
>>> type(brics[['country']])
<class 'pandas.core.frame.DataFrame'>

>>> brics[['country', 'capital']]
         country    capital
BR        Brazil   Brasilia
RU        Russia      Moscw
IN         India  New Delhi
CH         China    Beijing
SA  South Africa   Pretoria
```

> Row Access []

```python
>>> brics[1:4]
   country    capital    area  population
RU  Russia      Moscw  17.100       143.5
IN   India  New Delhi   3.286      1252.0
CH   China    Beijing   9.597      1357.0
```

* Row Access loc

```python
>>> brics.loc["RU"]
country       Russia
capital        Moscw
area            17.1
population     143.5
Name: RU, dtype: object

>>> brics.loc[["RU"]]
   country capital  area  population
RU  Russia   Moscw  17.1       143.5

>>> brics.loc[["RU", "IN", "CH"]]
   country    capital    area  population
RU  Russia      Moscw  17.100       143.5
IN   India  New Delhi   3.286      1252.0
CH   China    Beijing   9.597      1357.0

>>> brics.loc[["RU", "IN", "CH"], ["country", "capital"]]
   country    capital
RU  Russia      Moscw
IN   India  New Delhi
CH   China    Beijing

>>> brics.loc[:, ["country", "capital"]]
         country    capital
BR        Brazil   Brasilia
RU        Russia      Moscw
IN         India  New Delhi
CH         China    Beijing
SA  South Africa   Pretoria
```

* Row Access iloc

```python
>>> brics.iloc[[1]]
   country capital  area  population
RU  Russia   Moscw  17.1       143.5

>>> brics.iloc[[1,2,3]]
   country    capital    area  population
RU  Russia      Moscw  17.100       143.5
IN   India  New Delhi   3.286      1252.0
CH   China    Beijing   9.597      1357.0

# row & column iloc
>>> brics.iloc[[1,2,3],[0,1]]
   country    capital
RU  Russia      Moscw
IN   India  New Delhi
CH   China    Beijing

>>> brics.iloc[:, [0,1]]
         country    capital
BR        Brazil   Brasilia
RU        Russia      Moscw
IN         India  New Delhi
CH         China    Beijing
SA  South Africa   Pretoria
```

# 3 Logic, Control Flow and Filtering

> Overview

* Comparison operators : `<`, `>`, `>=`, `<=`, `==`, `!=`
* Boolean operators : `and`, `or`, `not`
* Conditional statements : `if`, `else`, `elif`

## 3.1 Comparison Operators

* Numeric comparisons

```python
>>> 2 < 3
True
>>> 2 == 3
False
>>> 2 <= 3
True
>>> 3 <= 3
True
>>> x = 2
>>> y = 3
>>> x < y
True
```

* Other comparisons

```python
>>> "carl" < "chris"
True
>>> 3 < "chris"
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '<' not supported between instances of 'int' and 'str'
>>> 3 < 4.1
True
```

* Comparators

    * `<` : less than
    * `<=` : less than or equal
    * `>` : greater than
    * `>=` : greater than or equal
    * `==` : equal
    * `!=` : not equal

## 3.2 Boolean Operators

 * `and`

```Python
>>> True and True
True
>>> False and True
False
>>> True and False
False
>>> False and False
False
>>> x = 12
>>> x > 5 and x < 15
True
```

 * `or`

```python
>>> True or True
True
>>> False or True
True
>>> True or False
True
>>> False or False
False
>>> y = 5
>>> y < 7 or y > 13
True
```

 * `not`

```python
>>> not True
False
>>> not False
True
```

* NumPy

```python
>>> bmi
array([21.85171573, 20.97505669, 21.75028214, 24.7473475 , 21.44127836])
>>> bmi > 21
array([ True, False,  True,  True,  True])
>>> bmi < 22
array([ True,  True,  True, False,  True])
>>> bmi > 21 and bmi < 22
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: The truth value of an array with more than one element is ambiguous. Use a.any() or a.all()
```

> logical_and()
    
```python    
>>> np.logical_and(bmi > 21, bmi < 22)
array([ True, False,  True, False,  True])
>>> bmi[np.logical_and(bmi > 21, bmi < 22)]
array([21.85171573, 21.75028214, 21.44127836])
```

> logical_or()


> logical_not()


## 3.3 if, elif, else

* `if`

```python
>>> z = 4
>>> if z % 2 == 0 :   # True
...     print("z is even")
... 
z is even
```

```python
>>> z = 4
>>> if z % 2 == 0 :
...     print("checking " + str(z))
...     print("z is even")
... 
checking 4
z is even
```

* `else`

```python
>>> z = 5
>>> if z % 2 == 0 :
...     print("z is even")
... else:
...     print("z is odd")
... 
z is odd
```

* `elif`

```python
>>> z = 3
>>> if z % 2 == 0 :
...     print("z is divisible by 2")
... elif z % 3 == 0 :
...     print("z is divisible by 3")
... else:
...     print("z is neither divisible by 2 nor by 3")
... 
z is divisible by 3
```

## 3.4 Filtering pandas DataFrames

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv", index_col = 0)
>>> brics
         country    capital    area  population
BR        Brazil   Brasilia   8.156      200.40
RU        Russia      Moscw  17.100      143.50
IN         India  New Delhi   3.286     1252.00
CH         China    Beijing   9.597     1357.00
SA  South Africa   Pretoria   1.221       52.98

# select the column
>>> brics["area"]
BR     8.156
RU    17.100
IN     3.286
CH     9.597
SA     1.221
Name: area, dtype: float64

# do comparison on the column
>>> brics["area"] > 8
BR     True
RU     True
IN    False
CH     True
SA    False
Name: area, dtype: bool

# use result to select countries
>>> is_huge = brics["area"] > 8
>>> is_huge
BR     True
RU     True
IN    False
CH     True
SA    False
Name: area, dtype: bool
>>> brics[is_huge]
   country   capital    area  population
BR  Brazil  Brasilia   8.156       200.4
RU  Russia     Moscw  17.100       143.5
CH   China   Beijing   9.597      1357.0
```

* Boolean operators

```python
>>> import numpy as np
>>> np.logical_and(brics["area"] > 8, brics["area"] < 10)
BR     True
RU    False
IN    False
CH     True
SA    False
Name: area, dtype: bool
>>> brics[np.logical_and(brics["area"] > 8, brics["area"] < 10)]
   country   capital   area  population
BR  Brazil  Brasilia  8.156       200.4
CH   China   Beijing  9.597      1357.0
```

# 4 Loops

## 4.1 `while` loop




## 4.2 `for` lopp







## 4.3 Loop Data Structures







# 5 Case Studay: Hacker Statistics

## 5.1 Random Numbers








## 5.2 Random Walk









## 5.3 Distribution












