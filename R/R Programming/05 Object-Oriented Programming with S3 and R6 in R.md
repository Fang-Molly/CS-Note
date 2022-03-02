Object-Oriented Programming with S3 and R6 in R
===============================================

# 1. Introduction to Object-Oriented Programming (OOP)

## 1.1 What is Object-Oriented Programming?

In OOP, functions are known as methods. 

OOP works best when you have a limited number of objects that you completely understand the behavior of. 

	* bioconductor
	* apis
	* graphical user interfaces, or GUIs. 

* with functional programming, you think about the functions first, and then how you use them on your data. 

* With object-oriented programming, you think about the data structures first, then worry about their functionality. 

# 1.2 The Nine Systems

* **No longer used**

	* **R5** and **mutatr** were both experimental systems that never made it into real-world use before being abandoned. It’s almost impossible to use these, even if you wanted to.

	* **OOP** is defunct and no longer available. 

	* **proto** had a brief moment of popularity as the underlying system in early versions of the ggplot2 package but is no longer really used.

	* **R-dot-oo** has been around for years, but hasn’t really taken off at all. 

* **Need to learn**

	* The **S3** system was introduced in the third version of the S language that was the precursor to R. It’s been around since the 1980s, so it’s completely mature, and still in wide use. S3 is a very simple system. In fact it only implements one feature of object-oriented programming, that is, the ability to have functions work in different ways on different types of object. It’s a one-trick pony, but it’s a great trick. Using S3 is a fundamental R skill that you need to learn. 

	* **S4** was introduced, as you might be able to guess, in the fourth version of S. Again, that means that it is mature, and there’s a lot of code built with it. Unfortunately, it’s also a bit weird, so in most cases I don’t recommend S4 as a first choice for new projects. There is one exception to this: most of the packages on Bioconductor use S4, so if you work with ‘omics data, then S4 is an essential skill. 

	* **ReferenceClasses** are an attempt to create a system that behaves similarly to popular object-oriented languages like Java or C#. You get powerful features like encapsulation and inheritance. However, I’m hesitant to recommend it as your first choice for new projects because of the last system that we’re going to discuss. 

	* **R6** covers much of the same ground as ReferenceClasses but does so in a simpler way. This means that the code is a little easier to work with, and is higher performance.

> **Summary**
	
	* Use S3 regularly
	* Use R6 when you need more power
	* Use S4 for Bioconductor
	* Maybe use ReferenceClasses
	
## 1.3 How does R Distinguish Variables?

* `str()`

```R
str(sleep)

class(sleep)
"data.frame"
```


* **int_mat**

```R
> (int_mat <- matrix(1:12, 3))

     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12
> 
> class(int_mat)
[1] "matrix" "array" 
> 
> typeof(int_mat)
[1] "integer"
```

* **num_mat**

```R
> (num_mat <- matrix(rnorm(12), 3))
          [,1]       [,2]       [,3]       [,4]
[1,] 0.6466895 -0.9857546 -0.2619487 -3.0307324
[2,] 0.2685760 -1.2093904  0.6921124 -0.3247377
[3,] 0.9401930 -0.4815405 -0.4690010  0.1073004

> class(num_mat)
[1] "matrix" "array" 

> typeof(num_mat)
[1] "double"
```

* **mode() and storage.mode()**

These functions exist solely for compatibility with older S code, so while you need to know that they exist, you should never need to use them.

* **Summary**

	* `class()`: your first choice for determining the kind of variable

	* `typeof()`: also occasionally useful

	* `mode()` and `storage.mode()`: old functions; don't use them

## 1.4 Assigning Classes

* **rexp()**

```R
> (x <- rexp(10))
 [1] 0.3669343 2.7648103 0.2437935 0.1609846 1.3697366 2.4230560 0.1310032
 [8] 2.4345109 0.7593665 0.1934445
 
> class(x)
[1] "numeric"
> typeof(x)
[1] "double"

# overried the class
> class(x) <- "random_numbers"
> x
 [1] 0.3669343 2.7648103 0.2437935 0.1609846 1.3697366 2.4230560 0.1310032
 [8] 2.4345109 0.7593665 0.1934445
attr(,"class")
[1] "random_numbers"

> class(x)
[1] "random_numbers"
# you can't override typeof
> typeof(x)
[1] "double"

# best way to check that x is a number, regardless of how the class value has changed
> is.numeric(x)
[1] TRUE
> length(x)
[1] 10
> mean(x)
[1] 0.7885191
```

