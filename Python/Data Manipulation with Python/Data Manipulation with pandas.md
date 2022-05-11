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
```








































