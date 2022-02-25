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

## 1.3 How good is your machine?

* The benchmarkme package

```R
> install.packages("benchmarkme")
> library(benchmarkme)
# run each benchmark 3 times
# benchmark_std
> res <- benchmark_std(runs = 3)
> plot(res)
# The first plot is elapsed time, the second is relative timing
> upload_results(res)
```

```R
# get the amount of RAM on your machine
get_ram()
# get the CPU specifications on your machine
get_cpu()
```

```R
# benchmark_io
# record the length of time it takes to read and write a file
> res <- benchmark_io(runs = 1, size = 5)
> plot(res)
```


# 2. Fine Tuning : Efficient Base R

## 2.1 Memory allocation

* Avoid growing a vector

## 2.2 Importance of vectorizing your code

* **General rule**

    * Calling an R function eventually leads to C or FORTRAN code
        * This code is very heavily optimized

> **Goal**

>    * Access the underlying C or FORTRAN code as quickly as possible; the fewer functions call the better.

* **Vectorized functions**

    * Many R functions are vectorized 

        * Single number but return a vector

	```
	> rnorm(4)
	[1] -0.3396113 -0.8526215  0.2050147 -0.9276649
	```

    * Vector as input
    
	```
	> mean(c(36, 48))
	[1] 42
	```

* Generating random numbers

```
> library(microbenchmark)
> microbenchmark(
+     x <- rnorm(n), 
+     {
+         for(i in seq_along(x))
+             x[i] <- rnorm(1)
+         }, 
+     times = 10
+ )
Unit: milliseconds
                                             expr        min        lq       mean     median         uq        max neval
                                    x <- rnorm(n)   59.77967   59.8563   62.66324   60.50078   65.78511   70.73464    10
 {     for (i in seq_along(x)) x[i] <- rnorm(1) } 2164.92506 2172.7027 2235.53233 2220.51049 2231.07852 2479.21898    10
```

```
> microbenchmark(
+     x <- rnorm(n), times = 10
+ )
Unit: milliseconds
          expr      min       lq     mean   median       uq      max neval
 x <- rnorm(n) 59.88627 60.12717 62.35421 62.25651 64.12752 66.25636    10
```

* Why is the loop slow?

* The second rule of R club:

    * Use a vectorized solution wherever possible

## 2.3 Data frames and matrices

* The data frame

	* Copied in other languages

		* Pyhton: pandas data frame
		* If you can't beat them, join them!

	* Tabular structure : rows and colums
	
		* `read.csv()` and friends returns a data frame

			* Columns

		* Data must be the same type
			* Rows

		* Different type

* Matrices

	* It's a rectangular data structure

		* You can perform usual subsetting and extracting operations
		* But - every element must be the same data type

* The third rule of R club: Use a matrix whenever appropriate

```
# compare which is faster
> microbenchmark(mat[, 1], df[, 1])
Unit: microseconds
     expr   min     lq    mean median     uq    max neval
 mat[, 1] 1.353 1.5955 1.84349 1.7475 1.9215  5.770   100
  df[, 1] 7.964 8.4395 9.73245 8.6640 9.3620 58.734   100
  
> microbenchmark(mat[1, ], df[1, ])
Unit: microseconds
     expr      min        lq       mean    median       uq       max neval
 mat[1, ]    5.494    7.1865   19.40911    8.3225   33.571    42.635   100
  df[1, ] 5929.712 7153.0825 8347.77326 7694.3085 8848.912 16869.853   100
```

# 3. Diagnosing Problems: Code Profiling

## 3.1 What is code profiling

* **Code profiling**

	* The general idea is to:

		* Run the code
		* Every few milliseconds, record what is being currently executed

	* `Rprof()` comes with R and does exactly this 

		* Tricky to use

	* Use **profvis** instead

* **IMDB data set**

	* From the **ggplot2movies** package

	```
	> data(movies, package = "ggplot2movies")
	> dim(movies)
	[1] 58788    24
	```
	
	* Data frame: around 60,000 rows and 24 columns
	
	* Each row corresponds to a particular movie

* **Braveheart**

	```
	> braveheart = movies[7288,]
	> braveheart
	          title year length   budget rating votes  r1  r2  r3  r4  r5  r6   r7   r8   r9  r10 mpaa Action Animation Comedy Drama Documentary Romance Short
	7288 Braveheart 1995    177 53000000    8.3 92437 4.5 4.5 4.5 4.5 4.5 4.5 14.5 14.5 24.5 34.5    R      1         0      0     1           0       0     0
	```
	
	```
	# Load data
	> data(movies, package = "ggplot2movies")
	> braveheart <- movies[7288,]
	> movies <- movies[movies$Action==1,]
	> plot(movies$year, movies$rating, xlab = "year", ylab = "Rating")
	
	# local regression line
	> model <- loess(rating ~ year, data = movies)
	> j <- order(movies$year)
	> lines(movies$year[j], model$fitted[j], col = "forestgreen")
	> points(braveheart$year, braveheart$rating, pch = 21, bg = "steelblue")
	```
	
* **Profvis**

	* RStudio has integrated support for profiling with profvis

		* Highlight the code you want to profile

		* `Profile -> Profile Selected lines`

	* Command line
	
	```
	> library("profvis")
	> profvis({
	+     data(movies, package = "ggplot2movies")
	+     braveheart = movies[7288,]
	+     movies <- movies[movies$Action==1,]
	+     plot(movies$year, movies$rating, xlab = "year", ylab = "Rating")
	+     model <- loess(rating ~ year, data = movies)
	+     j <- order(movies$year)
	+     lines(movies$year[j], model$fitted[j], col = "forestgreen", lwd=2)
	+     points(braveheart$year, braveheart$rating, pch = 21, bg = "steelblue", cex = 3)
	+ })
	```

## 3.2 Profvis: Larger example


## 3.3 Monopoly overview



# 4. Turbo Charged Code: Parallel Programming

## 4.1 CPUs - why do we have more than one?

* CPUs: brains of the computer
	
	* Speed has slowly stabilized
		* CPUs were getting too hot

	* Multi-core CPUs

	* But R only uses 1 core

* Your CPU

```
> library("parallel")
> detectCores()
[1] 8

> library("benchmarkme")
> get_cpu()
$vendor_id
[1] "GenuineIntel"

$model_name
[1] "Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz"

$no_of_cores
[1] 8
```

## 4.2 What sort of problems benefit from parallel computing?

* Running in parallel

	* Not every analysis can make use of multiple cores

		* Many statistical algorithms can only use a single core















