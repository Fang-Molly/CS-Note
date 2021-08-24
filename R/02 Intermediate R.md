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

## 1.3 Conditional Statements

* `if` statement

```R
if(condition) {
  expr
}
```

```R
> x <- -3
> if(x < 0) {
+   print("x is a negative number")
+ }
[1] "x is a negative number"
# if false, no printout
```

* `if`, `else` statement

```R
if(condition) {
  expr1
} else {
  expr2
}
```

```R
> x <- -3
> if(x < 0) {
+   print("x is a negative number")
+ } else {
+   print("x is either a positive number or zero")
+ }
[1] "x is a negative number"
```

* `if`, `else if`, `else` statement

```R
if(condition1) {
  expr1
} else if(condition2) {
  expr2
} else {
  expr3
}
```

```R
> x <- -3
> if(x < 0) {
+   print("x is a negative number")
+ } else if(x == 0) {
+   print("x is zero")
+ } else {
+   print("x is a positive number")
+ }
[1] "x is a negative number"
```

# 2 Loops

## 2.1 While loop

* `while` loop

```R
while(condition) {
  expr
}
```

```R
> ctr <- 0
> while(ctr <= 7) {
+   print(paste("ctr is set to", ctr))
+   ctr <- ctr + 1
+ }
[1] "ctr is set to 0"
[1] "ctr is set to 1"
[1] "ctr is set to 2"
[1] "ctr is set to 3"
[1] "ctr is set to 4"
[1] "ctr is set to 5"
[1] "ctr is set to 6"
[1] "ctr is set to 7"
```

* Infinite while loop

```R
> ctr <- 1
> while(ctr <= 7) {
+   print(paste("ctr is set to", ctr))
+ }
[1] "ctr is set to 1"
[1] "ctr is set to 1"
[1] "ctr is set to 1"
[1] "ctr is set to 1"
[1] "ctr is set to 1"
...
```

* `break` statement

```R
> ctr <- 1
> while(ctr <= 7) {
+   if(ctr %% 5 == 0) {
+     break
+   }
+   print(paste("ctr is set to", ctr))
+   ctr <- ctr + 1
+ }
[1] "ctr is set to 1"
[1] "ctr is set to 2"
[1] "ctr is set to 3"
[1] "ctr is set to 4"
```

## 2.2 For loop

* for loop

```R
for(var in seq) {
  expr
}
```

```R
> cities <- c("New York", "Pairs", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
> cities
[1] "New York"       "Pairs"          "London"         "Tokyo"         
[5] "Rio de Janeiro" "Cape Town" 

> for(city in cities) {
+   print(city)
+ }
[1] "New York"
[1] "Pairs"
[1] "London"
[1] "Tokyo"
[1] "Rio de Janeiro"
[1] "Cape Town"
```

* `break` statement

```R
> for(city in cities) {
+   if(nchar(city) == 6) {
+     break
+   }
+   print(city)
+ }
[1] "New York"
[1] "Pairs"
```

* `next` statement

```R
> for(city in cities) {
+   if(nchar(city) == 6) {
+     next
+   }
+   print(city)
+ }
[1] "New York"
[1] "Pairs"
[1] "Tokyo"
[1] "Rio de Janeiro"
[1] "Cape Town"
```

* for loop: v2

```R
> for(i in 1:length(cities)) {
+   print(cities[i])
+ }
[1] "New York"
[1] "Pairs"
[1] "London"
[1] "Tokyo"
[1] "Rio de Janeiro"
[1] "Cape Town"
```

```R
# double square brackets - [[ ]] - to select the list elements
> nyc <- list(pop = 8405837, boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), capital = FALSE)

> for(i in 1:length(nyc)) {
+   print(nyc[i])
+ }
$pop
[1] 8405837

$boroughs
[1] "Manhattan"     "Bronx"         "Brooklyn"      "Queens"       
[5] "Staten Island"

$capital
[1] FALSE

> for(i in 1:length(nyc)) {
+   print(nyc[[i]])
+ }
[1] 8405837
[1] "Manhattan"     "Bronx"         "Brooklyn"      "Queens"       
[5] "Staten Island"
[1] FALSE
```

