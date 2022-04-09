Intermediate Python
====================

# 1 Matplotlib

## 1.1 Basic plots with Matplotlib

* Matplotlib : visualization packages
    * pyplot : subpackage
        
> Line plot

```python
>>> import matplotlib.pyplot as plt   # or `from matplotlib import pyplot as plt` 
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

> Bar chart

```python
plt.bar(df.precinct, df.pets_abducted)
plt.ylabel('Pet Abductions')
plt.show()
```

* Horizontal bar charts

```python
plt.barh(df.precinct, df.pets_abducted)
plt.ylabel('Pet Abductions')
plt.show()
```

* Adding error bars

```python
plt.bar(df.precinct, df.pet_abductions, yerr=df.error)
plt.ylabel('Pet Abductions')
plt.show()
```

* Stacked bar charts

```python
plt.bar(df.precinct, df.dog, label='Dog')
plt.bar(df.precinct, df.cat, bottom=df.dog, label='Cat')
plt.legend()
plt.show()
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

* changing range

```python
plt.hist(data, range=(xmin, xmax))
plt.hist(gravel.mass, range(50, 100))
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

* Normalizing

```python
plt.hist(male_weight, density=True)
plt.hist(female_weight, density=True)
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
* Legends

```python
plt.plot(aditya.days, aditya.cases, label="Aditya")
plt.plot(deshaun.days, deshaun.cases, label="Dechaun")
plt.plot(mengfei.days, mengfei.cases, label="Mengfei")
plt.legend()
```

* Changing colors transparency

    * alpha: 0-1, 0 is totally transparent, 1 is not at all transparent

```python
# Specify c and alpha inside plt.scatter()
plt.scatter(x = gdp_cap, y = life_exp, s = np.array(pop) * 2, c = col, alpha = 0.8)
```

* Add text

```python
plt.text(1550, 71, 'India')
plt.text(5700, 80, 'China')
```
* Add grid

```python
plt.grid(True)
```

* Change font size

`plt.title("Plot title", fontsize=20)`

* Change font color

`plt.legend(color="green")`

* Changing line color

`plt.plot(x, y1, color="orange")`

* Changing line width

`plt.plot(x, y1, linewidth=1)`

* Changing line style

`plt.plot(x, y1, linestyle='-')`

'-', '--', '-.', ':'    

* Adding markers

`plt.plot(x, y1, marker='x')`

'x', 's', 'o', 'd', '*', 'h'.  

* Setting a style

`plt.style.use('fivethirtyeight')`

    * `fivethirtyeight` - Based on the color scheme of the popular website
    * `grayscale` - Great for when you don't have a color printer!
    * `seaborn` - Based on another Python visualization library
    * `classic` - The default color scheme for Matplotlib
    * `ggplot`
 

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
```
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv")
>>> brics
  Unnamed: 0       country    capital    area  population
0         BR        Brazil   Brasilia   8.156      200.40
1         RU        Russia      Moscw  17.100      143.50
2         IN         India  New Delhi   3.286     1252.00
3         CH         China    Beijing   9.597     1357.00
4         SA  South Africa   Pretoria   1.221       52.98

# show the first few lines
>>> brics.head()
  Unnamed: 0       country    capital    area  population
0         BR        Brazil   Brasilia   8.156      200.40
1         RU        Russia      Moscw  17.100      143.50
2         IN         India  New Delhi   3.286     1252.00
3         CH         China    Beijing   9.597     1357.00
4         SA  South Africa   Pretoria   1.221       52.98

# show the basic points of the data
>>> brics.info()
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 5 entries, 0 to 4
Data columns (total 5 columns):
 #   Column      Non-Null Count  Dtype  
---  ------      --------------  -----  
 0   Unnamed: 0  5 non-null      object 
 1   country     5 non-null      object 
 2   capital     5 non-null      object 
 3   area        5 non-null      float64
 4   population  5 non-null      float64
dtypes: float64(2), object(3)
memory usage: 328.0+ bytes
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
# select with brackets and string
>>> brics['country']
BR          Brazil
RU          Russia
IN           India
CH           China
SA    South Africa
Name: country, dtype: object

# different types from single bracket and double bracket
>>> type(brics['country'])
<class 'pandas.core.series.Series'>
>>> type(brics[['country']])
<class 'pandas.core.frame.DataFrame'>

# select multiple columns
>>> brics[['country', 'capital']]
         country    capital
BR        Brazil   Brasilia
RU        Russia      Moscw
IN         India  New Delhi
CH         China    Beijing
SA  South Africa   Pretoria

# select with a dot
>>> brics.country
0          Brazil
1          Russia
2           India
3           China
4    South Africa
Name: country, dtype: object
>>> type(brics.country)
<class 'pandas.core.series.Series'>
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

>>> brics.area > 8
0     True
1     True
2    False
3     True
4    False
Name: area, dtype: bool
>>> brics[brics.area > 8]
  Unnamed: 0 country   capital    area  population
0         BR  Brazil  Brasilia   8.156       200.4
1         RU  Russia     Moscw  17.100       143.5
3         CH   China   Beijing   9.597      1357.0
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

```python
>>> error = 50.0
>>> while error > 1 :
...     error = error / 4
...     print(error)
... 
12.5
3.125
0.78125
```
```python
# Initialize offset
offset = -6

