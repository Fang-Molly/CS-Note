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

## 2.2 Methodical Thinking

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

## 2.3 Method Lookup for Primitive Generics

* For many data analyses, the most time-consuming tasks are writing, debugging and maintaining the code. 

* **R vs. C**

	* C code often runs faster
	* R code is usually easier to write
	* ... and easier to debug

* **R -> C**

R has several interfaces to the C language, and the highest performance of these is known as the "primitive" interface. 

* **Primitive functions**

	* common mathematical functions:
		* `function(x) .Primitive("exp")`
		* `function(x) .Primitive("sin")`
	* arithmetic operators:
		* `function(e1, e2) .Primitive("+")`
		* `function(e1, e2) .Primitive("-")`
	* language constructs:
		* `.Primitive("if")`
		* `.Primitive("for")`
	* generic functions

	```R
	> .S3PrimitiveGenerics
	 [1] "anyNA"          "as.character"   "as.complex"     "as.double"     
	 [5] "as.environment" "as.integer"     "as.logical"     "as.call"       
	 [9] "as.numeric"     "as.raw"         "c"              "dim"           
	[13] "dim<-"          "dimnames"       "dimnames<-"     "is.array"      
	[17] "is.finite"      "is.infinite"    "is.matrix"      "is.na"         
	[21] "is.nan"         "is.numeric"     "length"         "length<-"      
	[25] "levels<-"       "names"          "names<-"        "rep"           
	[29] "seq.int"        "xtfrm"      
	```
	
```R
> all_of_time <- c("1970-01-01", "2012-12-21")
> as.Date(all_of_time)
[1] "1970-01-01" "2012-12-21"

> class(all_of_time)
[1] "character"

# override the class
> class(all_of_time) <- "data_strings"
# as.Date is not primitive generic
> as.Date(all_of_time)
Error in as.Date.default(all_of_time) : 
  do not know how to convert 'all_of_time' to class “Date”
# length is a primitive generic
> length(all_of_time)
[1] 2
```

* **Summary**

	* Some R functions are actually written in C

	* The primitive interface gives best performance

	* `.S3PrimitiveGenerics` lists primitive S3 generics

	* Primitive generics don't throw an error when no method is found


## 2.4 Too Much Class

* Describe the vector using three or more classes

	* The order of the classes is important. You should always have the most specific class first, and gradually get less specific as you move from left to right. 

```R
> x <- c(1, 3, 6, 10, 15)
> class(x)
[1] "numeric"
> class(x) <- c(
+     "triangular_numbers", "natural_numbers", "numeric"
+ )
> class(x)
[1] "triangular_numbers" "natural_numbers"    "numeric"  

# test for numeric vectors
> is.numeric(x)
[1] TRUE

# base-R doesn't have an equivalent is.triangular_numbers()
> is.triangular_numbers(x)
Error in is.triangular_numbers(x) : 
  could not find function "is.triangular_numbers"

# general purpose inherits function
> inherits(x, "triangular_numbers")
[1] TRUE
> inherits(x, "natural_numbers")
[1] TRUE
> inherits(x, "numeric")
[1] TRUE
```
* The more gernal function is slower. For this reason you should use the more specific function if it is available. If your object has multiple classes, you can call multiple S3 methods by using the NextMethod function.

```R
> what_am_i.triangular_numbers <- function(x, ...) {
+     message("I'm triangular numbers")
+     NextMethod("what_am_i")
+ }
> what_am_i.natural_numbers <- function(x, ...) {
+     message("I'm natural numbers")
+     NextMethod("what_am_i")
+ }
> what_am_i.numeric <- function(x, ...) {
+     message("I'm numeric")
+ }
```

* **Summary**

	* Multiple classes are allowed
	* Use `inherits()` to test for arbitrary classes
	* Use `NextMethod()` to chain method calls


# 3. Using R6

## 3.1 The Object Factory

* The R6 system provides a way of storing data and objects within the same variable.

	* The first step is to create a class generator for each of your objects.

* A class generator is a template that describes what data can be stored in the object, and what functions can be applied to the object. 

	* It is also used to create the specified objects. 

	* For this reason, I like to call class generators "factories". 

```R
# Load the R6 package
> library(R6)

# Define class generators with `R6Class()`
# Class names should be UpperCamelCase
> thing_factory <- R6Class(
+     "Thing",
	  # Data fields stored in `private` list, name each element of the list
+     private = list(
+         a_field = "a value",
+         another_field = 123
+     )
+ )

# create some objects by calling the new() method
> a_thing <- thing_factory$new()
> another_thing <- thing_factory$new()
> yet_another_thing <- thing_factory$new()
```

* **Summary**

	* Load the R6 package to work with R6!
	* Define class generators with `R6Class()`
	* Class names should be UpperCamelCase
	* Data fields stored in `private` list
	* Create objects with factory's `new()` method

