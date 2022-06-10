Reshaping Data with pandas
==========================

# 1. Introduction to Data Reshaping

## 1.1 Wide and long data formats

* **Shape of data**

```python
fifa_players = pd.read_csv("fifa_players.csv")
fifa_players.shape

(3, 4)
```

* **Wide format**

	* Each feature is in a separate column
	* Each row contains many features of the same player
	* No repetition but large number of missing values
	* Simple statistics and imputation

* **Long format**

	* Each row represents one feature
	* Multiple rows for each player
	* A column to identify same player
	* Tidy data:
		* Better to summarize data
		* Key-value pairs
		* Preferred for analysis and graphing

* **Transposing a DataFrame**

```python
# set a column as index
fifa_players.set_index('club')

# select columns
fifa_players.set_index('club')[['name', 'nationality']]

# transpose
fifa_players.set_index('club')[['name', 'nationality']].transpose()
```

* **Wide to long transformation**

	* Performed using `pandas` functions, such as:
		* `.melt()`
		* `.wide_to_long()`

* **Long to wide format**

	* Transform data using `pandas` methods, for example
		* `.pivot()`
		* `.pivot_table()`

## 1.2 Reshaping using pivot method

* **From long to wide**

	* Demonstrate relationship between two columns
	* Time series operations with the variables
	* Operation that requires columns to be the unique variable

* **Pivot method**

```python
df.pivot(index="year", columns="Name", values="Weight")
```

```python
fifa = pd.read_csv('fifa_players.csv')

# Pivot a dataset
fifa.pivot(index='name', columns='variable', values='metric_system')

# Pivot multiple columns
fifa.pivot(index='name', columns='variable', values=['metric_system', 'imperial_system'])
# Omit the values parameter
fifa.pivot(index='name', columns='variable')
```

* **Duplicate entries error**

```python
another_fifa = another_fifa.drop(4, axis=0)
another_fifa.pivot(index="name", columns="variable")
```

## 1.3 Pivot tables

* **Pivot method limitations**

	* General purpose pivoting
	* Index/column pair must be unique
	* Cannot aggregate values

* **Pivot table**

```python
df.pivot_table(index="Year", columns="Name", values="Weight", aggfunc="mean")

# set variable
another_fifa.pivot_table(index="name", columns="variable", aggfunc="mean")

# Hierarchical indexes
fifa_players.pivot_table(index=["first", "last"], columns="movement", values=["overall", "attacking"], aggfunc="max")

# margins
fifa_players.pivot_table(index=["first", "last"], columns="movement", aggfunc="count", margins=True)
```

# 2. Converting Between Wide and Long Format

## 2.1 Reshaping with melt

* **Wide to long transformation**

	* Perform analytics
	* Plot different variables in the same graph

* **Melt**

```python
df.melt(id_vars=["first", "last"])

# values and variables
df.melt(id_vars=["first", "last"], value_vars=["age", "height"], var_name="feature", value_name="amount")

# specify values
books.melt(id_vars="title", value_vars=['language_code', 'num_pages'])

books.melt(id_vars="title", value_vars=['language_code', 'isbn'], var_name="feature", value_name="code")
```

## 2.2 Wide to long function

* **Wide to long function**

```python
pd.wide_to_long(df, stubnames=["age", "weight"], i="name", j="year")

pd.wide_to_long(books, stubnames=["ratings", "sold"], i="title", j="year")

pd.wide_to_long(books_with_index, stubnames=["ratings", "sold"], i="author", j="year")
```

* **DataFrame with index**

```python
books_with_index.reset_index(drop=False, inplace=True)
pd.wide_to_long(books_with_index, stubnames=['ratings', 'sold'], i=['author', 'title'], j='year')

# sep argument
pd.wide_to_long(books_with_index, stubnames=['ratings', 'sold'], i=['author', 'title'], j='year', sep='_')

# suffix argument
pd.wide_to_long(books_with_index, stubnames=['ratings', 'sold'], i=['author', 'title'], j='year', sep='_', suffix='\w+')
```

## 2.3 Working with string columns

* **String methods**

	* `pandas` Series string processing methods
	* Access easily by `str` attribute

```python
# split into two columns
books['title'].str.split(':')
# select first part as one column
books['title'].str.split(':').str.get(0)
# return two columns
books['title'].str.split(':', expand=True)

books[['main_title', 'subtitle']] = books['title'].str.split(":", expand=True)

books.drop('title', axis=1, inplace=True)
pd.wide_to_long(books, stubnames=['rating', 'sold'], i=['main_title', 'subtitle'], j='year')

# concatenate two columns
books_new['name_author'].str.cat(books_new['lastname_author'], sep=' ')

books_new['author'] = books_new['name_author'].str.cat(books_new['lastname_author'], sep=' ')

books_new.melt(id_vars='author', value_vars=['nationality', 'number_books'], var_name='feature', value_name='value')

# concatenate index
comics_marvel.index = comics_marvel.index.str.cat(comics_marvel['subtitle'], sep='-')

# split index
comics_marvel.index = comics_marvel.index.str.split('-', expand=True)

# concatenate series
new_list = ['Wolf', 'Atwood', 'Lee']
books_new['name_author'].str.cat(new_list, sep=' ')
```

# 3. Stacking and Unstacking DataFrames

## 3.1 Stacking DataFrames

* **Setting the index**

```python
churn.set_index(["country", "age"], inplace=True)
```

* **MultiIndex from array**

```python
new_array = [['yes', 'no', 'yes'], ['no', 'yes', 'yes']]
churn.index = pd.MultiIndex.from_arrays(new_array, names=['member', 'credit_card'])
```

* **MultiIndex DataFrames**

```python
index = pd.MultiIndex.from_arrays([['Wick', 'Wick', 'Shelley', 'Shelley'], 
								  ['John', 'Julien', 'Mary', 'Frank']], 
								  names=['last', 'first'])
columns = pd.MultiIndex.from_arrays([['2019', '2019', '2020', '2020'], 
									 ['age', 'weight', 'age', 'weight']], 
									 names=['year', 'feature'])
patients = pd.DataFrame(data, index=index, columns=columns)
```

* **The `.stack()` method`**

	* Rearrange a level of the columns to obtain a reshaped DataFrame with a new inner-most level row index

```python
churned_stacked = churn.stack()
patients_stacked = patients.stack()
```

* **Stack a level**

```python
# stack a level by number
patients.stack(level=0)

# stack a level by name
patients.stack(level='year')
```

## 3.2 Unstacking DataFrames

* **The `.unstack()` method**

	* Rearrange a level of the row index into the columns to obtain a reshaped DataFrame with a new inner-most level column index

```python
# unstack a dataframe
churn.unstack()

# unstack a level
churn.unstack(level=1)
churn.unstack(level='First')

# sort index
churn.unstack().sort_index(ascending=False)

# rearrange levels
churn.unstack(level=1).stack(level=0)
```

## 3.3 Working with multiple levels

* **Swap levels**

```python
df.swaplevel(0, 2, axis=1)
```

* **Unstacking multiple levels**

```python
cars.unstack(level=[0,1])
cars.unstack(level=['brand', 'model'])
```

## 3.4 Handling missing data





# 4. Advanced Reshaping

## 4.1 Reshaping and combining data




## 4.2 Transforming a list-like column





## 4.3 Reading nested data into a DataFrame





## 4.4 Dealing with nested data columns




