Introduction to Writing Functions in R
======================================

# 1. How to write a function

## 1.1 Why you should use functions

* **The arguments to mean()**

Mean has 3 arguments

	* `x`: A numeric or date-time vector
	
	* `trim`: The proportion of highest and lowest values to remove before calculating
	
	* `na.rm`: A logical value determining whether missing values should be removed
	
```R
# show the arguments to mean()
> args(mean)
function (x, ...) 
NULL
```
	
* **Calling mean()**

	* Pass arguments by position

	`mean(numbers, 0.1, TRUE)`
	
	* Pass arguments by name

	`mean(na.rm = TRUE, trim = 0.1, x = numbers)`
	
	* Common arguments by position, rare arguments by name

	`mean(numbers, trim = 0.1, na.rm = TRUE)`
	
* **Benefits of writing functions**

	* Functions eliminate repetition from your code, which

		* can reduce your workload, and
		* help avoid errors

	* Functions also allow code reuse and sharing

## 1.2 Converting scripts into functions

* A basic function template

```R
my_function <- function(arg1, arg2) {
	# Do something
}
```

	* The signature
	
	```R
	function(arg1, arg2)
	```
	
	* The body
	
	```R			
	{
		# Do something
	}
	```

* Make a template

```R
import_test_scores <- function() {

}
```

* Paste your script into the body

