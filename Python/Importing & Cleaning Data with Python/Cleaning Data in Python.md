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






## 1.2 Data range constraints





## 1.3 Uniqueness constraints




# 2. Text and categorical data problems

## 2.1 Membership constraints

## 2.2 Categorical variables


## 2.3 Cleaning text data

# 3. Advanced data problems

## 3.1 Uniformity



## 3.2 Cross field validation



## 3.3 Completeness




# 4. Record linkage

## 4.1 Comparing strings




## 4.2 Generating pairs





## 4.3 Linking DataFrames







