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

* **Accessing variables outside functions**

when you call a function, R gives it an environment to store its variables.

```R
> x_times_y <- function(x) {
+     x * y
+ }
> x_times_y(10)
Error in x_times_y(10) : object 'y' not found
```

we define y outside the function. Now the function call works.

```R
> x_times_y <- function(x) {
+     x * y
+ }
> y <- 4
> x_times_y(10)
[1] 40
```

* **Accessing function variables from outside**

You can't look inside the function's environment from outside

```R
> x_times_y <- function(x) {
+     x * y
+ }
> y <- 4
> x_times_y(10)
[1] 40
> print(x)
Error in print(x) : object 'x' not found
```

* **What's best? Inside or outside?**

Remember that R will search for variables inside the function first. If it finds y there, it doesn't need to look in the parent environment.

```R
# y is defined inside the function and in the global environment
> x_times_y <- function(x) {
+     y <- 6
+     x * y
+ }
> y <- 4
> x_times_y(10)
[1] 60
```

* **Passed in vs. defined in**

```R
# x is passed into the function and also defined inside the function body
> x_times_y <- function(x) {
+     x <- 9
+     y <- 6
+     x * y
+ }
> y <- 4
> x_times_y(10)
[1] 54
```

# 4. Case study on grain yields

## 4.1 Grain yields and unit conversion

* **magrittr's pipeable operator replacements**

|operator|functional alternative    |
|:------:|:------------------------:|
|`x * y` | `x %>% multiply_by(y)`   |
|`x ^ y` | `x %>% raise_to_power(y)`|
|`x[y]`  | `x %>% extract(y)`       |

The operators on the left aren't very easy to use in a chain of pipes. The magrittr package has some functions that replace arithmetic and subsetting operators, in order to make your code more pipe friendly.

```R
# Write a function to convert sq. yards to sq. meters
sq_yards_to_sq_meters <- function(sq_yards) {
  sq_yards %>%
    # Take the square root
    sqrt() %>%
    # Convert yards to meters
    yards_to_meters() %>%
    # Square it
    raise_to_power(2)
}

# View the corn dataset
glimpse(corn)

corn %>%
  # Add some columns
  mutate(
    # Convert farmed area from acres to ha
    farmed_area_ha = acres_to_hectares(farmed_area_acres),
    # Convert yield from bushels/acre to kg/ha
    yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
      yield_bushels_per_acre, 
      crop = "corn"
    )
  )
  # Wrap this code into a function
fortify_with_metric_units <- function(data, crop) {
  data %>%
    mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
        yield_bushels_per_acre, 
        crop = crop
      )
    )
}

# Try it on the wheat dataset
fortify_with_metric_units(wheat, crop = "wheat")
```

## 4.2 Visualizing grain yields

* **The corn dataset**

```R
glimpse(corn)
```

* **ggplot2: drawing multiple lines**

```R
ggplot(dataset, aes(x, y)) +
	geom_line(aes(group = group))
```

* **ggplot2: smooth trends**

```R
ggplot(dataset, aes(x, y)) +
	geom_line(aes(group = group)) +
	geom_smooth()
```

* **ggplot2: facetting**

```R
ggplot(dataset, aes(x, y)) +
	geom_line(aes(group = group)) +
	geom_smooth() +
	facet_wrap(vars(facet))
```

```R
# Wrap this plotting code into a function
plot_yield_vs_year <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

# Test it on the wheat dataset
plot_yield_vs_year(wheat)
```

* **dplyr inner joins**

```R
dataset1 %>%
	inner_join(dataset2, by = "column_to_join_on")
```

```R
# Inner join the corn dataset to usa_census_regions by state
corn %>%
  inner_join(usa_census_regions, by = "state")
```

```R
# Wrap this code into a function
fortify_with_census_region <- function(data) {
  data %>%
    inner_join(usa_census_regions, by = "state")
}

# Try it on the wheat dataset
fortify_with_census_region(wheat)
```

## 4.3 Modeling grain yields

* **Linear models vs. generalized additive models**

A linear model

```R
lm(
  response_var ~ explanatory_var1 + explanatory_var2,
  data = dataset
  )
```

A generalized additive model

package mgcv, stands for "mix GAM computational"
The s function means "make the effect of this variable smooth"

```
library(mgcv)
gam(
  response_var ~ s(explanatory_var1) + explanatory_var2, 
  data = dataset
 )
 ```

* **Predicting GAMs**

```R
predict_this <- data.frame(
  explanatory_var1 = c("some", "values"),
  explanatory_var2 = c("more", "values")
)

predicted_responses <- predict(model, predict_this, type = "response")

predict_this %>%
  mutate(predicted_responses = predicted_responses)
```


















