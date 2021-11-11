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

* Install packages

```R
install.packages("ggvis")
```

* CRAN : Comprehensive R Archive Network

* Load packages

```R
# show the packages and environments you can use
search()

# load packages
library("ggvis")

require()
```

# 4 The apply family

## 4.1 lapply (short for list apply)

* apply function over list or vector
* output = list

```R
> nyc <- list(pop = 8405837, boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), capital = FALSE)

# one way: to find out the class of each element of the list
> for(info in nyc) {print(class(info))}
[1] "numeric"
[1] "character"
[1] "logical"

# lapply()
> lapply(nyc, class)
$pop
[1] "numeric"

$boroughs
[1] "character"

$capital
[1] "logical"
```

```R
> cities <- c("New York", "Pairs", "London", "Tokyo", "Rio de Janeiro", "Cape Town")

# find out the number of characters of each city name
> num_chars <- c()
> for(i in 1:length(cities)) { num_chars[i] <- nchar(cities[i])}
> num_chars
[1]  8  5  6  5 14  9

# lapply()
> lapply(cities, nchar)
[[1]]
[1] 8

[[2]]
[1] 5

...

[[6]]
[1] 9

# unlist()
> unlist(lapply(cities, nchar))
[1]  8  5  6  5 14  9
```

```R
> oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)
> triple <- function(x) { 3*x }
> result <- lapply(oil_prices, triple)
> str(result)
List of 6
 $ : num 7.11
 $ : num 7.47
 $ : num 6.54
 $ : num 6.66
 $ : num 7.41
 $ : num 6.96
> result
[[1]]
[1] 7.11

[[2]]
[1] 7.47

...

[[6]]
[1] 6.96

> unlist(result)
[1] 7.11 7.47 6.54 6.66 7.41 6.96

> multiply <- function(x, factor) { x * factor }
> times3 <- lapply(oil_prices, multiply, factor = 3)
> unlist(times3)
[1] 7.11 7.47 6.54 6.66 7.41 6.96
> times4 <- lapply(oil_prices, multiply, factor = 4)
> unlist(times4)
[1] 9.48 9.96 8.72 8.88 9.88 9.28

# lapply and anonymous functions
times3 <- lapply(oil_prices, function(x) { x*3 })
```

## 4.2 sapply (short for simplify apply)

* `sapply(x, FUN, ...)`
* apply function over list or vector
* try to simplify list to array

```R
> cities <- c("New York", "Pairs", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
> sapply(cities, nchar)
      New York          Pairs         London          Tokyo Rio de Janeiro      Cape Town 
             8              5              6              5             14              9 
> sapply(cities, nchar, USE.NAMES = FALSE)
[1]  8  5  6  5 14  9
```

```R
> first_and_last <- function(name) {
+     name <- gsub(" ", "", name)
+     letters <- strsplit(name, split = "")[[1]]
+     c(first = min(letters), last = max(letters))
+ }
> first_and_last("New York")
first  last 
  "e"   "Y" 

> cities <- c("New York", "Pairs", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
> sapply(cities, first_and_last)
      New York Pairs London Tokyo Rio de Janeiro Cape Town
first "e"      "a"   "d"    "k"   "a"            "a"      
last  "Y"      "s"   "o"    "y"   "R"            "w"   
```

```R
> unique_letters <- function(name) {
+     name <- gsub(" ", "", name)
+     letters <- strsplit(name, split = "")[[1]]
+     unique(letters)
+ }
> unique_letters("London")
[1] "L" "o" "n" "d"

> lapply(cities, unique_letters)
[[1]]
[1] "N" "e" "w" "Y" "o" "r" "k"

[[2]]
[1] "P" "a" "i" "r" "s"

[[3]]
[1] "L" "o" "n" "d"

[[4]]
[1] "T" "o" "k" "y"

[[5]]
[1] "R" "i" "o" "d" "e" "J" "a" "n" "r"

[[6]]
[1] "C" "a" "p" "e" "T" "o" "w" "n"

> sapply(cities, unique_letters)
$`New York`
[1] "N" "e" "w" "Y" "o" "r" "k"

$Pairs
[1] "P" "a" "i" "r" "s"

$London
[1] "L" "o" "n" "d"

$Tokyo
[1] "T" "o" "k" "y"

$`Rio de Janeiro`
[1] "R" "i" "o" "d" "e" "J" "a" "n" "r"

$`Cape Town`
[1] "C" "a" "p" "e" "T" "o" "w" "n"
```

## 4.3 vapply

