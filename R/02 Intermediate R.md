Intermediate R
==============

# 1 Conditionals and Control Flow

## 1.1 Relational Operators

* Equality `==`

```R
> TRUE == TRUE
[1] TRUE
> TRUE == FALSE
[1] FALSE
> "hello" == "goodbye"
[1] FALSE
> 3 == 2
[1] FALSE
```

* Inequality `!=`

```R
> TRUE != TRUE
[1] FALSE
> TRUE != FALSE
[1] TRUE
> "hello" != "goodbye"
[1] TRUE
> 3 != 2
[1] TRUE
```

* `<` and `>`

```R
> 3 < 5
[1] TRUE
> 3 > 5
[1] FALSE
> # Alphabetical Order!
> "Hello" > "Goodbye"
[1] TRUE
> # TRUE coerces to 1
> # FALSE coerces to 0
> TRUE < FALSE
[1] FALSE
```

* `<=` and `>=`

```R
> 5 >= 3
[1] TRUE
> 3 >= 3
[1] TRUE
```

* Relational Operators & Vectors

```R
> linkedin <- c(16, 9, 13, 5, 2, 17, 14)
> linkedin
[1] 16  9 13  5  2 17 14
> linkedin > 10
[1]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
> facebook <- c(17, 7, 5, 16, 8, 13, 14)
> facebook
[1] 17  7  5 16  8 13 14
> facebook <= linkedin
[1] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
```

## 1.2 Logical Operators

* AND operator `&`

```R
> TRUE & TRUE
[1] TRUE
> FALSE & TRUE
[1] FALSE
> TRUE & FALSE
[1] FALSE
> FALSE & FALSE
[1] FALSE
```

```R
> x <- 12
> x > 5 & x < 15
[1] TRUE
> x <- 17
> x > 5 & x < 15
[1] FALSE
```

* OR operator `|`

```R
> TRUE | TRUE
[1] TRUE
> TRUE | FALSE
[1] TRUE
> FALSE | TRUE
[1] TRUE
> FALSE | FALSE
[1] FALSE
```

```R
> y <- 4
> y < 5 | y > 15
[1] TRUE
> y <- 14
> y < 5 | y > 15
[1] FALSE
```

* NOT operator `!`

```R
> !TRUE
[1] FALSE
> !FALSE
[1] TRUE
> !(x < 5)
[1] TRUE
> x >= 5
[1] TRUE
```

```R
> is.numeric(5)
[1] TRUE
> !is.numeric(5)
[1] FALSE
> is.numeric("hello")
[1] FALSE
> !is.numeric("hello")
[1] TRUE
```

* Logical Operators & Vectors

```R
> c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)
[1]  TRUE FALSE FALSE
> c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
[1]  TRUE  TRUE FALSE
> !c(TRUE, TRUE, FALSE)
[1] FALSE FALSE  TRUE
```

* "&" vs "&&", "|" vs "||"

```R
> c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)
[1]  TRUE FALSE FALSE
# double & only examines the first element of each vector
> c(TRUE, TRUE, FALSE) && c(TRUE, FALSE, FALSE)
[1] TRUE

> c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
[1]  TRUE  TRUE FALSE
# double | only examines the first element of each vector
> c(TRUE, TRUE, FALSE) || c(TRUE, FALSE, FALSE)
[1] TRUE
```






