## 3.2 Hiding Complexity with Encapsulation

* **Encapsulation**

In object-oriented programming, the term for separating the implementation of the object from its user interface is called "encapsulation".

```R
> microwave_oven_factory <- R6Class(
+     "MicrowaveOven",
	  # In R6, all these implementation details are stored in the private element of the class.
+     private = list(
+         power_rating_watts = 800,
+         door_is_open = FALSE
+     ),
      # the user interface details are stored in an element named "public".
+     public = list(
+         open_door = function() {
+             private$door_is_open <- TRUE
+         }
+     )
+ )
```

* `private$` accesses private elements
* `self$` accesses public elements

* `initialize()` : one special public method, it is called automatically when an object is created

```R
# Add an initialize method
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800,
    door_is_open = FALSE
  ),
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked!")
    },
    open_door = function() {
      private$door_is_open <- TRUE
    },
    close_door = function() {
      private$door_is_open <- FALSE
    },
    # Add initialize() method here
    initialize = function(power_rating_watts, door_is_open) {
      if(!missing(power_rating_watts)) {
        private$power_rating_watts <- power_rating_watts
      }
      if(!missing(door_is_open)) {
        private$door_is_open <- door_is_open
      }
    }
  )
)

# Make a microwave
a_microwave_oven <- microwave_oven_factory$new(
  power_rating_watts = 650,
  door_is_open = TRUE
)
```

* **Summary**

	* Encapsulation = separating implementation from UI
	* Store data in `private` list
	* Store methods in `public` list
	* Use `private$` to access private elements
	* `...` and `self$` to access public elements



## 3.3 Getting and Setting with Active Bindings

* controlled access to private fields

	* getting = read the data field
	* setting = write the data field

* Active Bindings

	* defined like functions
	* accessed like data variables

* `active()` use syntax

	* Just like the private and public elements, the active element must be a named list.

	* One of the restrictions of R6 is that the elements of private, public, and active must all have different names. 

	* A useful convention to help distinguish private and active elements is to start all private fields with a double dot. 


```R
> thing_factory <- R6Class(
+     "Thing",
+     private = list(
+         ..a_field = "a value",
+         ..another_field = 123
+     ),
+     active = list(
		  # read-only active binding
		  # takes no arguments
+         a_field = function() {
+             if(is.na(private$..a_field)) {
+                 return("a missing value")
+             }
+             private$..a_field
+         },
		  # read and write
		  # take a single argument
+         another_field = function(value) {
+             if(missing(value)) {
+                 private$..another_filed
+             } else {
+                 assert_is_a_number(value)
+                 private$..another_field <- value
+             }
+         }
+     )
+ )

> a_thing <- thing_factory$new()
> a_thing$a_field
[1] "a value"
> a_thing$a_field <- "a new value"
Error in (function ()  : unused argument (base::quote("a new value"))
> a_thing$another_field <- 456
Error in assert_is_a_number(value) : 
  could not find function "assert_is_a_number"
> a_thing$another_field <- "456"
Error in assert_is_a_number(value) : 
  could not find function "assert_is_a_number"
```

* **Summary**

	* Control private access with active bindings
	* Defined like functions
	* Accessed like data


# 4. R6 Inheritance

## 4.1 Propagating Functionality with Inheritance

* Inherit argument

	* parent class and child class
	* All of the data and functionality of the parent class is passed on to the child. That is, all the fields from the private, public, and active elements. 
	* inheritance only works in one direction
```R
# parent class
> thing_factory <- R6Class(
+     "Thing",
+     private = list(
+         a_field = "a value",
+         another_field = 123
+     ),
+     public = list(
+         do_something = function(x, y, z) {
+             # do something here
+         }
+     )
+ )

# inherit argument
# child classes
> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory
+     public = list(
>         do_something_else = function() {
+             # more functionality
+         }
>     )
> )

> a_thing <- thing_factory$new()
> class(a_thing)
[1] "Thing" "R6"   
> inherits(a_thing, "Thing")
[1] TRUE
> inherits(a_thing, "R6")
[1] TRUE
```

* **Summary**

	* Propagate functionality using inheritance
	* Use the `inherit` arg to `R6Class()`
	* Children get their parent's functionality
	* ... but the converse is not true


## 4.2 Embrace, Extend, Override

```R
> thing_factory <- R6Class(
+     "Thing",
+     public = list(
+         do_something = function() {
+             message("the parent do_something method")
+         }
+     )
+ )
> 
> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory,
+     public = list(
	      # To override functionality, you define elements with the same name as those in the parent.
+         do_something = function() {
+             message("the child do_something method")
+         },
          # To extend the functionality, you simply define new public methods, or private data fields.
+         do_something_else = function() {
+             message("the child do_something_else method")
+         }
+     )
+ )

> a_child_thing <- child_thing_factory$new()
> a_child_thing$do_something()
the child do_something method
```

