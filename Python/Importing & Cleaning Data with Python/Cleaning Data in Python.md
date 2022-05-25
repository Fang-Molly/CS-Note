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

	* I) Value inconsistency
		* Inconsistent fields: `'married'`, `'Maried'`, `'UNMARRIED'`, `'not married'`..
		* _Trailing white spaces: _`'married'`, `' married '`..

	* II) Collapsing too many categories to few
		* Creating new groups: `0-20K`, `20-40K` categories ... from continuous household income data
		* Mapping groups to new ones: Mapping household income categories to 2 `'rich'`, `'poor'`

	* III) Making sure data is of type `category`

* **Value consistency**

> Capitalization: `'married'`, `'Married'`, `'UNMARRIED'`, `'unmarried'` ..

```python
# Get marriage status column
marriage_status = demographics['marriage_status']
marriage_status.value_counts()

# Get value counts on DataFrame
marriage_status.groupby('marriage_status').count()

# Capitalize
marriage_status['marriage_status'] = marriage_status['marriage_status'].str.upper()
marriage_status['marriage_status'].value_counts()

# Lowercase
marriage_status['marriage_status'] = marriage_status['marriage_status'].str.lower()
marriage_status['marriage_status'].value_counts()
```

> Trailing spaces: `'married '`, `'married'`, `'unmarried'`, `' unmarried'` ..

```python
# get marriage status column
marriage_status = demographics['marriage_status']
marriage_status.value_counts()

# strip all spaces
demographics = demographics['marriage_status'].str.strip()
demographics['marriage_status'].value_counts()
```

* **Collapsing data into categories**

```python
# using qcut()
import pandas as pd
group_names = ['0-200k', '200k-500k', '500k+']
demographics['income_group'] = pd.qcut(demographics['household_income'], q = 3, labels = group_names)

# print income_group column
demographics[['income_group', 'household_income']]

# using cut() - create category ranges and names
ranges = [0, 200000, 500000, np.inf]
group_names = ['0-200k', '200k-500k', '500k+']

# create income group column
demographics['income_group'] = pd.cut(demographics['household_income'], bins=ranges, labels=group_names)
demographics[['income_group', 'household_income']]
```

```python
# create mapping dictionary and replace
mapping = {'Microsoft':'DesktopOS', 'MacOS':'DesktopOS', 'Linux':'DesktopOS', 'IOS':'MobileOS', 'Android':'MobileOS'}
devices['operating_system'] = devices['operating_system'].replace(mapping)
devices['operating_system'].unique()
```

## 2.3 Cleaning text data

* **Common text data problems**

	* Data inconsistency: `+96171679912` or `0096171679912`
	* Fixed length violations: passwords needs to be at least 8 characters
	* Typos: `+961.71.679912`

```python
phones = pd.read_csv('phones.csv')

# replace "+" with "00"
phones["Phone number"] = phones["Phone number"].str.replace("+", "00")

# replace "-" with nothing
phones["Phone number"] = phones["Phone number"].str.replace("-", "")

# replace phone numbers with lower than 10 digits to NaN
digits = phones['Phone number'].str.len()
phones.loc[digits < 10, "Phone number"] = np.nan
```

* **Fixing the phone number column**

```python
# find length of each row in Phone number column
sanity_check = phone['Phone number'].str.len()

# assert minmum phone number length is 10
assert sanity_check.min() >= 10

# assert all numbers do not have "+" or "-"
assert phone['Phone number'].str.contains("+|-").any() == False
```

* **Regular expressions in action**

	* `r'\D+'`
		* `\d`: ANY ONE digit/non-digit character. Digits are [0-9]
		* `\d+`: one or more (at least one digit) digit eg 1 or 34 or 983434 etc.

```python
# replace letters with nothing
phones['Phone number'] = phones['Phone number'].str.replace(r'\D+', '')
```



# 3. Advanced data problems

## 3.1 Uniformity

```python
temperatures = pd.read_csv('temperature.csv')

# import matplotlib
import matplotlib.pyplot as plt
# create scatter plot
plt.scatter(x = 'Date', y = 'Temperature', data = temperatures)
# create title, xlabel and ylabel
plt.title('Temperature in Celsius March 2019 - NYC')
plt.xlabel('Dates')
plt.ylabel('Temperature in Celsius')
# show plot
plt.show()

# treat temperature data
temp_fah = temperatures.loc[temperatures['Temperature'] > 40, 'Temperature']
temp_cels = (temp_fah - 32) * (5/9)
temperatures.loc[temperatures['Temperature'] > 40, 'Temperature'] = temp_cels

# assert conversion is correct
assert temperatures['Temperature'].max() < 40
```

* **Datetime formatting**

> `pandas.to_datetime()`
> * Can recognize most formats automatically
> * Sometimes fails with erroneous or unrecognizable formats

```python
# converts to datetime
birthdays['Birthday'] = pd.to_datetime(birthdays['Birthday'],
					    # attempt to infer format of each date
					    infer_datetime_format=True,
					 	# return NA for rows where conversation failed
						errors = 'coerce')
# birthdays['Birthday'] = birthdays['Birthday'].dt.strftime("%d-%m-%Y")
```

## 3.2 Cross field validation

* **Motivation**

```python
import pandas as pd

flights = pd.read_csv('flights.csv')
flights.head()

sum_classes = flights[['economy_class', 'business_class', 'first_class']].sum(axis = 1)
passenger_equ = sum_classes == flights['total_passengers']

# find and filter out rows with inconsistent passenger totals
inconsistent_pass = flights[~passenger_equ]
consistent_pass = flights[passenger_equ]
```

```python
import pandas as pd
import datetime as dt

# convert to datetime and get today's date
users['Birthday'] = pd.to_datetime(users['Birthday'])
today = dt.date.today()

# for each row in the Birthday column, calculate year difference
age_manual = today.year - users['Birthday'].dt.year

# find instances where ages match
age_equ = age_manual == users['Age']

# find and filter out rows with inconsistent age
inconsistent_age = users[~age_equ]
consistent_age = users[age_equ]
```
## 3.3 Completeness




# 4. Record linkage

## 4.1 Comparing strings




## 4.2 Generating pairs





## 4.3 Linking DataFrames