# Code the while loop
while offset != 0 :
    print("correcting...")
    if offset > 0 :
        offset = offset - 1
    else : 
        offset = offset + 1   
    print(offset)
```

## 4.2 `for` lopp

```python
>>> fam = [1.73, 1.68, 1.71, 1.89]
>>> for height in fam :
...     print(height)
... 
1.73
1.68
1.71
1.89

>>> fam = [1.73, 1.68, 1.71, 1.89]
>>> for index, height in enumerate(fam) :
...     print("index" + str(index) + ":" + str(height))
... 
index0:1.73
index1:1.68
index2:1.71
index3:1.89

>>> for c in "family" :
...     print(c.capitalize())
... 
F
A
M
I
L
Y
```

## 4.3 Loop Data Structures

* Dictionary : `for key, val in my_dict.items() :`

```python
>>> world = {"afghanistan":30.55, "albania":2.77, "algeria":39.21}
>>> for key, value in world.items() :
...     print(key + " is " + str(value))
... 
afghanistan is 30.55
albania is 2.77
algeria is 39.21
```

* Numpy Arrays : `for val in np.nditer(my_array) :`

```python
>>> import numpy as np
>>> np_height = np.array([1.73, 1.68, 1.71, 1.89, 1.79])
>>> np_weight = np.array([65.4, 59.2, 63.6, 88.4, 68.7])
>>> bmi = np_weight / np_height ** 2
>>> for val in bmi :
...     print(val)
... 
21.85171572722109
20.97505668934241
21.750282138093777
24.74734749867025
21.44127836209856
```

* 2D Numpy Arrays

```python
>>> import numpy as np
>>> np_height = np.array([1.73, 1.68, 1.71, 1.89, 1.79])
>>> np_weight = np.array([65.4, 59.2, 63.6, 88.4, 68.7])
>>> means = np.array([np_height, np_weight])
>>> for val in means :
...     print(val)
... 
[1.73 1.68 1.71 1.89 1.79]
[65.4 59.2 63.6 88.4 68.7]

>>> import numpy as np
>>> np_height = np.array([1.73, 1.68, 1.71, 1.89, 1.79])
>>> np_weight = np.array([65.4, 59.2, 63.6, 88.4, 68.7])
>>> means = np.array([np_height, np_weight])
>>> for val in np.nditer(means) :
...     print(val)
... 
1.73
1.68
1.71
1.89
1.79
65.4
59.2
63.6
88.4
68.7
```

* `iterrows()`

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv", index_col = 0)
>>> for val in brics :
...     print(val)
... 
country
capital
area
population

# iterrows
>>> for lab, row in brics.iterrows():
...     print(lab)
...     print(row)
... 
BR
country         Brazil
capital       Brasilia
area             8.156
population       200.4
Name: BR, dtype: object
RU
country       Russia
capital        Moscw
area            17.1
population     143.5
Name: RU, dtype: object
IN
country           India
capital       New Delhi
area              3.286
population       1252.0
Name: IN, dtype: object
CH
country         China
capital       Beijing
area            9.597
population     1357.0
Name: CH, dtype: object
SA
country       South Africa
capital           Pretoria
area                 1.221
population           52.98
Name: SA, dtype: object
```