* accesses
	* `private$` accesses private fields
	* `self$` accesses public methods in self
	* `super$` accesses public methods in parent

```R
> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory,
+     public = list(
+         do_something = function() {
+             message("the child do_something method")
+         },
+         do_something_else = function() {
+             message("the child do_something_else method")
+           self$do_something()
+           super$do_something()
+         }
+      )
+ )
> a_child_thing <- child_thing_factory$new()
> a_child_thing$do_something_else()
the child do_something_else method
the child do_something method
the parent do_something method
```

* **Summary**

	* Override by giving the same name
	* Extend by giving a new name
	* `self$` accesses public methods in self
	* `super$` accesses public methods in parent

## 4.3 Multiple Levels of Inheritance

```R
> thing_factory <- R6Class(
+     "Thing"
+ )

> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory
+ )

> grand_child_thing_factory <- R6Class(
+     "GrandChildThing",
+     inherit = child_thing_factory
+ )

> thing_factory <- R6Class(
+     "Thing",
+     public = list(
+         do_something = function() {
+             message("the parent do_something method")
+         } )
+ )

> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory,
+     public = list(
+         do_something = function() {
+             message("the child do_something method")
+         } )
+ )

> grand_child_thing_factory <- R6Class(
+     "GrandChildThing",
+     inherit = child_thing_factory,
+     public = list(
+         do_something = function() {
+             message("the grand-child do_something method")
+             super$do_something()
+             super$super$do_something()
+         } )
+ )

# This doesn't work for trying to access the grandparent method.R6 classes only have access to their direct parent. The grand-child class cannot access its grand-parent

> a_grand_child_thing <- grand_child_thing_factory$new()
> a_grand_child_thing$do_something()
the grand-child do_something method
the child do_something method
Error in a_grand_child_thing$do_something() : 
  attempt to apply non-function
  
> child_thing_factory <- R6Class(
+     "ChildThing",
+     inherit = thing_factory,
+     public = list(
+         do_something = function() {
+             message("the child do_something method")
+         } ),
+     active = list(
+         super_ = function() super
+     ) )

# the intermediate classes can make use of active bindings to expose their own parent. The active binding you need to add is read-only, and it simply returns super.

> grand_child_thing_factory <- R6Class(
+     "GrandChildThing",
+     inherit = child_thing_factory,
+     public = list(
+         do_something = function() {
+             message("the grand-child do_something method")
+             super$do_something()
+             super$super_$do_something() 
+         } )
+ )
> a_grand_child_thing <- grand_child_thing_factory$new()
> a_grand_child_thing$do_something()
the grand-child do_something method
the child do_something method
the parent do_something method
```

* **Summary**

	* R6 objects can only access their direct parent
	* Intermediate classes can expose their parent
	* Use an active binding named `super_`
	* `super_` should simply return `super`


# 5. Advanced R6 Usage

## 5.1 Environments, Reference Behavior, & Shared Fields

* There are two types of variable that can be used to store other variables.

	* list
	
	* environment
	
```R
# create a new list with contents
> lst <- list(x = pi ^ (1:5), y = matrix(month.abb, 3))

# print the list
> lst
$x
[1]   3.141593   9.869604  31.006277  97.409091 306.019685

$y
     [,1]  [,2]  [,3]  [,4] 
[1,] "Jan" "Apr" "Jul" "Oct"
[2,] "Feb" "May" "Aug" "Nov"
[3,] "Mar" "Jun" "Sep" "Dec"

# check the structure
> ls.str(lst)
x :  num [1:5] 3.14 9.87 31.01 97.41 306.02
y :  chr [1:3, 1:4] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" ...
```

```R
# Create a new environment with no contents, empty
env <- new.env()

# Add contents
# use dollar operator
> env$x <- pi ^ (1:5)
# use double square brackets operator
> env[["y"]] <- matrix(month.abb, 3)

# check the contents of the environment
# The print method for environments isn't very informative
> env
<environment: 0x7fba0aa4e0e8>
# check the structure
> ls.str(env)
x :  num [1:5] 3.14 9.87 31.01 97.41 306.02
y :  chr [1:3, 1:4] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" ...
```

* The environments behave differently from lists when working with R6 classes.

```R
# copy by value
> lst2 <- lst
> (lst$x <- exp(1:5))
[1]   2.718282   7.389056  20.085537  54.598150 148.413159
> lst$x
[1]   2.718282   7.389056  20.085537  54.598150 148.413159
> lst2$x
[1]   3.141593   9.869604  31.006277  97.409091 306.019685
# the change wasn't transferred to the second list
> identical(lst$x, lst2$x)
[1] FALSE
```