* apply function over list or vector
* explicitly specify output format
* vapply(x, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)

```R
> cities <- c("New York", "Pairs", "London", "Tokyo", "Rio de Janeiro", "Cape Town")

> sapply(cities, nchar)
      New York          Pairs         London          Tokyo Rio de Janeiro      Cape Town 
             8              5              6              5             14              9 

> vapply(cities, nchar, numeric(1))
      New York          Pairs         London          Tokyo Rio de Janeiro      Cape Town 
             8              5              6              5             14              9 
```

```R
> first_and_last <- function(name) {
+     name <- gsub(" ", "", name)
+     letters <- strsplit(name, split = "")[[1]]
+     c(first = min(letters), last = max(letters))
+ }

> sapply(cities, first_and_last)
      New York Pairs London Tokyo Rio de Janeiro Cape Town
first "e"      "a"   "d"    "k"   "a"            "a"      
last  "Y"      "s"   "o"    "y"   "R"            "w" 

> vapply(cities, first_and_last, character(2))
      New York Pairs London Tokyo Rio de Janeiro Cape Town
first "e"      "a"   "d"    "k"   "a"            "a"      
last  "Y"      "s"   "o"    "y"   "R"            "w"      
> vapply(cities, first_and_last, character(1))
Error in vapply(cities, first_and_last, character(1)) : 
  values must be length 1,
 but FUN(X[[1]]) result is length 2
> vapply(cities, first_and_last, numeric(2))
Error in vapply(cities, first_and_last, numeric(2)) : 
  values must be type 'double',
 but FUN(X[[1]]) result is type 'character'
```

```R
> unique_letters <- function(name) {
+     name <- gsub(" ", "", name)
+     letters <- strsplit(name, split = "")[[1]]
+     unique(letters)
+ }

> sapply(cities, unique_letters)
$`New York`
[1] "N" "e" "w" "Y" "o" "r" "k"

...

$`Cape Town`
[1] "C" "a" "p" "e" "T" "o" "w" "n"

> vapply(cities, unique_letters, character(4))
Error in vapply(cities, unique_letters, character(4)) : 
  values must be length 4,
 but FUN(X[[1]]) result is length 7
```

# 5 Utilities

## 5.1 Useful Functions

* Mathematical utilities

> `abs()` : calculate the absolute value of an array of numerical values
> `round()` : rounds the input
> `sum()` : calculate the sum of the elements
> `mean()` : calculate the arithmetic mean

```R
> v1 <- c(1.1, -7.1, 5.4, -2.7)
> v2 <- c(-3.6, 4.1, 5.8, -8.0)
> mean(c(sum(round(abs(v1))), sum(round(abs(v2)))))
[1] 19
```

* Functions for data structures

> `seq()` : generate a sequence from 1 to 10, taking steps of 2

```R
> seq(1, 10, by = 3)
[1]  1  4  7 10
> seq(8, 2, by = -2)
[1] 8 6 4 2
```

> `rep()` : replicate its input, a vector or list

```R
# repeat the entire vector by times
> rep(c(8, 6, 4, 2), times = 2)
[1] 8 6 4 2 8 6 4 2
# repeat every element by each
> rep(c(8, 6, 4, 2), each = 2)
[1] 8 8 6 6 4 4 2 2
```

> `sort()` : sort the input vector

```R
# sort in ascending order
> sort(c(8, 6, 4, 2, 8, 6, 4, 2))
[1] 2 2 4 4 6 6 8 8
# sort in descending order
> sort(c(8, 6, 4, 2, 8, 6, 4, 2), decreasing = TRUE)
[1] 8 8 6 6 4 4 2 2
```

```R
> li <- list(log = TRUE,
+            ch = "hello",
+            int_vec = sort(rep(seq(8, 2, by = -2), times = 2)))
> li
$log
[1] TRUE

$ch
[1] "hello"

$int_vec
[1] 2 2 4 4 6 6 8 8
```

> `str()` : inspect the structure of this list
> `is.*()` : check the type of your data structure, return TRUE or FALSE
> `as.*()` : convert vector to a list
> `unlist()` : convert list to vector

