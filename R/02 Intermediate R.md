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

# 3 Functions
