```R
# copy by reference
> env2 <- env
> (env$x <- exp(1:5))
[1]   2.718282   7.389056  20.085537  54.598150 148.413159
> env2$x
[1]   2.718282   7.389056  20.085537  54.598150 148.413159
# the change has been transferred to the second environment
> identical(env$x, env2$x)
[1] TRUE
```

* R6 classes can take advantage of copying by reference to share data between all instances of a class. 

```R
> thing_factory <- R6Class(
+     "Thing",
+     private = list(
+         shared = {
+             e <- new.env()
+             e$a_shared_field = 123
+             e
+         }
+     ),
+     active = list(
+         a_shared_field = function(value) {
+             if(missing(value)) {
+                 private$shared$a_shared_field
+             } else {
+                 private$shared$a_shared_field <- value
+             }
+         }
+     )
+ )

> a_thing <- thing_factory$new()
> another_thing <- thing_factory$new()
> a_thing$a_shared_field
[1] 123
> another_thing$a_shared_field
[1] 123

> a_thing$a_shared_field <- 456
> another_thing$a_shared_field
[1] 456
```

* **Summary**

	* Create environments with `new.env()`
	* Manipulate them using list syntax
	* Environments copy by reference
	* Shared R6 fields using an environment field


## 5.2 Cloning R6 Objects

* Environments use copy by reference. R6 objects are built using environments, they also use copy by reference.

```R
> thing_factory <- R6Class(
+     "Thing",
+     private = list(
+         ..a_field = 123
+     ),
+     active = list(
+         a_field = function(value) {
+             if(missing(value)) {
+                 private$..a_field
+             } else {
+                 private$..a_field <- value
+             }
+         }
+     )
+ )
> 
> a_thing <- thing_factory$new()
> a_copy <- a_thing
> a_thing$a_field <- 456
> a_copy$a_field
[1] 456
```

* clone() copies by value

```R
# when you change one of the fields in the original, the clone is unaffected.
> a_clone <- a_thing$clone()
> a_thing$a_field <- 789
> a_clone$a_field
[1] 456
```

* One special case is when R6 classes contain other R6 classes.

```R
> container_factory <- R6Class(
+     "Container",
+     private = list(
+         ..thing = thing_factory$new()
+     ),
+     active = list(
+         thing = function(value) {
+             if(missing(value)) {
+                 private$..thing
+             } else {
+                 private$..thing <- value
+             }
+         }
+     )
+ )

> a_container <- container_factory$new()
> a_clone <- a_container$clone()

> a_container$thing$a_field <- "a new value"
> a_clone$thing$a_field
[1] "a new value"

# To use copy by value for the fields of the internal R6 object, you need to call clone with the argument deep equals TRUE. 
> a_deep_clone <- a_container$clone(deep = TRUE)
> a_container$thing$a_field <- "a different value"
> a_deep_clone$thing$a_field
[1] "a new value"
```

* **Summary**

	* R6 objects copy by reference
	* Copy them by value using `clone()`
	* `clone()` is autogenerated
	* `clone(deep = TRUE)` is for R6 fields


## 5.3 Shut it Down

If an R6 object connects to a database or a file, then it can be dangerous to delete it without making sure that you close the connections first. Similarly, if the R6 object has any side effects such as changing global options or global plotting parameters, then it is good practise to return those settings back to their previous state. 

* `initialize()` customizes startup


* `finallize()` customizes cleanup
	* finalize is always a function with no arguments, defined in the public element of an R6 class.

```R
> thing_factory <- R6Class(
+     "Thing",
+     private = list(
+         ..a_field = 123
+     ),
+     public = list(
+         initialize = function(a_field) {
+             if(!missing(a_field)) {
+                 private$a_field = a_field
+             }
+         },
+         finalize = function() {
+             message("Finalizing the Thing")
+         }
+     )
+ )
> 
> a_thing <- thing_factory$new()
# delete the thing, the finalize method isn't called immediately
> rm(a_thing)
# force delete by calling the gc function
> gc()
Finalizing the Thing
          used (Mb) gc trigger  (Mb) limit (Mb) max used  (Mb)
Ncells 1102306 58.9    2384221 127.4         NA  2384221 127.4
Vcells 2004824 15.3    8388608  64.0      16384  3585319  27.4
```

```R
> database_manager_factory <- R6Class(
+     "DatabaseManager",
+     private = list(
+         conn = NULL
+     ),
+     public = list(
+         initialize = function(a_field) {
+             private$conn <- dbConnect("some-database.sqlite")
+         },
+         finalize = function() {
+             dbDisconnect(private$conn)
+         }
+     )
+ )
```

* **Summary**

	* `finalize()` cleans up after R6 objects
	* It is useful when working with databases
	* It gets called during garbage collection




