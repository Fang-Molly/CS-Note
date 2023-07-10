Data Manipulation with pandas
=============================

# 1. Transforming DataFrames

## 1.1 Introducing DataFrames

* pandas is a Python package for data manipulation.
* pandas is built on NumPy and Matplotlib.

```python
print(dogs)

dogs.head()

dogs.info()

dogs.shape

dogs.describe()

dogs.values

dogs.columns

dogs.index
```

## 1.2 Sorting and subsetting

* **Sorting**

```python
dogs.sort_values("weight_kg")

# sort in descending order
dogs.sort_values("weight_kg", ascending=False)

# sort by multiple variables
dogs.sort_values(["weight_kg", "height_cm"])
dogs.sort_values(["weight_kg", "height_cm"], ascending=[True, False])

# Subsetting columns
dogs["name"]
dogs[["breed", "height_cm"]]

cols_to_subset = ["breed", "height_cm"]
dogs[cols_to_subset]

# Subsetting rows
dogs["height_cm"] > 50
dogs[dogs["height_cm"] > 50]
dogs[dogs["breed"] == "Labrador"]
dogs[dogs["date_of_birth"] < "2015-01-01"]

# Subsetting based on multiple conditions
is_lab = dogs["breed"] == "Labrador"
is_brown = dogs["color"] == "Brown"
dogs[is_lab & is_brown]

dogs[(dogs["breed"] == "Labrador") & (dogs["color"] == "Brown")]

# Subsetting using.isin()
is_black_or_brown = dogs["colors"].isin(["Black", "Brown"])
dog[is_black_or_brown]
```

## 1.3 New columns

* **Adding a new column**

```python
dogs["height_m"] = dogs["height_cm"] / 100
print(dogs)

dogs["bmi"] = dogs["weight_kg"] / dogs["height_m"] ** 2
print(dogs.head())
```

* **Multiple manipulations**

```python
bmi_lt_100 = dogs[dogs["bmi"] < 100]
bmi_lt_100_height = bmi_lt_100.sort_values("height_cm", ascending=False)
bmi_lt_100_height[["name", "height_cm", "bmi]]
```

# 2. Aggregating DataFrames

## 2.1 Summary statistics

* **Summarizing numerical data**

> `.mean()`, `.median()`, `.mode()`, `.min()`, `.max()`, `.var()`, `.std()`, `.sum()`, `.quantile()`

```python
dogs["height_cm"].mean()
```

* **The `.agg()` method**

```python
def pct30(column):
	return column.quantile(0.3)
	
dogs["weight_kg"].agg(pct30)

dogs[["weight_kg", "height_cm"]].agg(pct30)
```

* **Multiple summaries**

```python
def pct40(column):
	return column.quantile(0.4)
	
dogs["weight_kg"].agg([pct30, pct40])
```

* **Cumulative sum**

> `.cumsum()`, `.cummax()`, `.cummin()`, `.cumprod()`

```python
dogs["weight_kg"].cumsum()
```

## 2.2 Counting

* **Dropping duplicate names**

```python
vet_visits.drop_duplicates(subset="name")

# drop duplicate pairs
unique_dogs = vet_visits.drop_duplicates(subset=["name", "breed"])

unique_dogs["breed"].value_counts()

# sort
unique_dogs["breed"].value_counts(sort=True)

# proportions
unique_dogs["breed"].value_counts(normalize=True)
```

## 2.3 Grouped summary statistics

* **Summaries by group**

```python
dogs[dogs["color"] == "Black"]["weight_kg"].mean()
dogs[dogs["color"] == "Brown"]["weight_kg"].mean()
dogs[dogs["color"] == "White"]["weight_kg"].mean()
dogs[dogs["color"] == "Gray"]["weight_kg"].mean()
dogs[dogs["color"] == "Tan"]["weight_kg"].mean()

# Grouped summaries
dogs.groupby("color")["weight_kg"].mean()

# multiple grouped summaries
dogs.groupby("color")["weight_kg"].agg([min, max, sum])

# group by multiple variables
dogs.groupby(["color", "breed"])["weight_kg"].mean()

# many groups, many summaries
dogs.groupby(["color", "breed"])[["weight_kg", "height_cm"]].mean()
```

## 2.4 Pivot tables

