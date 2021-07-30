# 1 Getting started in Python

## 1.1 module

* Groups related tools together
* Make it easy to know where to look for a particular tool
* Common examples:
    * `matplotlib` : create charts, aliased as `plt`
    * `pandas` : load tabular data, aliased as `pd`
    * `scikit-learn` : perform machine learning
    * `scipy` : contain statistics function
    * `nltk` : work with text data
    * `statsmodels` : used in machine learning, aliased as `sm`
    * `seaborn` : a visualization library, aliased as `sns`

* Import a module

    * `import pandas as pd`

## 1.2 variables

* Rules for variable names
    * Must start with a letter (usually lowercase)
    * After first letter, can use letters/numbers/underscores
    * No spaces or special characters
    * Case sensitive (`my_val` is different from `My_VAR`)

* Floats and strings

    * float : represents an integer or decimal number
    * string : represents text; can contain letters, numbers, spaces, and special characters
    
## 1.3 functions

* function : an action.  

`plt.plot(df.letter_index, df.frequency, label = 'Ransom')

* function name
    * starts with the module that the function "live" in (`plt`)
    * followed by the name of the function (`plot`)
    * function name is always followed by parentheses `()`


# 2 Loading Data in pandas

## 2.1 pandas

* pandas
    * Loading tabular data from different sources
    * Search for particular rows or columns
    * Calculate aggregate statistics
    * Combing data from multiple sources

* DataFrame : represents tabular data

* CSV files : comma-separated values, a common way or storing tabular data as a text-only file

* Loading a CSV

```python
import pandas as pd
df = pd.read_csv("ransom.csv")
print(df)
```

* Inspecting a DataFrame
   * head()
   * info()

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

# head() show the first few lines
>>> brics.head()
  Unnamed: 0       country    capital    area  population
0         BR        Brazil   Brasilia   8.156      200.40
1         RU        Russia      Moscw  17.100      143.50
2         IN         India  New Delhi   3.286     1252.00
3         CH         China    Beijing   9.597     1357.00
4         SA  South Africa   Pretoria   1.221       52.98

# info() show the basic points 
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

## 2.2 Selecting columns


## 2.3 Selecting rows with logic

# 3. Plotting Data with matplotlib

## 3.1 Creating line plots

## 3.2 Adding labels and legends

## 3.3 Styling graphs

# 4 Different Types of Plots

## 4.1 Making a scatter plot


## 4.2 Making a bar chart


## 4.3 Making a histograms
















