```R
# str() to inspect the structure of the list
> str(li)
List of 3
 $ log    : logi TRUE
 $ ch     : chr "hello"
 $ int_vec: num [1:8] 2 2 4 4 6 6 8 8
 
> is.list(li)
[1] TRUE

> as.list(li)
$log
[1] TRUE

$ch
[1] "hello"

$int_vec
[1] 2 2 4 4 6 6 8 8

> is.list(c(1, 2, 3))
[1] FALSE

> li2 <- as.list(c(1, 2, 3))
> is.list(li2)
[1] TRUE

> unlist(li)
     log       ch int_vec1 int_vec2 int_vec3 int_vec4 int_vec5 int_vec6 int_vec7 int_vec8 
  "TRUE"  "hello"      "2"      "2"      "4"      "4"      "6"      "6"      "8"      "8" 
```

> `append()` : add elements to a vector or a list in a very readable way
> `rev()` : reverse the list

```R
> rev(li)
$int_vec
[1] 2 2 4 4 6 6 8 8

$ch
[1] "hello"

$log
[1] TRUE

> append(li, rev(li))
$log
[1] TRUE

$ch
[1] "hello"

$int_vec
[1] 2 2 4 4 6 6 8 8

$int_vec
[1] 2 2 4 4 6 6 8 8

$ch
[1] "hello"

$log
[1] TRUE

> str(append(li, rev(li)))
List of 6
 $ log    : logi TRUE
 $ ch     : chr "hello"
 $ int_vec: num [1:8] 2 2 4 4 6 6 8 8
 $ int_vec: num [1:8] 2 2 4 4 6 6 8 8
 $ ch     : chr "hello"
 $ log    : logi TRUE
 
> str(rev(li))
List of 3
 $ int_vec: num [1:8] 2 2 4 4 6 6 8 8
 $ ch     : chr "hello"
 $ log    : logi TRUE
```

## 5.2 Regular Expressions

> `grepl()` : `grepl(pattern = <regex>, x = <string>)`
> `grep()` : returna a vector of indices of the elements of x that yield a match

```R
> animals <- c("cat","moose", "impala", "ant", "kiwi")

# include letter "a"
> grepl(pattern = "a", x = animals)
[1]  TRUE FALSE  TRUE  TRUE FALSE

# begin with an "a"
> grepl(pattern = "^a", x = animals)
[1] FALSE FALSE FALSE  TRUE FALSE
> grepl(pattern = "a$", x = animals)
[1] FALSE FALSE  TRUE FALSE FALSE

> grep(pattern = "a", x = animals)
[1] 1 3 4
> which(grepl(pattern = "a", x = animals))
[1] 1 3 4
> grep(pattern = "^a", x = animals)
[1] 4
```

> `sub()` : `sub(pattern = <regex>, replacement = <str>, x = <str>)
> `gsub()`

```R
# replace the first match in the string
> sub(pattern = "a", replacement = "o", x = animals)
[1] "cot"    "moose"  "impola" "ont"    "kiwi"

# replace all the match in the string
> gsub(pattern = "a", replacement = "o", x = animals)
[1] "cot"    "moose"  "impolo" "ont"    "kiwi" 

> gsub(pattern = "a|i", replacement = "_", x = animals)
[1] "c_t"    "moose"  "_mp_l_" "_nt"    "k_w_"  
> gsub(pattern = "a|i|o", replacement = "_", x = animals)
[1] "c_t"    "m__se"  "_mp_l_" "_nt"    "k_w_"  
```

```R
> emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org", "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")
> grepl("@.*\\.edu$", x = emails)
[1]  TRUE FALSE FALSE FALSE  TRUE FALSE

> hits <- grep("@.*\\.edu$", x = emails)
> hits
[1] 1 5
> emails[hits]
[1] "john.doe@ivyleague.edu"   "quant@bigdatacollege.edu"
```

> `.*` : any character that is matched zero or more times
> `\\s` : Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
> `[0-9]+` : Match the numbers 0 to 9, at least once (+).

## 5.3 Times & Dates

```R
> today <- Sys.Date()
> today
[1] "2021-11-11"
> class(today)
[1] "Date"

> now <- Sys.time()
> now
[1] "2021-11-11 16:53:50 EST"
> class(now)
[1] "POSIXct" "POSIXt" 
```

* Create Date objects

```R
> my_date <- as.Date("1998-09-09")
> my_date
[1] "1998-09-09"
> class(my_date)
[1] "Date"
> my_date <- as.Date("1999-14-05")
Error in charToDate(x) : 
  character string is not in a standard unambiguous format
> my_date <- as.Date("1999-14-05", format = "%Y-%d-%m")
> my_date
[1] "1999-05-14"
```

* Create POSIXct objects

```R
> my_time <- as.POSIXct("1971-05-14 11:25:15")
> my_time
[1] "1971-05-14 11:25:15 EDT"
```




















