Introduction to SQL
===================

# 1. Selecting columns

## 1.1 Beginning your SQL journey

* SQL - Structured Query Language

    * a language for interacting with data stored in something called a relational database (a collection of tables)

* row/record

* column/field

## 1.2 SELECTing single columns

* **`SELECT` statement**
    * Key words: `SELECT`, `FROM`, 
    * (Not necessary) No case-sensitive: make SQL keywords uppercase to distinguish them from other parts of your query
    * (Not necessary) Include a semicolon at the end of your query to tell SQL where the end of your query is.

```SQL
SELECT name
FROM people;
```

## 1.3 SELECTing multiple columns

```SQL
SELECT name, birthdate
FROM people;
```

* select all columns from a table

```SQL
SELECT *
FROM people;
```

* limit the number of rows returned

```SQL
SELECT *
FROM people
LIMIT 10;
```

## 1.4 SELECT DISTINCT

* select all the unique values from a column

```SQL
SELECT DISTINCT language
FROM films;
```

## 1.5 Learning to COUNT

* COUNT() function - return the number of rows in one or more columns

```SQL
SELECT COUNT(*)
FROM people;
```

* count the number of non-missing values in a particular column

```SQL
SELECT COUNT(birthdate)
FROM people;
```

* combine COUNT() with DISTINCT() to count the number of distinct values in a column

```SQL
SELECT COUNT(DISTINCT birthdate)
FROM people;
```

# 2. Selecting columns

## 2.1 Filtering results

* `WHERE` keyword : filter based on text and numeric values in a table

*  comparison operators
    * `=` equal
    * `<>` not equal
    * `<` less than
    * `>` greater than
    * `<=` less than or equal to
    * `>=` greater than or equal to

```SQL
SELECT title
FROM films
WHERE title = 'Metropolis';
```
## 2.2 Simple filtering of numeric values

```SQL
SELECT *
FROM films
WHERE budget > 10000;
```

```SQL
SELECT COUNT(*)
FROM films
WHERE release_year < 2000;
```

## 2.3 Simple filtering of text

```SQL
SELECT title
FROM films
WHERE country = 'China';
```

```SQL
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11'
```

## 2.4 WHERE AND

* Combine `WHERE` with `AND`

```SQL
SELECT title
FROM films
WHERE release_year > 1994
AND release_year < 2000;
```

```SQL
SELECT *
FROM films
WHERE language = 'Spanish'
AND release_year > 2000
AND release_year < 2010;
```

## 2.5 WHERE AND OR

```SQL
SELECT title
FROM films
WHERE release_year = 1994
OR release_year = 2000;
```

```SQL
# enclose the individual clauses in parentheses
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');
```

```SQL
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND gross > 2000000
```

## 2.6 BETWEEN

* `BETWEEN` keyword : include the beginning and end values

```SQL
SELECT title
FROM films
WHERE release_year
BETWEEN 1994 AND 2000;
```

```SQL
SELECT name
FROM kids
WHERE age BETWEEN 2 AND 12
AND nationality = 'USA';
```

```SQL
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' OR language = 'French');
```

## 2.7 WHERE IN

```SQL
SELECT name
FROM kids
WHERE age = 2
OR age = 4
OR age = 6
OR age = 8
OR age = 10;
```

```SQL
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);
```

```SQL
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');
```
## 2.8 Introduction to NULL and IS NULL

* `NULL` : a missing or unknown value
* `IS NULL` : get the missing values

```SQL
SELECT COUNT(*)
FROM people
WHERE birthdate IS NULL;
```

* `IS NOT NULL` : get the non-missing values

```SQL
SELECT name
FROM people
WHERE birthdate IS NOT NULL;
```

## 2.9 LIKE and NOT LIKE

* `LIKE` : filter by specifying the exact text

* `%` wildcard : match zero, one or many characters in text

    * `'Data'`, `'DataC'`, `'DataCamp'`

```SQL
SELECT name
FROM companies
WHERE name LIKE 'Data%';
```

* `_` wildcard : match a single character

    * `'DataCamp'`, `'DataComp'`

```SQL
SELECT name
FROM companies
WHERE name LIKE 'DataC_mp';
```

# 3. Aggregate functions

## 3.1 Aggregate functions

* `AVG()` : get the average value

```SQL
SELECT AVG(budget)
FROM films;
```

* `MAX()` : get the highest value

* `MIN()`

* `SUM()` 


## 3.2 Combining aggregate functions with WHERE

```SQL
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;
```

```SQL
SELECT MAX(gross)
FROM films
WHERE release_year 
BETWEEN 2000 AND 2012;
```

## 3.3 A note on arithmetic

```SQL
SELECT(4/3);
# result is 1
```
```SQL
SELECT(4.0/3.0);
# result is 1.333
```


## 3.4 It's AS simple AS aliasing

* `AS` keyword : assigna a temporary name to something

```SQL
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;
```

```SQL
SELECT title, 
       gross - budget AS net_profit
FROM films;
```

# 4. Sorting and grouping

## 4.1 ORDER BY

* `ORDER BY` keyword : sort results in ascending order according to the values of one or more columns

* `DESC` : sort in descending order

```SQL
SELECT title
FROM films
ORDER BY release_year DESC;
```

## 4.2 Sorting single columns

```SQL
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration;
```
```SQL
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
```

## 4.3 Sorting multiple columns

```SQL
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

## 4.4 GROUP BY

* `GROUP BY` : group a result by one or more columns

```SQL
SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;
```

## 4.5 HAVING a great time

```SQL
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
```

```SQL
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY AVG(gross) DESC;
```

## 4.6 `JOIN` `ON`

```SQL
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
```




