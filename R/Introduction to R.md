# 1 Intro to basics

## 1.1 How it works

```R
# Calculate 3 + 4
3 + 4

# Calculate 6 + 12
6 + 12
```

## 1.2 Arithmetic with R

* Arithmetic operators

    * Addition : `+`
    * Subtraction : `-`
    * Multiplication : `*`
    * Division : `/`
    * Exponentiation : `^`
        * `3 ^ 2` is 9
    * Modulo : `%%`
        * `5 %% 3` is 2

## 1.3 Variable assignment

```R
# assign a value to a variable
my_var <- 4

# print out the variable
my_var

# R Console 
> my_var <- 4
> my_var
[1] 4
```

```R
# Assign a value to the variables my_apples and my_oranges
my_apples <- 5
my_oranges <- 6

# Add these two variables together
my_apples + my_oranges

# Create the variable my_fruit
my_fruit <- my_apples + my_oranges
my_fruit
```

## 1.4 Basic data types in R

* Numerics
    * decimal : `4.5`
    * integer : `4`
* Logical
    * boolean value : `TRUE`, `FALSE`
* Characters
    * Text / String value : `"some text"`

> R is case sensitive!!!

## 1.5 Check the data type with `class()`

```R
> my_var <- 4
> class(my_var)
[1] "numeric"
```

# 2 Vectors

## 2.1 Create a vector 

* `c()` function : create a vector
* place the vector elements in the parentheses `()`, separated by a comma `,`

```R
numeric_vector <- c(1, 2, 3)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)
```

## 2.2 Name a vector

* `names()` function

```R
> some_vector <- c("John Doe", "poker player")
> names(some_vector) <- c("Name", "Profession")
> 
> some_vector
          Name     Profession 
    "John Doe" "poker player" 
```

```R
# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
 
# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Print out
poker_vector
>
   Monday   Tuesday Wednesday  Thursday    Friday 
      140       -50        20      -120       240 
roulette_vector
   Monday   Tuesday Wednesday  Thursday    Friday 
      -24       -50       100      -350        10 
```

# 2.3 Calculations with variables and vectors

```R
# The following three statements are completely equivalent
c(1, 2, 3) + c(4, 5, 6)
c(1 + 4, 2 + 5, 3 + 6)
c(5, 7, 9)
```

```R
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector
  
# Print out total_vector
total_vector

>
[1] 5 7 9
```
```R
# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Assign to total_daily how much you won/lost on each day
total_daily <- poker_vector + roulette_vector
names(total_daily) <- days_vector

# Print out
total_daily

>          
   Monday   Tuesday Wednesday  Thursday    Friday 
      116      -100       120      -470       250 
```

* `sum()`

```R
# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <- sum(roulette_vector)

# Total winnings overall
total_week <- total_poker + total_roulette

# Print out total_week
total_week

>
[1] -84
```

* `mean()`

```R
> poker_vector <- c(140, -50, 20, -120, 240)
> mean(poker_vector)
[1] 46
```

## 2.4 Comparing

```R
# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Calculate total gains for poker and roulette
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)

# Check if you realized higher total gains in poker than in roulette 
total_poker > total_roulette

> 
[1] TRUE
```

## 2.5 Vector selection

* `[]`

```R
poker_vector <- c(140, -50, 20, -120, 240)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector

# select one element from a vector
poker_wednesday <- poker_vector[3]
poker_wednesday
>
Wednesday 
       20 

# select multiple elements from a vector
poker_twodays <- poker_vector[c(1,5)]
poker_twodays
>
Monday Friday 
   140    240 

# a quick way to select multiple elements from a vector
poker_midweek <- poker_vector[2:4]
poker_midweek
>       
  Tuesday Wednesday  Thursday 
      -50        20      -120 

# select by the names of the vector elements
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]  
poker_start
>         
   Monday   Tuesday Wednesday 
      140       -50        20 
```

## 2.6 Selection by comparison

* comparison operators
    * `<` : less than
    * `>` : greater than
    * `<=` : less than or equal to
    * `>=` : greater than or equal to
    * `==` : equal to each other
    * `!=` : not equal to each other

```R
> c(4, 5, 6) > 5
[1] FALSE FALSE  TRUE
```

