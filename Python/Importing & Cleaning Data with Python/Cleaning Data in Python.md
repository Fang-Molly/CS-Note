Cleaning Data in Python
=======================

# 1. Common data problems

## 1.1 Data type constraints

|Datatype  |Python data type|Example                              |
|:--------:|:--------------:|:-----------------------------------:|
|Text data |`str`           |First name, last name, address ...   |
|Integers  |`int`           |# Subcribers, # products sold ...    |
|Decimals  |`float`         |Temperature, $ exchange rates ...    |
|Binary    |`bool`          |Is married, new customer, yes/no, ...|
|Dates     |`datetime`      |Order dates, ship dates ...          |
|Categories|`category`      |Marriage status, gender ...          |

* **Strings to integers**

```python
# import CSV file and output header
sales = pd.read_csv('sales.csv')
sales.head(2)

# Get data types of columns
sales.dtypes

# Get DataFrame information
sales.info()

# Print sum of all Revenue column
sales['Revenue'].sum()

# Remove $ from Revenue column
sales['Revenue'] = sales['Revenue'].str.strip('$')
sales['Revenue'] = sales['Revenue'].astype('int')

# Verify that Revenue is now an integer
assert sales['Revenue'].dtype == 'int'
```

* **The assert statement**

```python
# this will pass
assert 1+1 == 2

# this will not pass
assert 1+1 == 3
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError
```

* **Numeric or categorical?**

```python
# convert to categorical
df["marriage_status"] = df["marriage_status"].astype('category')
df.describe()
```

## 1.2 Data range constraints

* **How to deal with out of range data?**

	* Dropping data
	* Setting custom minimums and maximums
	* Treat as missing and impute
	* Setting custom value depending on business assumptions

```python
import pandas as pd

# Output Movies with rating > 5
movies[movies['avg_rating'] > 5]

# Drop values using filtering
movies = movies[movies['avg_rating'] <= 5]

# Drop values using .drop()
movies.drop(movies[movies['avg_rating'] > 5].index, inplace = True)

# Assert results
assert movies['avg_rating'].max() <= 5

# Convert avg_rating > 5 to 5
movies.loc[movies['avg_rating'] > 5, 'avg_rating'] = 5

# Assert statement
assert movies['avg_rating'].max() <= 5
```

```python
import datetime as dt
import pandas as pd

today_date = dt.date.today()
user_signups[user_signups['subscription_date'] > dt.date.today()]

user_signups.dtypes

# convert to date
user_signups['subscription_date'] = pd.to_datetime(user_signups['subscription_date']).dt.date

# Drop values using filtering
user_signups = user_signups[user_signups['subscription_date'] < today_date]

# Drop values using .drop()
user_signups.drop(user_signups[user_signups['subscription_date'] > today_date].index, inplace = True)

# Drop values using filtering
user_signups.loc[user_signups['subscription_date'] > today_date, 'subscription_date'] = today_date

# Assert is true
assert user_signups.subscription_date.max().date() <= today_date
```

## 1.3 Uniqueness constraints

* **How to find duplicate values?**

```python
# print the header
height_weight.head()

# get duplicates across all columns
duplicates = height_weight.duplicated()
print(duplicates)

# get duplicate rows
height_weight[duplicates]
```

* **How to find duplicate rows?**

> The `.duplicated()` method
> * `subset`: list of column names to check for duplication
> * `keep`: whether to keep first, last, or all duplicate values

```python
column_names = ['first_name', 'last_name', 'address']
duplicates = height_weight.duplicated(subset = column_names, keep = False)
height_weight[duplicates]

height_weight[duplicates].sort_values(by = 'first_name')
```

* **How to treat duplicate values?**

> The `.drop_duplicates()` method
> * `subset`: list of column names to check for duplication
> * `keep`: whether to keep first, last, or all duplicate values
> * `inplace`: Drop duplicated rows directly inside DataFrame without creating new object (True)

```python
height_weight.drop_duplicates(inplace = True)
```

> The `.groupby()` and `.agg()` methods

```python
# group by column names and produce statistical summaries
column_names = ['first_name', 'last_name', 'address']
summaries = {'height': 'max', 'weight': 'mean'}
height_weight = height_weight.groupby(by = column_names).agg(summaries).reset_index()

# make sure aggregation is done
duplicates = height_weight.duplicated(subset = column_names, keep = False)
height_weight[duplicates].sort_values(by = 'first_name')d
```

# 2. Text and categorical data problems

## 2.1 Membership constraints

* **Categorical data**

```python
# read study data
study_data = pd.read_csv('study.csv')

# find inconsistent categories
inconsistent_categories = set(study_data['blood_type']).difference(categories['blood_type'])

# get the rows with inconsistent categories
inconsistent_rows = study_data['blood_type'].isin(inconsistent_categories)
study_data[inconsistent_rows]

# drop inconsistent categories and get consistent data only
consistent_data = study_data[~inconsistent_rows]
```

## 2.2 Categorical variables

* **What type of errors could we have?**









## 2.3 Cleaning text data

# 3. Advanced data problems

## 3.1 Uniformity



## 3.2 Cross field validation



## 3.3 Completeness




# 4. Record linkage

## 4.1 Comparing strings




## 4.2 Generating pairs





## 4.3 Linking DataFrames







