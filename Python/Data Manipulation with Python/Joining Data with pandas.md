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


























# 4. Merging Ordered and Time-Series Data