```R
> for(i in 1:length(cities)) {
+   print(paste(cities[i], "is on position", i, "in the cities vector"))
+ }
[1] "New York is on position 1 in the cities vector"
[1] "Pairs is on position 2 in the cities vector"
[1] "London is on position 3 in the cities vector"
[1] "Tokyo is on position 4 in the cities vector"
[1] "Rio de Janeiro is on position 5 in the cities vector"
[1] "Cape Town is on position 6 in the cities vector"
```

* nested for loop

```R
for (var1 in seq1) {
  for (var2 in seq2) {
    expr
  }
}
```

```R
for (i in 1:nrow(ttt)) {
  for (j in i:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains", ttt[i,j]))
  }
}
[1] "On row 1 and column 1 the board contains O"
[1] "On row 1 and column 2 the board contains NA"
[1] "On row 1 and column 3 the board contains X"
[1] "On row 2 and column 2 the board contains O"
[1] "On row 2 and column 3 the board contains O"
[1] "On row 3 and column 3 the board contains X"
```

# 3 Functions

## 3.1 Introduction to Functions

* Functions

    * `list()` : create a list
    * `print()` : display a variable
    
* Call function in R

```R
> sd(c(1, 5, 6, 7))
[1] 2.629956
> values <- c(1, 5, 6, 7)
> sd(values)
[1] 2.629956
> my_sd <- sd(values)
> my_sd
[1] 2.629956
```

* Function documentation

    * `help(sd)`
    * `?sd`

* `sd` function: `sd(x, na.rm = FALSE)`

     * argument matching by position : `sd(values)`
     * argument matching by name : `sd(x = values)`


```R
> values <- c(1, 5, 6, NA)
> sd(values)
[1] NA
> sd(values, TRUE)
[1] 2.645751
> sd(values, na.rm = TRUE)
[1] 2.645751
```

* Useful trick

```R
> args(sd)
function (x, na.rm = FALSE) 
NULL
```

## 3.2 Writing Functions

* One argument

    * the `triple()` function

```R
triple <- function(x) {
  body
}
```

```
> triple <- function(x) {
+   3 * x
+ }
> triple(2)
[1] 6
```

    * return()

```
> triple <- function(x) {
+   y <- 3 * x
+   return(y)
+ }
> triple(2)
[1] 6
```

* two arguments

```R
math_magic <- function(arg1, arg2) {
  body
}
```
```R
> math_magic <- function(a, b) {
+   a*b + a/b
+ }
> math_magic(4, 2)
[1] 10
> math_magic(4)
Error in math_magic(4) : argument "b" is missing, with no default
```

    * Optional argument

```R
> math_magic <- function(a, b = 1) {
+   a*b + a/b
+ }
> 
> math_magic(4)
[1] 8

> math_magic(4, 0)
[1] Inf
```

```R
> pow_two <- function(x, print_info = TRUE) {
+   y <- x ^ 2
+   if(print_info) {
+     print(paste(x, "to the power two equals", y))
+   }
+   return(y)
+ }

> pow_two(5)
[1] "5 to the power two equals 25"
[1] 25
> pow_two(5, FALSE)
[1] 25
> pow_two(5, TRUE)
[1] "5 to the power two equals 25"
[1] 25

```

    * Use return()

```R
> math_magic <- function(a, b = 1) {
+   if(b == 0) {
+     return(0)
+   }
+   a*b + a/b
+ }
> 
> math_magic(4, 0)
[1] 0
```

* No argument

```R
> hello <- function() {
+   print("Hi there!")
+   TRUE
+ }

> hello()
[1] "Hi there!"
[1] TRUE
```

## 3.3 R Packages




















# 4 The apply family









# 5 Utilities



































