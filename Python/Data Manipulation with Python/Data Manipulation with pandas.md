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

```
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





























