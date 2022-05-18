Joining Data with pandas
========================

# 1. Data Merging Basics

## 1.1 Inner join

```python
wards = pd.read_csv("Ward_Offices.csv")
print(wards.head())
print(wards.shape)

census = pd.read_csv("Ward_Census.csv")
print(wards.head())
print(wards.shape)

wards_census = wards.merge(census, on='ward')
print(wards_census.head(4))
print(wards_census.shape)
print(wards_census.columns)

# suffixes
wards_census = wards.merge(census, on='ward', suffixes=('_ward', '_cen'))
print(wards_census.head(4))
print(wards_census.shape)
```

## 1.2 Merging multiple DataFrames

```python
grants_licenses_ward = grants.merge(licenses, on=['address', 'zip']) \ 
					.merge(wards, on='ward', suffixes=('_bus', '_ward'))
					
import matplotlib.pyplot as plt
grant_licenses_ward.groupby('ward').agg('sum').plot(kind='bar', y='grant')
plt.show()
```

# 2. Merging Tables With Different Join Types

## 2.1 Left join

```python
movies_taglines = movies.merge(taglines, on='id', how='left')
```

## 2.2 Other joins

* **Right join**

```python
tv_movies = movies.merge(tv_genre, how='right', left_on='id', right_on='movie_id')
```

* **Outer join**

```python
family_comedy = family.merge(comedy, on='movie_id', how='outer', suffixes=('_fam', '_com'))
```

## 2.3 Merging a table to itself

* When to merge at table to itself

	* Hierarchical raltionships
	* Sequential relationships
	* Graph data

```python
original_sequels = sequels.merge(sequels, left_on='sequel', right_on='id', suffixes=('_org', '_seq'))

original_sequels = sequels.merge(sequels, left_on='sequel', right_on='id', how='left', suffixes=('_org', '_seq'))
```

## 2.4 Merging on indexes

```python
# set an index
movies = pd.read_csv('tmdb_movies.csv', index_col=['id'])

# merge on index
movies_taglines = movies.merge(taglines, on='id', how='left')
```

```python
movies_genres = movies.merge(movie_to_genres, left_on='id', left_index=True, right_on='movie_id', right_index=True)
```

# 3. Advanced Merging and Concatenating

## 3.1 Filtering joins

* **Mutating versus filtering joins**

	* Mutating joins
		* Combines data from two tables based on matching observations in both tables

	* Filtering joins

		* Filter observations from table based on whether or not they match an observation in another table

* **Semi joins**

	* Returns the intersection, similar to an inner join
	* Returns only columns from the left table and not the right
	* No duplicates

```python
genres_tracks = genres.merge(top_tracks, on='gid')

top_genres = genres[genres['gid'].isin(genres_tracks['gid'])]
```

* **Anti join**

	* Returns the left table, excluding the intersection
	* Returns only columns from the left table and not the right

```python
genres_tracks = genres.merge(top_tracks, on='gid', how='left', indicator=True)

gid_list = genres_tracks.loc[genres_tracks['_merge'] == 'left_only', 'gid']

non_top_genres = genres[genres['gid'].isin(gid_list)]
```

## 3.2 Concatenate DataFrames together vertically

* **Concatenate two tables vertically**

	* pandas `.concat()` method can concatenate both vertical and horizontal.
		* `axis=0`, vertical

* **Basic concatenation**

	* 3 different tables with same column names
	
```python
pd.concat([inv_jan, inv_feb, inv_mar])
	
# ignore the index
pd.concat([inv_jan, inv_feb, inv_mar], ignore_index=True)
	
# set labels to original tables
pd.concat([inv_jan, inv_feb, inv_mar], ignore_index=False, keys=['jan', 'feb', 'mar'])
```
	
* **Concatenate tables with different column names**

```python
pd.concat([inv_jan, inv_feb], sort=True)

pd.concat([inv_jan, inv_feb], join='inner')
```

* **Using append method**

	* `.append()`
		* Simplified version of the `.concat()` method
		* Supports: `ignore_index`, and `sort`
		* Does Not Support: `key` and `join`
			* Always `join = outer`

```python
inv_jan.append([inv_feb, inv_mar], ignore_index=True, sort=True)
```

## 3.3 Verifying integrity

* **Validating merges**

	* `.merge(validate=None)

		* Checks if merge is of specified type
		* 'one_to_one'
		* 'one_to_many'
		* 'many_to_one'
		* 'many_to_many'

```python
albums.merge(tracks, on='aid', validate='one_to_many')
```

* **Verifying concatenations**

	* `.concat(verify_integrity=False)`:
		* Check whether the new concatenated index contains duplicates
		* Default value is `False`

* **Why verify integrity and what to do**

	* **Why:**

		* Real world data is often not clean

	* **What to do:*

		* Fix incorrect data
		* Drop duplicate rows


# 4. Merging Ordered and Time-Series Data

## 4.1 Using `merge_ordered()`

* **Method comparison**

|                  | `.merge()` method | `merge_ordered()` method   |
|:----------------:|:-----------------:|:--------------------------:|
|join type         | default inner     | default outer              |
|calling the method| `df.merge(df2)`   |`pd.merge_ordered(df1, df2)`|

```python
import pandas as pd
pd.merge_ordered(appl, mcd, on='date', suffixes=('_aapl', '_mcd'))
```

* **Forward fill**

	* Fill missing with previous value
	
```python
pd.merge_ordered(appl, mcd, on='date', suffixes=('_aapl', '_mcd'), fill_method='ffill')
```

## 4.2 Using `merge_asof()`











