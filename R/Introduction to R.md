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

## 3.8 A little arithmetic with matrices

```R
# all_wars_matrix is available in your workspace
all_wars_matrix

# Estimate the visitors
visitors <- all_wars_matrix / 5
  
# Print the estimate to the console
all_wars_matrix
visitors

>
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5
>
visitors
                           US non-US
A New Hope              92.20  62.88
The Empire Strikes Back 58.10  49.58
Return of the Jedi      61.86  33.16
The Phantom Menace      94.90 110.50
Attack of the Clones    62.14  67.74
Revenge of the Sith     76.06  93.70
```

# 4 Factors

## 4.1 What's a factor and why would you use it?

* factor : a statistical data type used to store categorical variables

* categorical variable : belong to a limited number of categories
* continuous variable: belong to an infinite number of values

* `factor()` function : create factors

    * factor levels

```R
# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)

# Print out factor_sex_vector
factor_sex_vector

>
[1] Male   Female Female Male   Male  
Levels: Female Male
```

* two types of categorical variables:
    * nominal categorical variable : without an implied order
        * animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
    * ordinal categorical variable
        * temperature_vector <- c("Low", "Medium", "High")

```R
# Animals
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

>
factor_animals_vector
[1] Elephant Giraffe  Donkey   Horse   
Levels: Donkey Elephant Giraffe Horse

factor_temperature_vector
[1] High   Low    High   Low    Medium
Levels: Low < Medium < High
```

## 4.2 Factor levels

* `levels()` : specify the levels of factor

```R
# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)

# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c("Female", "Male")

factor_survey_vector

>
[1] Male   Female Female Male   Male  
Levels: Female Male
```

## 4.3 Summarizing a factor

* `summary()`

```R
# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

>
summary(survey_vector)
Length     Class      Mode 
     5 character character 
        
>        
summary(factor_survey_vector)
Female   Male 
     2      3 
```

## 4.4 Battle of the sexes

```R
# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")

# Male
male <- factor_survey_vector[1]

# Female
female <- factor_survey_vector[2]

# Battle of the sexes: Male 'larger' than female?
male > female

>
Warning message: '>' not meaningful for factors
[1] NA
```

## 4.5 Ordered factors

```R
# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))

# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)

>
factor_speed_vector
[1] medium slow   slow   medium fast  
Levels: slow < medium < fast
>
summary(factor_speed_vector)
  slow medium   fast 
     2      2      1 
```

## 4.6 Comparing ordered factors

```R
# Create factor_speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))

# Factor value for second data analyst
da2 <- factor_speed_vector[2]

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
da2 > da5

>
[1] FALSE
```

# 5 Data frames

## 5.1 What's a data frame?

* `head()` : show the first observations of a data frame

* `tail()` : print out the last observations of a data frame

* `str()` : show the structure of the data set

    * the total number of observations
    * the total number of variables
    * a full list of thte variables names
    * the data type of each variable
    * the first observations

## 5.2 Creating a data frame

* `data.frame()`

```R
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", 
          "Mars", "Jupiter", "Saturn", 
          "Uranus", "Neptune")
type <- c("Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

planets_df

>
     name               type diameter rotation rings
1 Mercury Terrestrial planet    0.382    58.64 FALSE
2   Venus Terrestrial planet    0.949  -243.02 FALSE
3   Earth Terrestrial planet    1.000     1.00 FALSE
4    Mars Terrestrial planet    0.532     1.03 FALSE
5 Jupiter          Gas giant   11.209     0.41  TRUE
6  Saturn          Gas giant    9.449     0.43  TRUE
7  Uranus          Gas giant    4.007    -0.72  TRUE
8 Neptune          Gas giant    3.883     0.67  TRUE

>
str(planets_df)
'data.frame':	8 obs. of  5 variables:
 $ name    : Factor w/ 8 levels "Earth","Jupiter",..: 4 8 1 3 2 6 7 5
 $ type    : Factor w/ 2 levels "Gas giant","Terrestrial planet": 2 2 2 2 1 1 1 1
 $ diameter: num  0.382 0.949 1 0.532 11.209 ...
 $ rotation: num  58.64 -243.02 1 1.03 0.41 ...
 $ rings   : logi  FALSE FALSE FALSE FALSE TRUE TRUE ...
```

## 5.3 Selection of data frame elements

```R
# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]
```

* make use of the variable name

```R
planets_df[1:3,"type"]
```

* select an entire column by using `$`sign

```R
planets_df[,3]
planets_df[,"diameter"]
planets_df$diameter
```

* select an entire column by the variable name

```R
planets_df[rings_vector, "name"]
>
[1] Jupiter Saturn  Uranus  Neptune
Levels: Earth Jupiter Mars Mercury Neptune Saturn Uranus Venus

planets_df[rings_vector,]
>
     name      type diameter rotation rings
5 Jupiter Gas giant   11.209     0.41  TRUE
6  Saturn Gas giant    9.449     0.43  TRUE
7  Uranus Gas giant    4.007    -0.72  TRUE
8 Neptune Gas giant    3.883     0.67  TRUE
```

* `subset()` function: `subset(my_df, subset = some_condition)`

```R
subset(planets_df, subset = rings)
>
     name      type diameter rotation rings
5 Jupiter Gas giant   11.209     0.41  TRUE
6  Saturn Gas giant    9.449     0.43  TRUE
7  Uranus Gas giant    4.007    -0.72  TRUE
8 Neptune Gas giant    3.883     0.67  TRUE

subset(planets_df, subset = diameter < 1)
>
     name               type diameter rotation rings
1 Mercury Terrestrial planet    0.382    58.64 FALSE
2   Venus Terrestrial planet    0.949  -243.02 FALSE
4    Mars Terrestrial planet    0.532     1.03 FALSE
```

## 5.4 Sorting

* `order()` function ：give you the ranked position of each element

```R
> a <- c(100, 10, 1000)
> order(a)
[1] 2 1 3

> a[order(a)]
[1]   10  100 1000
```

```R
# Use order() to create positions
positions <-  order(planets_df$diameter)
positions

# Use positions to sort planets_df
planets_df[positions, ]
>
positions
[1] 1 4 2 3 8 7 6 5

planets_df[positions, ]
     name               type diameter rotation rings
1 Mercury Terrestrial planet    0.382    58.64 FALSE
4    Mars Terrestrial planet    0.532     1.03 FALSE
2   Venus Terrestrial planet    0.949  -243.02 FALSE
3   Earth Terrestrial planet    1.000     1.00 FALSE
8 Neptune          Gas giant    3.883     0.67  TRUE
7  Uranus          Gas giant    4.007    -0.72  TRUE
6  Saturn          Gas giant    9.449     0.43  TRUE
5 Jupiter          Gas giant   11.209     0.41  TRUE
```

# 6 Lists

## 6.1 Why would you need lists?

* list : gather a variety of objects under one name in an ordered way

* `list()` : create a list `my_list <- list(comp1, comp2 ...)`

```R
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)
my_list

>
[[1]]
 [1]  1  2  3  4  5  6  7  8  9 10

[[2]]
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

[[3]]
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

## 6.2 Creating a named list

```R
my_list <- list(name1 = your_comp1, name2 = your_comp2)
```

```R
my_list <- list(your_comp1, your_comp2)
names(my_list) <- c("name1", "name2")
```

## 6.3 Selecting elements from a list

* `[[]]` double square brackets : `shining_list[[1]]`

```R
shining_list[["reviews"]]
shining_list$reviews
```

```R
shining_list[[2]][1]
shining_list$actors[2]
```






