```R
# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Which days did you make money on poker?
selection_vector <- poker_vector > 0
  
# Print out selection_vector
selection_vector

>       
   Monday   Tuesday Wednesday  Thursday    Friday 
     TRUE     FALSE      TRUE     FALSE      TRUE 
     
# Select from poker_vector these days
poker_winning_days <- poker_vector[selection_vector]
poker_winning_days
>        
   Monday Wednesday    Friday 
      140        20       240 
```

# 3 Matrices

## 3.1 What's a matrix?

* **matrix** : two-dimensional, a collection of elements of the same data types arranged into a fixed number of rows and columns. 

* **`matrix()` function**

```R
> matrix(1:12, byrow = TRUE, nrow = 3)
>
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
[3,]    9   10   11   12
```

> The first argument : 1:12, a shortcut for `c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)`
> `byrow` : the matrix is filled by the row
> `nrow` : how many rows the matrix has

```R
> matrix(1:12, byrow = FALSE, nrow = 3)
>
     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12
```

## 3.2 Analyze matrices, you shall

```R
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow = TRUE, nrow = 3)

# Print out
star_wars_matrix

>
        [,1]  [,2]
[1,] 460.998 314.4
[2,] 290.475 247.9
[3,] 309.306 165.8
```

## 3.3 Naming a matrix

* `rownames()` and `colnames` 

```R
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region
# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix

>      
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8
```

## 3.4 Calculating the worldwide box office

* `rowSums()` and `colSums()

```R
# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", 
                 "The Empire Strikes Back", 
                 "Return of the Jedi")
               
star_wars_matrix <- matrix(box_office, 
                      nrow = 3, byrow = TRUE,
                      dimnames = list(titles, region))
# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
region_vector <- colSums(star_wars_matrix)

# Print out
star_wars_matrix
worldwide_vector
region_vector

>
star_wars_matrix
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8

worldwide_vector
A New Hope    The Empire Strikes Back      Return of the Jedi 
   775.398                    538.375                 475.106 
   
region_vector
      US   non-US 
1060.779  728.100 
```

## 3.5 Adding a column for the Worldwide box office

* `cbind()` function : add a column or multiple columns to a matrix

```R
big_matrix <- cbind(matrix1, matrix2, vector1 ...)
```

```R
# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", 
            "The Empire Strikes Back", 
            "Return of the Jedi")
               
star_wars_matrix <- matrix(box_office, 
                      nrow = 3, byrow = TRUE,
                      dimnames = list(titles, region))

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

# Print out
star_wars_matrix
worldwide_vector
all_wars_matrix

>
> star_wars_matrix
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8
> worldwide_vector
             A New Hope The Empire Strikes Back 
                775.398                 538.375 
     Return of the Jedi 
                475.106 
> all_wars_matrix
                             US non-US worldwide_vector
A New Hope              460.998  314.4          775.398
The Empire Strikes Back 290.475  247.9          538.375
Return of the Jedi      309.306  165.8          475.106
```

## 3.6 Adding a row

* `rbind()`

```R
# star_wars_matrix and star_wars_matrix2 are available in your workspace
star_wars_matrix  
star_wars_matrix2 

# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix,star_wars_matrix2)

# Print out
all_wars_matrix

>        
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5
```

## 3.7 Selection of matrix elements

* `my_matrix[1,2]` : selects the element at the first row and second column.

* `my_matrix[1:3,2:4]` : results in a matrix with the data on the rows 1, 2, 3 and columns 2, 3, 4.

* `my_matrix[,1]` : selects all elements of the first column.

* `my_matrix[1,]` : selects all elements of the first row.

```R
# all_wars_matrix is available in your workspace
all_wars_matrix

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]
  
# Average non-US revenue

mean(non_us_all)
  
# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2,2]
  
# Average non-US revenue for first two movies
mean(non_us_some)

>
> all_wars_matrix
                             US non-US worldwide_vector
A New Hope              460.998  314.4          775.398
The Empire Strikes Back 290.475  247.9          538.375
Return of the Jedi      309.306  165.8          475.106
> 
> mean(non_us_all)
[1] 242.7
>
> mean(non_us_some)
[1] 281.15
```



















