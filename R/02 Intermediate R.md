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

## 1.2 Relational Operators & Vectors

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





