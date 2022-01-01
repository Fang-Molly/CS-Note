Introduction to Importing Data in R
====================================

# 1. Importing data from flat files with utils

## 1.1 Introduction & read.csv

* 5 types of data format
    * Flat files
    * Excel
    * Databases
    * Web
    * Statistical software : SAS, SPSS, Stata

* Flat files : simple text files that display data as tables

   * CSV : comma-separated values

```
states.csv

state,capital,pop_mill,area_sqm
South Dakota,Pierre,0.853,77116
New York,Albany,17.946,54555
Oregon,Salem,3.970,98381
Vermont,Montpelier,0.627,9616
Hawaii,Honolulu,1.420,10931
```
   
   * utils package - read.csv
      * Loaded by default when you start R
  
```R
> read.csv("states.csv", stringsAsFactors = FALSE)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931
```

      * What if files in datasets folder of home directory?
 
```R
> path <- file.path("~", "Desktop", "R", "states.csv")
> path
[1] "~/Desktop/R/states.csv"
> read.csv(path, stringsAsFactors = FALSE) 
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931
> df <- read.csv("states.csv", stringsAsFactors = FALSE)

# check the structure of df
> str(df)
'data.frame':	5 obs. of  4 variables:
 $ state   : chr  "South Dakota" "New York" "Oregon" "Vermont" ...
 $ capital : chr  "Pierre" "Albany" "Salem" "Montpelier" ...
 $ pop_mill: num  0.853 17.946 3.97 0.627 1.42
 $ area_sqm: int  77116 54555 98381 9616 10931
```

## 1.2 read.delim & read.table

* Flat files : simple text files that display data as tables

   * CSV : comma-separated values
   * TXT : tab-delimited file

```
states.txt

state	capital	pop_mill	area_sqm
South Dakota	Pierre	0.853	77116
New York	Albany	17.946	54555
Oregon	Salem	3.97	98381
Vermont	Montpelier	0.627	9616
Hawaii	Honolulu	1.42	10931
```

```R
> read.delim("states.txt", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931
```

* Exotic file format

```
states2.txt

state/capital/pop_mill/area_sqm
South Dakota/Pierre/0.853/77116
New York/Albany/17.946/54555
Oregon/Salem/3.970/98381
Vermont/Montpelier/0.627/9616
Hawaii/Honolulu/1.420/10931
```

* `read.table()` : read any tabular file as a data frame

```
> read.table("states2.txt", header = T, sep = "/", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931
```

```
> read.table("states.csv", header = T, sep = ",", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931

> summary(states)
    state             capital             pop_mill         area_sqm    
 Length:5           Length:5           Min.   : 0.627   Min.   : 9616  
 Class :character   Class :character   1st Qu.: 0.853   1st Qu.:10931  
 Mode  :character   Mode  :character   Median : 1.420   Median :54555  
                                       Mean   : 4.963   Mean   :50120  
                                       3rd Qu.: 3.970   3rd Qu.:77116  
                                       Max.   :17.946   Max.   :98381  
```

* `which.min()` and `which.max()`

```R
> states <- read.table("states.csv", header = T, sep = ",", stringsAsFactors = F)
> states
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931

> pop_mill_min <- states[which.min(states$pop_mill), ]
> area_sqm_max <- states[which.max(states$area_sqm), ]

> pop_mill_min
    state    capital pop_mill area_sqm
4 Vermont Montpelier    0.627     9616
> area_sqm_max
   state capital pop_mill area_sqm
3 Oregon   Salem     3.97    98381
```

* Column classes

```R
> states3 <- read.table("states.csv", header = T, sep = ",", col.names = c("state", "city", "population", "area"))
> states3
         state       city population  area
1 South Dakota     Pierre      0.853 77116
2     New York     Albany     17.946 54555
3       Oregon      Salem      3.970 98381
4      Vermont Montpelier      0.627  9616
5       Hawaii   Honolulu      1.420 10931
```

* colClasses = c("character", "numeric", "logical")
* colClasses = c("factor", "NULL", "numeric")


# 2 readr & data.table

## 2.1 readr: read_csv & read_tsv

* Specific R packages

    * readr
    * data.table

* `readr`

    * Written by Hadley Wickham
    * Fast, easy to use, consistent
    * utils: verbose, slower

 utils        | readr       
:-----------: | :-----------:  
 read.table() | read_delim()  
 read.csv()   | read_csv()    
 read.delim() | read_tsv()    
 
