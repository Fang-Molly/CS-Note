Data Manipulation with dplyr
============================

# 1. Transforming Data with dplyr

## 1.1 The counties dataset

* Chapter 1 verbs

  * `select()`
  * `filter()`
  * `arrange()`
  * `mutate()`

```R
# take a look at the dataset
glimpse(counties)

# select()
counties %>%
  select(state, county, population, unemployment)
  
# creating a new table
counties_selected <- counties %>%
  select(state, county, population, unemployment)
```

## 1.2 The filter and arragne verbs

* Arrange

```
counties_selected %>%
  arrange(population)
```

* Arrange: descending

```
counties_selected %>%
  arrange(desc(population))
```

* Filter

```
counties_selected %>%
  arrange(desc(population)) %>%
  filter(state == "New York")
  
counties_selected %>%
  arrange(desc(population)) %>%
  filter(unemployment < 6)
```

* Combining conditions

```
counties_selected %>%
	arrange(desc(population)) %>%
	filter(state == "New York", unemployment < 6)
```

## 1.3 Mutate

* Mutate

```
counties_selected %>%
	mutate(unemployed_population = population * unemployment / 100) %>%
	arrange(desc(unemployed_population))
```

# 2. Aggregating Data

## 2.1 The count verb

```
counties %>%
	count()
```

* count variable

```
counties %>%
	count(state)
```
















