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
: --------- : | : --------- :  
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