* **Group by to pivot table**

```python
dogs.groupby("color")["weight_kg"].mean()

dogs.pivot_table(values="weight_kg", index="color")
```

* **Different statistics**

```python
import numpy as np
dogs.pivot_table(values="weight_kg", index="color", aggfunc=np.median)

# multiple statistics
dogs.pivot_table(values="weight_kg", index="color", aggfunc=[np.mean, np.median])
```

* **Pivot on two variables**

```python
dogs.groupby(["color", "breed"])["weight_kg"].mean()

dogs.pivot_table(values="weight_kg", index="color", columns="breed")

# fill missing values in pivot tables
dogs.pivot_table(values="weight_kg", index="color", columns="breed", fill_value=0)

# sum with pivot tables
dogs.pivot_table(values="weight_kg", index="color", columns="breed", fill_value=0, margins=True)
```

# 3. Slicing and Indexing DataFrames

## 3.1 Explicit indexes

* **`.columns` and `.index`**

```python
dogs.columns

dogs.index
```

* **Setting a column as the index**

```python
dogs_ind = dogs.set_index("name")
print(dogs_ind)
# Index values don't need to be unique
```

* **Removing an index**

```python
# reset the index, keep its contents
dogs_ind.reset_index()

# reset the index, drop its contents
dogs_ind.reset_index(drop=True)
```

* **Indexes make subsetting simpler**

```python
dogs[dogs["name"].isin(["Bella", "Stella"])]

dogs_ind.loc[["Bella", "Stella"]]
```

* **Subsetting on duplicated index values**

```python
dogs_ind2 = dogs.set_index("breed")

dogs_ind2.loc["Labrador"]
```

* **Multi-level indexes a.k.a. hierarchical indexes**

```python
dogs_ind3 = dogs.set_index(["breed", "color"])

# subset the outer level with a list
dogs_ind3.loc[["Labrador", "Chihuahua"]]

# subset inner levels with a list of tuples
dogs_ind3.loc[[("Labrador", "Brown"), ("Chihuahua", "Tan")]]

# sort by index values
dogs_ind3.sort_index()

# control sort_index
dogs_ind3.sort_index(level=["color", "breed"], ascending=[True, False])
```

## 3.2 Slicing and subsetting with .loc and .iloc

* **Slicing lists**

```python
breeds = ["Labrador", "Poodle", "Chow Chow", "Schnauzer", "Labrador", "Chihuahua", "St. Bernard"]

>>> breeds[2:5]
['Chow Chow', 'Schnauzer', 'Labrador']

>>> breeds[:3]
['Labrador', 'Poodle', 'Chow Chow']

>>> breeds[:]
['Labrador', 'Poodle', 'Chow Chow', 'Schnauzer', 'Labrador', 'Chihuahua', 'St. Bernard']
```

* **Sort the index before you slice

```python
dogs_srt = dogs.set_index(["breed", "color"]).sort_index()
print(dogs_srt)

# slice the outer index level
dogs_srt.loc["Chow Chow":"Poodle"]

# slice the inner index levels badly
dogs_srt.loc["Tan":"Grey"]

# slice the inner index levels correctly
dogs_srt.loc[("Labrador", "Brown"):("Schnauzer", "Grey")]
```

* **Slicing columns**

```python
dogs_srt.loc[:, "name":"height_cm"]

# slice twice
dogs_srt.loc[("Labrador", "Brown"):("Schnauzer", "Grey"), "name":"height_cm"]
```

```python
dogs = dogs.set_index("date_of_birth").sort_index()
print(dogs)

# slice by date
dogs.loc["2014-08-25":"2016-09-16"]

# slice by partial dates
dogs.loc["2014":"2016"]

# subset by row/column number
print(dogs.iloc[2:5, 1:4])
```

## 3.3 Working with pivot tables

* **Pivoting the dog pack**

```python
dogs_height_by_bread_vs_color = dog_pack.pivot_table("height_cm", index="breed", columns="color")

print(dogs_height_by_breed_vs_color)

# .loc + slicing is a power combo
dogs_height_by_breed_vs_color.loc["Chow Chow":"Poodle"]

# The axis argument
dogs_height_by_breed_vs_color.mean(axis="index")

dogs_height_by_breed_vs_color.mean(axis="columns")
```