* selective print

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv", index_col = 0)
>>> for lab, row in brics.iterrows():
...     print(lab + ": " + row["capital"])
... 
BR: Brasilia
RU: Moscw
IN: New Delhi
CH: Beijing
SA: Pretoria
```

* add column

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv", index_col = 0)
>>> for lab, row in brics.iterrows() :
...     brics.loc[lab, "name_length"] = len(row["country"])
... 
>>> print(brics)
         country    capital    area  population  name_length
BR        Brazil   Brasilia   8.156      200.40          6.0
RU        Russia      Moscw  17.100      143.50          6.0
IN         India  New Delhi   3.286     1252.00          5.0
CH         China    Beijing   9.597     1357.00          5.0
SA  South Africa   Pretoria   1.221       52.98         12.0
```

* `apply()`

```python
>>> import pandas as pd
>>> brics = pd.read_csv("brics.csv", index_col = 0)
>>> brics["name_length"] = brics["country"].apply(len)
>>> print(brics)
         country    capital    area  population  name_length
BR        Brazil   Brasilia   8.156      200.40            6
RU        Russia      Moscw  17.100      143.50            6
IN         India  New Delhi   3.286     1252.00            5
CH         China    Beijing   9.597     1357.00            5
SA  South Africa   Pretoria   1.221       52.98           12
```

# 5 Case Studay: Hacker Statistics

## 5.1 Random Numbers

* Random generators

```python
>>> import numpy as np
>>> np.random.rand()
0.2667909160527513

# starting from a seed
>>> np.random.seed(123) # same seed: same random numbers!
>>> np.random.rand()
0.6964691855978616
>>> np.random.rand()
0.28613933495037946
```

```python
>>> import numpy as np
>>> np.random.seed(123)
>>> coin = np.random.randint(0,2)
>>> print(coin)
0
>>> if coin == 0 :
...     print("heads")
... else:
...     print("tails")
... 
heads
```

## 5.2 Random Walk

```python
>>> import numpy as np
>>> np.random.seed(123)
>>> outcomes = []
>>> for x in range(10) :
...     coin = np.random.randint(0,2)
...     if coin == 0 :
...         outcomes.append("heads")
...     else :
...         outcomes.append("tails")
... 
>>> print(outcomes)
['heads', 'tails', 'heads', 'heads', 'heads', 'heads', 'heads', 'tails', 'tails', 'heads']
```

```python
>>> import numpy as np
>>> np.random.seed(123)
>>> tails = [0]
>>> for x in range(10) :
...     coin = np.random.randint(0,2)
...     tails.append(tails[x] + coin)
... 
>>> print(tails)
[0, 0, 1, 1, 1, 1, 1, 1, 2, 3, 3]
```

## 5.3 Distribution

* Distribution

```python
>>> import numpy as np
>>> np.random.seed(123)
>>> final_tails = []
>>> for x in range(100) :
...     tails = [0]
...     for x in range(10) :
...         coin = np.random.randint(0,2)
...         tails.append(tails[x] + coin)
...     final_tails.append(tails[-1])
... 
>>> print(final_tails)
[3, 6, 4, 5, 4, 5, 3, 5, 4, 6, 6, 8, 6, 4, 7, 5, 7, 4, 3, 3, 4, 5, 8, 5, 6, 5, 7, 6, 4, 5, 8, 5, 8, 4, 6, 6, 3, 4, 5, 4, 7, 8, 9, 4, 3, 4, 5, 6, 4, 2, 6, 6, 5, 7, 5, 4, 5, 5, 6, 7, 6, 6, 6, 3, 6, 3, 6, 5, 6, 5, 6, 4, 6, 6, 3, 4, 4, 2, 4, 5, 4, 6, 6, 6, 8, 4, 6, 5, 7, 4, 6, 5, 4, 6, 7, 3, 7, 4, 5, 7]
```

* Histogram

```python
>>> import numpy as np
>>> import matplotlib.pyplot as plt
>>> np.random.seed(123)
>>> final_tails = []
>>> for x in range(100) :
...     tails = [0]
...     for x in range(10) :
...         coin = np.random.randint(0, 2)
...         tails.append(tails[x] + coin)
...     final_tails.append(tails[-1])
... 
>>> plt.hist(final_tails, bins = 10)
(array([ 2., 10., 23.,  0., 21., 27.,  0., 10.,  6.,  1.]), array([2. , 2.7, 3.4, 4.1, 4.8, 5.5, 6.2, 6.9, 7.6, 8.3, 9. ]), <BarContainer object of 10 artists>)
>>> plt.show()
```









