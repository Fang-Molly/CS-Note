Introduction to Writing Functions in R
======================================

# 1. How to write a function

## 1.1 Why you should use functions

* **The arguments to mean()**

Mean has 3 arguments

	* `x`: A numeric or date-time vector
	
	* `trim`: The proportion of highest and lowest values to remove before calculating
	
	* `na.rm`: A logical value determining whether missing values should be removed
	
```
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

```
my_function <- function(arg1, arg2) {
	# Do something
}
```

	* The signature
	
	```
	function(arg1, arg2)
	```
	
	* The body
	
	```			
	{
		# Do something
	}
	```

* Make a template

```
import_test_scores <- function() {

}
```

* Paste your script into the body

```
import_test_scores <- function() {
	test_scores_geography_raw <- read_csv("test_scores_geography.csv")
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Choose the arguments

```
import_test_scores <- function(filename) {   # <- only 1 argument
	test_scores_geography_raw <- read_csv("test_scores_geography.csv")
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Replace specific values with arguments

```
import_test_scores <- function(filename) {  
	test_scores_geography_raw <- read_csv(filename)  # <- replace specific filename
	
	test_scores_geography_clean <- test_scores_geography_raw %>%
		select(person_id, first_name, last_name, test_date, score) %>%
		mutate(test_date = mdy(test_date)) %>%
		filter(!is.na(score))
}
```

* Generalize variable names

```
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