```python
# Add a year column to temperatures
temperatures["year"] = temperatures["date"].dt.year

# Pivot avg_temp_c by country and city vs year
temp_by_country_city_vs_year = temperatures.pivot_table("avg_temp_c", index = ["country", "city"], columns = "year")
```

# 4. Creating and Visualizing DataFrames

## 4.1 Visualizing your data

* **Histograms**

```python
import matplotlib.pyplot as plt

dog_pack["height_cm"].hist()
plt.show()

dog_pack["height_cm"].hist(bins=20)
plt.show()

dog_pack["height_cm"].hist(bins=5)
plt.show()
```

* **Bar plots**

```python
avg_weight_by_breed = dog_pack.groupby("breed")["weight_kg"].mean()
avg_weight_by_breed.plot(kind="bar")
plt.show()

avg_weight_by_breed.plot(kind="bar", title="Mean Weight by Dog Breed")
plt.show()
```

* **Line plots**

```python
sully.plot(x="date", y="weight_kg", kind="line")
plt.show()

sully.plot(x="date", y="weight_kg", kind="line", rot=45)
plt.show()
```

* **Scatter plots**

```python
dog_pack.plot(x="height_cm", y="weight_kg", kind="scatter")
plt.show()
```

* **Layering plots**

```python
dog_pack[dog_pack["sex"]=="F"]["height_cm"].hist()
dog_pack[dog_pack["sex"]=="M"]["height_cm"].hist()

# add a legend
plt.legend(["F", "M"])

plt.show()

# transparency
dog_pack[dog_pack["sex"]=="F"]["height_cm"].hist(alpha=0.7)
dog_pack[dog_pack["sex"]=="M"]["height_cm"].hist(alpha=0.7)
plt.legend(["F", "M"])
plt.show()
```

## 4.2 Missing values

* **Detecting missing values**

```python
dogs.isna()

# Detecting any missing values
dogs.isna().any()

# count missing values
dogs.isna().sum()

# plot missing values
import matplotlib.pyplot as plt
dogs.isna().sum().plot(kind="bar")
plt.show()

# remove missing values
dogs.dropna()

# replace missing values
dogs.fillna(0)
```

## 4.3 Creating DataFrames

* **Dictionaries**

```python
my_dict = {
	"key1": value1,
	"key2": value2,
	"key3": value3
}

my_dict["key1"]
value1
```

```python
my_dict = {
	"title": "Charlotte's Web",
	"author": "E.B. White",
	"published": 1952
}

>>> my_dict["title"]
"Charlotte's Web"
```

* **Creating DataFrames**

	* From a list of dictionaries
		* Constructed row by row

	* From a dictionary of lists
		* Constructed column by column
		* key: column name
		* value: list of column values

```python
# List of dictionaries - by row
list_of_dicts = [
	{"name": "Ginger", "breed": "Dachshund", "height_cm": 22, "weight_kg": 10, "date_of_birth": "2019-03-14"},
	{"name": "Scout", "breed": "Dalmatian", "height_cm": 59, "weight_kg": 25, "date_of_birth": "2019-05-09"}
]

new_dogs = pd.DataFrame(list_of_dicts)
print(new_dogs)

    name      breed  height_cm  weight_kg date_of_birth
0  Ginger  Dachshund         22         10    2019-03-14
1   Scout  Dalmatian         59         25    2019-05-09
```

```python
# Dictionary of lists - by column

dict_of_lists = {
	"name": ["Ginger", "Scout"],
	"breed": ["Dachshund", "Dalmatian"],
	"height_cm": [22, 59],
	"weight_kg": [10, 25],
	"date_of_birth": ["2019-03-14", "2019-05-09"]
}

new_dogs = pd.DataFrame(dict_of_lists)
print(new_dogs)
```

## 4.4 Reading and writing CSVs

* **CSV to DataFrame**

```python
import pandas as pd
new_dogs = pd.read_csv("new_dogs.csv")
print(new_dogs)
```

* **DataFrame manipulation**

```python
new_dogs["bmi"] = new_dogs["weight_kg"] / (new_dogs["height_cm"] / 100) ** 2

print(new_dogs)
```

* **DataFrame to CSV**

```python
new_dogs.to_csv("new_dogs_with_bmi.csv")
```
