```R
# Explore the structure of chess
str(chess)

# Override the class of chess
class(chess) <- "chess_game"

# Check whether or not chess is a list
is.list(chess)

# flatten the object using unlist()
# How many pieces are left on the board?
length(unlist(chess))
```

# 2. Using S3

## 2.1 Generics and Methods

* **summary() function**

```R
> summary(c(TRUE, FALSE, NA, TRUE))
   Mode   FALSE    TRUE    NA's 
logical       1       2       1 

> summary(rgamma(1000, 1))
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
0.001664 0.285857 0.673589 0.997056 1.368943 6.594407 
```

* **S3 system**

	* Split functions into two parts: generic function and method functions for each class

* **Generic function**

	* `summary()`

	```R
	> summary
	function (object, ...) 
	UseMethod("summary")
	<bytecode: 0x7ff473c21168>
	<environment: namespace:base>
	```

	* `print()`
	
	```R
	> print
	function (x, ...) 
	UseMethod("print")
	<bytecode: 0x7ff475d7d180>
	<environment: namespace:base>
	```

* There are two conditions that you must follow for S3 methods. 

1. Methods are named generic.class

the name of each method must be the name of the generic, then a dot, then the class of the variable.

* `print.Date`
* `summary.factor`
* `unique.array`


2. Method signatures contain generic signatures

the arguments to the method must include all the arguments to the generic.

```R
> args(print)
function (x, ...) 
NULL

> args(print.Date)
function (x, max = NULL, ...) 
NULL
```

* pass arguments between methods with `...` include it in both generic and methods

```R
> print.function
function (x, useSource = TRUE, ...) 
print.default(x, useSource = useSource, ...)
<bytecode: 0x7ff475d03180>
<environment: namespace:base>

> print.Date
function (x, max = NULL, ...) 
{
    if (is.null(max)) 
        max <- getOption("max.print", 9999L)
    if (max < length(x)) {
        print(format(x[seq_len(max)]), max = max + 1, ...)
        cat(" [ reached 'max' / getOption(\"max.print\") -- omitted", 
            length(x) - max, "entries ]\n")
    }
    else if (length(x)) 
        print(format(x), max = max, ...)
    else cat(class(x)[1L], "of length 0\n")
    invisible(x)
}
<bytecode: 0x7ff475875c90>
<environment: namespace:base>
```

* **Summary**

	* Functions split into generic + method
	* Methods named `generic.class`
	* Methods args contain generic args
	* Include a `...` arg
	* Use `lower_snake_case` or `lowerCamelCase`

## 2.2 1. Methodical Thinking

* **`methods()` function**

```R
> methods("mean")
[1] mean.Date     mean.default  mean.difftime mean.IDate*   mean.ITime*   mean.POSIXct 
[7] mean.POSIXlt 
see '?methods' for accessing help and source code
```

```R
> methods(class = "glm") # or methods(class = glm)
 [1] add1           anova          coerce         confint        cooks.distance
 [6] deviance       drop1          effects        extractAIC     family        
[11] formula        influence      initialize     logLik         model.frame   
[16] nobs           predict        print          residuals      rstandard     
[21] rstudent       show           slotsFromS3    summary        vcov          
[26] weights       
see '?methods' for accessing help and source code
```

* **methods() returns S3 and S4 methods**

```R
# find only the S3 methods for a given generic or class
> .S3methods(class = "glm")
 [1] add1           anova          confint        cooks.distance deviance      
 [6] drop1          effects        extractAIC     family         formula       
[11] influence      logLik         model.frame    nobs           predict       
[16] print          residuals      rstandard      rstudent       summary       
[21] vcov           weights       
see '?methods' for accessing help and source code
```

```R
> .S4methods(class = "glm")
[1] coerce      initialize  show        slotsFromS3
see '?methods' for accessing help and source code
```

* **Summary**

	* `methods()` finds methods for a generic
	* `...` or for a class
	* `.S3methods()` finds only S3 methods






















