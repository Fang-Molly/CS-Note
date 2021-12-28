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
   
   * utils - read.csv
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
> str(df)
'data.frame':	5 obs. of  4 variables:
 $ state   : chr  "South Dakota" "New York" "Oregon" "Vermont" ...
 $ capital : chr  "Pierre" "Albany" "Salem" "Montpelier" ...
 $ pop_mill: num  0.853 17.946 3.97 0.627 1.42
 $ area_sqm: int  77116 54555 98381 9616 10931
```





