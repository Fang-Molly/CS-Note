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
























# 4. Creating and Visualizing DataFrames
