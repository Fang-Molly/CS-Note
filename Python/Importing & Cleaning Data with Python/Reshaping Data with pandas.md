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






# 2. Converting Between Wide and Long Format

## 2.1 Reshaping with melt







## 2.2 Wide to long function







## 2.3 Working with string columns









# 3. Stacking and Unstacking DataFrames

## 3.1 Stacking DataFrames



## 3.2 Unstacking DataFrames




## 3.3 Working with multiple levels



## 3.4 Handling missing data





# 4. Advanced Reshaping

## 4.1 Reshaping and combining data




## 4.2 Transforming a list-like column





## 4.3 Reading nested data into a DataFrame





## 4.4 Dealing with nested data columns