```R
install.packages("readr")
library(readr)

> read.csv("states.csv", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931

> read_csv("states.csv")
Rows: 5 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: ","
chr (2): state, capital
dbl (2): pop_mill, area_sqm
# A tibble: 5 × 4
  state        capital    pop_mill area_sqm
  <chr>        <chr>         <dbl>    <dbl>
1 South Dakota Pierre        0.853    77116
2 New York     Albany       17.9      54555
3 Oregon       Salem         3.97     98381
4 Vermont      Montpelier    0.627     9616
5 Hawaii       Honolulu      1.42     10931

> read.delim("states.txt", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931

> read_tsv("states.txt")
Rows: 5 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "\t"
chr (2): state, capital
dbl (2): pop_mill, area_sqm
# A tibble: 5 × 4
  state        capital    pop_mill area_sqm
  <chr>        <chr>         <dbl>    <dbl>
1 South Dakota Pierre        0.853    77116
2 New York     Albany       17.9      54555
3 Oregon       Salem         3.97     98381
4 Vermont      Montpelier    0.627     9616
5 Hawaii       Honolulu      1.42     10931
```

## 2.2 readr: read_delim

```R
> read.table("states2.txt", header = T, sep = "/", stringsAsFactors = F)
         state    capital pop_mill area_sqm
1 South Dakota     Pierre    0.853    77116
2     New York     Albany   17.946    54555
3       Oregon      Salem    3.970    98381
4      Vermont Montpelier    0.627     9616
5       Hawaii   Honolulu    1.420    10931

> read_delim("states2.txt", delim = "/")
Rows: 5 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "/"
chr (2): state, capital
dbl (2): pop_mill, area_sqm
# A tibble: 5 × 4
  state        capital    pop_mill area_sqm
  <chr>        <chr>         <dbl>    <dbl>
1 South Dakota Pierre        0.853    77116
2 New York     Albany       17.9      54555
3 Oregon       Salem         3.97     98381
4 Vermont      Montpelier    0.627     9616
5 Hawaii       Honolulu      1.42     10931
```

* col_name

```
> read_delim("states3.txt", delim = "/", col_names = F)
Rows: 5 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "/"
chr (2): X1, X2
dbl (2): X3, X4
# A tibble: 5 × 4
  X1           X2             X3    X4
  <chr>        <chr>       <dbl> <dbl>
1 South Dakota Pierre      0.853 77116
2 New York     Albany     17.9   54555
3 Oregon       Salem       3.97  98381
4 Vermont      Montpelier  0.627  9616
5 Hawaii       Honolulu    1.42  10931 

> read_delim("states3.txt", delim = "/", col_names = c("state", "city", "pop", "area"))
Rows: 5 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "/"
chr (2): state, city
dbl (2): pop, area
# A tibble: 5 × 4
  state        city          pop  area
  <chr>        <chr>       <dbl> <dbl>
1 South Dakota Pierre      0.853 77116
2 New York     Albany     17.9   54555
3 Oregon       Salem       3.97  98381
4 Vermont      Montpelier  0.627  9616
5 Hawaii       Honolulu    1.42  10931
```

* col_types
    * c: character
    * d: double or numeric
    * i: integer
    * l: logical

```R
> read_delim("states2.txt", delim = "/", col_types = "ccdd")
# A tibble: 5 × 4                                         
  state        capital    pop_mill area_sqm
  <chr>        <chr>         <dbl>    <dbl>
1 South Dakota Pierre        0.853    77116
2 New York     Albany       17.9      54555
3 Oregon       Salem         3.97     98381
4 Vermont      Montpelier    0.627     9616
5 Hawaii       Honolulu      1.42     10931
```

* skip and n_max
    * skip: specifies the number of lines you're ignoring in the flat file before actually starting to import data.
    * n_max: specifies the number of lines you're actually importing

```R
> read_delim("states2.txt", delim = "/", skip = 2, n_max = 2)
Rows: 2 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "/"
chr (2): New York, Albany
dbl (2): 17.946, 54555
# A tibble: 2 × 4
  `New York` Albany     `17.946` `54555`
  <chr>      <chr>         <dbl>   <dbl>
1 Oregon     Salem         3.97    98381
2 Vermont    Montpelier    0.627    9616

> read_delim("states2.txt", delim = "/", col_names = c("state", "city", "pop", "area"), skip = 2, n_max = 2)
Rows: 2 Columns: 4                                        
── Column specification ────────────────────────────────────
Delimiter: "/"
chr (2): state, city
dbl (2): pop, area
# A tibble: 2 × 4
  state    city     pop  area
  <chr>    <chr>  <dbl> <dbl>
1 New York Albany 17.9  54555
2 Oregon   Salem   3.97 98381
```