```R
import_test_scores <- function() {
	test_scores_geography_raw <- read_csv("test_scores_geography.csv")
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Choose the arguments

```R
import_test_scores <- function(filename) {   # <- only 1 argument
	test_scores_geography_raw <- read_csv("test_scores_geography.csv")
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Replace specific values with arguments

```R
import_test_scores <- function(filename) {  
	test_scores_geography_raw <- read_csv(filename)  # <- replace specific filename
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Generalize variable names

```R
import_test_scores <- function(filename) {  
	test_scores_raw <- read_csv(filename)  # <- variable names generalized
	
	test_scores_clean <- test_scores_raw %>%  # <- variable names generalized
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Remove the final assignment

```
import_test_scores <- function(filename) {  
	test_scores_raw <- read_csv(filename)
	
	test_scores_raw  %>%  # <- remove assignment
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* **sample()**

```
> args(sample)
function (x, size, replace = FALSE, prob = NULL) 
```

	* Arguments of sample()
	
		* `x`: A vector of values to sample from
		* `size`: How many times do you want to sample from x?
		* `replace`: Should you sample with replacement or not?
		* `prob`: A vector of sampling weights for each value of x, totaling one.
		

## 1.3 Y kant I reed ur code?

* lm() is badly named

	* Acronyms aren't self-explanatory

	* It doesn't contain a verb

	* There are lots of different linear models

A better name would be `run_linear_regression()`

* Readability vs. typeability

	* Understanding code >> typing code
	* Code editors have autocomplete
	* You can alias common functions

	```
	> h <- head
	> data(cats, package = "MASS")
	> h(cats)
	  Sex Bwt Hwt
	1   F 2.0 7.0
	2   F 2.0 7.4
	3   F 2.0 9.5
	4   F 2.1 7.2
	5   F 2.1 7.3
	6   F 2.1 7.6
	```

* Arguments of lm()

```
> args(lm)
function (formula, data, subset, weights, na.action, method = "qr", 
    model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
    contrasts = NULL, offset, ...) 
```

* Types of argument

	* Data arguments: what you compute on

	* Detail arguments: how you perform the computation

```
> args(cor)
function (x, y = NULL, use = "everything", method = c("pearson", 
    "kendall", "spearman")) 
```

* Data args should precede detail args

# 2. All about arguments

## 2.1 Default arguments




## 2.2 Passing arguments between functions



## 2.3 Checking arguments





# 3. Return values and scope

## 3.1 Returning values from functions


## 3.2 Returning multiple values from functions

* **Getting the session information**

```R
> R.version.string
[1] "R version 4.1.2 (2021-11-01)"

> Sys.info()[c("sysname", "release")]
 sysname  release 
"Darwin" "21.3.0" 

> loadedNamespaces()
 [1] "htmlwidgets"    "microbenchmark" "compiler"       "magrittr"      
 [5] "fastmap"        "profvis"        "graphics"       "parallel"      
 [9] "htmltools"      "tools"          "utils"          "yaml"          
[13] "grDevices"      "stats"          "datasets"       "stringi"       
[17] "methods"        "jsonlite"       "stringr"        "digest"        
[21] "rlang"          "base"   
```

* **Defining session()**

```R
> session <- function() {
+     list(
+         r_version = R.version.string,
+         operating_system = Sys.info()[c("sysname", "release")],
+         loaded_pkgs = loadedNamespaces()
+     )
+ }

# calling session()

> session()
$r_version
[1] "R version 4.1.2 (2021-11-01)"

$operating_system
 sysname  release 
"Darwin" "21.3.0" 

$loaded_pkgs
 [1] "htmlwidgets"    "microbenchmark" "compiler"       "magrittr"      
 [5] "fastmap"        "profvis"        "graphics"       "parallel"      
 [9] "htmltools"      "tools"          "utils"          "yaml"          
[13] "grDevices"      "stats"          "datasets"       "stringi"       
[17] "methods"        "jsonlite"       "stringr"        "digest"        
[21] "rlang"          "base"          
```

* **Multi-assignment**

```R
> library(zeallot)
> c(vrsn, os, pkgs) %<-% session()
> vrsn
[1] "R version 4.1.2 (2021-11-01)"
> os
 sysname  release 
"Darwin" "21.3.0" 
> pkgs
 [1] "htmlwidgets"    "microbenchmark" "compiler"       "magrittr"      
 [5] "fastmap"        "profvis"        "graphics"       "parallel"      
 [9] "htmltools"      "tools"          "utils"          "yaml"          
[13] "grDevices"      "stats"          "datasets"       "stringi"       
[17] "zeallot"        "methods"        "jsonlite"       "stringr"       
[21] "digest"         "rlang"          "base"          
```

* **Attributes**

```R
> month_no <- setNames(1:12, month.abb)
> month_no
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
  1   2   3   4   5   6   7   8   9  10  11  12 
  
> attributes(month_no)
$names
 [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov"
[12] "Dec"

> attr(month_no, "names")
 [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov"
[12] "Dec"

> attr(month_no, "names") <- month.name
> month_no
  January  February     March     April       May      June      July 
        1         2         3         4         5         6         7 
   August September   October  November  December 
        8         9        10        11        12 
```

* **Attributes of a data frame**

* **Attributes added by group_by()**

```
library(dplyr)
orange_trees %>%
	group_by(Tree) %>%
	attributes()
```

* **When to use each technique**

	* If you need the result to have a particular type, add additional return values as attributes.
	* Otherwise, collect all return values into a list

* **broom**

Model objects are converted into 3 data frames

|function   |level      |example           |
|:---------:|:---------:|:----------------:|
|`glance()` |model      |degrees of freedom|
|`tidy()`   |coefficient|p-values          |
|`augment()`|observation|residuals         |

* Practice

```R
# Look at the structure of model (it's a mess!)
str(model)

# Use broom tools to get a list of 3 data frames
list(
  # Get model-level values
  model = glance(model),
  # Get coefficient-level values
  coefficients = tidy(model),
  # Get observation-level values
  observations = augment(model)
)

# Wrap this code into a function, groom_model
groom_model <- function(model) {

  list(
    model = glance(model),
    coefficients = tidy(model),
    observations = augment(model)
  )
}

# From previous step
groom_model <- function(model) {
  list(
    model = glance(model),
    coefficients = tidy(model),
    observations = augment(model)
  )
}

# Call groom_model on model, assigning to 3 variables
c(mdl, cff, obs) %<-% groom_model(model)

# See these individual variables
mdl; cff; obs
```

```R
pipeable_plot <- function(data, formula) {
  plot(formula, data)
  # Add a "formula" attribute to data
  attr(data, "formula") <- formula
  invisible(data)
}

# From previous exercise
plt_dist_vs_speed <- cars %>% 
  pipeable_plot(dist ~ speed)

# Examine the structure of the result
str(plt_dist_vs_speed)
```

## 3.3 Environments

* **Environments are like lists**

```R
> datacamp_lst <- list(
+     name = "DataCamp",
+     founding_year = 2013,
+     website = "http://www.datacamp.com"
+ )

> ls.str(datacamp_lst)
founding_year :  num 2013
name :  chr "DataCamp"
website :  chr "http://www.datacamp.com"

# convert the list to an environment
> datacamp_env <- list2env(datacamp_lst)

> ls.str(datacamp_env)
founding_year :  num 2013
name :  chr "DataCamp"
website :  chr "http://www.datacamp.com"
```

* **Environments have parents**

* **Getting the parent environment** 

```R
> parent <- parent.env(datacamp_env)
> environmentName(parent)
[1] "R_GlobalEnv"
> grandparent <- parent.env(parent)
> environmentName(grandparent)
[1] "package:zeallot"

# show all the parent environment to store all its functions and other variables
> search()
 [1] ".GlobalEnv"             "package:zeallot"       
 [3] "package:parallel"       "package:profvis"       
 [5] "package:microbenchmark" "tools:rstudio"         
 [7] "package:stats"          "package:graphics"      
 [9] "package:grDevices"      "package:utils"         
[11] "package:datasets"       "package:methods"       
[13] "Autoloads"              "package:base"    
```

* **Does a variable exist?**

```R
> datacamp_lst <- list(
+     name = "DataCamp",
+     website = "http://www.datacamp.com"
+ )

> datacamp_env <- list2env(datacamp_lst)
> founding_year <- 2013

> exists("founding_year", envir = datacamp_env)
[1] TRUE

> exists("founding_year", envir = datacamp_env, inherits = FALSE)
[1] FALSE
```





## 3.4 Scope and precedence













