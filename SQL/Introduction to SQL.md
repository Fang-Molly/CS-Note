Introduction to SQL
===================

# 1. Selecting columns

## 1.1 Onboarding - Tables

## 1.2 Onboarding - Query Result

```SQL
SELECT name FROM people
```

## 1.3 Onboarding - Errors

## 1.4 Onboarding - Multi-step Exercises

```SQL
SELECT 'SQL'
AS result
```

## 1.5 Beginning your SQL journey

* SQL - Structured Query Language

    * a language for interacting with data stored in something called a relational database

* row/record

* column/field

## 1.6 SELECTing single columns

* `SELECT` statement
    * no case-sensitive

```SQL
SELECT name
FROM people;
```

## 1.7 SELECTing multiple columns

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

## 1.8 SELECT DISTINCT

* select all the unique values from a column

```SQL
SELECT DISTINCT language
FROM films;
```

## 1.9 Learning to COUNT

* COUNT() function - return the number of rows in one or more columns

```SQL
SELECT COUNT(*)
FROM people;
```

## 1.10 Practice with COUNT

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