## 2.3 data.table: fread

* data.table

    * Matt Dowle & Arun Srinivasan
    * Key metric: speed
    * Data manipulation in R
    * Function to import data: fread()
    * Similar to read.table()

```R
install.packages("data.table")
library(data.table)

> fread("states.csv")
          state    capital pop_mill area_sqm
1: South Dakota     Pierre    0.853    77116
2:     New York     Albany   17.946    54555
3:       Oregon      Salem    3.970    98381
4:      Vermont Montpelier    0.627     9616
5:       Hawaii   Honolulu    1.420    10931

> fread("states2.csv")
             V1         V2     V3    V4
1: South Dakota     Pierre  0.853 77116
2:     New York     Albany 17.946 54555
3:       Oregon      Salem  3.970 98381
4:      Vermont Montpelier  0.627  9616
5:       Hawaii   Honolulu  1.420 10931
```

* fread()

    * Infer column types and separators
    * It simply works
    * Extremely fast
    * Possible to specify numerous parameters
    * Improved read.table()
    * Fast, convenient, customizable

* select: import columns 3 and 4

```R
> states <- fread("states.csv", select = c(3,4))
> states
   pop_mill area_sqm
1:    0.853    77116
2:   17.946    54555
3:    3.970    98381
4:    0.627     9616
5:    1.420    10931
> plot(states$pop_mill, states$area_sqm)
```

# 3 Importing Excel data

## 3.1 readxl

* Microsoft Excel

    * Common data analysis tool
    * Many R packages to interact with Excel
    * readxl package - Hadley Wickham

* Typical Structure Excel Data

    * Different sheets with tabular data

 * readxl contains two main functions

    * excel_sheets()
        * list different sheets
    * read_excel()
        * actually import data into R
        
* readxl can handle both dot-xls and dot-xlsm files.

```R
> install.packages("readxl")
> library(readxl)

# print the names of all worksheets
> excel_sheets("states.xlsx")
[1] "states"    "year_2000"

> read_excel("states.xlsx")
# A tibble: 5 × 4                                                       
  state        capital    pop_mill area_sqm
  <chr>        <chr>         <dbl>    <dbl>
1 South Dakota Pierre        0.853    77116
2 New York     Albany       17.9      54555
3 Oregon       Salem         3.97     98381
4 Vermont      Montpelier    0.627     9616
5 Hawaii       Honolulu      1.42     10931

> read_excel("states.xlsx", sheet = 2)
# A tibble: 5 × 2                                                       
  capital    pop_mill
  <chr>         <dbl>
1 Pierre        0.853
2 Albany       17.9  
3 Salem         3.97 
4 Montpelier    0.627
5 Honolulu      1.42 

> read_excel("states.xlsx", sheet = "year_2000")
# A tibble: 5 × 2                                                       
  capital    pop_mill
  <chr>         <dbl>
1 Pierre        0.853
2 Albany       17.9  
3 Salem         3.97 
4 Montpelier    0.627
5 Honolulu      1.42 
```

* lapply()

```R
> states <- lapply(excel_sheets("states.xlsx"), read_excel, path = "states.xlsx")

> str(states)
List of 2
 $ : tibble [5 × 4] (S3: tbl_df/tbl/data.frame)
  ..$ state   : chr [1:5] "South Dakota" "New York" "Oregon" "Vermont" ...
  ..$ capital : chr [1:5] "Pierre" "Albany" "Salem" "Montpelier" ...
  ..$ pop_mill: num [1:5] 0.853 17.946 3.97 0.627 1.42
  ..$ area_sqm: num [1:5] 77116 54555 98381 9616 10931
 $ : tibble [5 × 2] (S3: tbl_df/tbl/data.frame)
  ..$ capital : chr [1:5] "Pierre" "Albany" "Salem" "Montpelier" ...
  ..$ pop_mill: num [1:5] 0.853 17.946 3.97 0.627 1.42
```

```R
> read_excel("states.xlsx", sheet = 1, col_names = T, col_types = NULL, skip = 2)
# A tibble: 3 × 4                                                   
  `New York` Albany     `17.946000000000002` `54555`
  <chr>      <chr>                     <dbl>   <dbl>
1 Oregon     Salem                     3.97    98381
2 Vermont    Montpelier                0.627    9616
3 Hawaii     Honolulu                  1.42    10931
```




# 4 Reproducible Excel work with XLConnect




