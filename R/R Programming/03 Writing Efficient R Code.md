Writing Efficient R Code
------------------------

# 1. The Art of Benchmarking

## 1.1 Use an up-to-date version of R

```R
# print the R version details using version
> version
               _                           
platform       x86_64-apple-darwin17.0     
arch           x86_64                      
os             darwin17.0                  
system         x86_64, darwin17.0          
status                                     
major          4                           
minor          1.0                         
year           2021                        
month          05                          
day            18                          
svn rev        80317                       
language       R                           
version.string R version 4.1.0 (2021-05-18)
nickname       Camp Pontanezen             

# assign the variable major to the major component
> major <- version$major
> major
[1] "4"

# extract the component using $ sign
> version$platform
[1] "x86_64-apple-darwin17.0"
```

## 1.2 Benchmarking

* Two steps for benchmarking

1. We construct a function around the feature we wish to benchmark
2. We time the function under different senarios, e.g. data set

* Example: Sequence of numbers

```R
# option 1
> 1:5
[1] 1 2 3 4 5

# option 2
> seq(1, 5)
[1] 1 2 3 4 5

# option 3
> seq(1, 5, by=1)
[1] 1 2 3 4 5
```

* Function wrapping

```R
> colon <- function(n) 1:n
> colon(5)
[1] 1 2 3 4 5

> seq_default <- function(n) seq(1, n)
> seq_default(5)
[1] 1 2 3 4 5

> seq_by <- function(n) seq(1, n, by = 1)
> seq_by(5)
[1] 1 2 3 4 5
```

* Timing with system.time()

    * user time: the CPU time charged for the execution of user instructions
    * system time: the CPU time charged for execution by the system on behalf of the calling process
    * elapsed time: the sum of user and system
 
```R
> system.time(colon(1e8))
   user  system elapsed 
  0.002   0.000   0.001 
> system.time(seq_default(1e8))
   user  system elapsed 
  0.001   0.000   0.002 
> system.time(seq_by(1e8))
   user  system elapsed 
  1.087   0.504   1.591 
```

* Storing the result

> The <- operation performs both:
> * Argument passing
> * Object assignment

```R
system.time(res <- colon(1e8))
```

* Microbenchmark package

    * Compare functions: each function is run multiple times

```R
> install.packages("microbenchmark")
> library("microbenchmark")
> microbenchmark(colon(n),
+                seq_default(n),
+                seq_by(n),
+                times = 10)

Unit: nanoseconds
           expr        min         lq         mean       median         uq        max neval
       colon(n)        902        932       4724.1       4583.0       7271      11838    10
 seq_default(n)       7427      29322      30226.6      34483.5      35408      45403    10
      seq_by(n) 1450610164 1580209425 1612289078.9 1601634488.0 1669056857 1756707381    10
```







