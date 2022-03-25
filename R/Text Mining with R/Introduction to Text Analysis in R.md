Introduction to Text Analysis in R
===================================

# 1. Wrangling Text

## 1.1 Text as data

* **Using the tidyverse**

dplyr and ggplot2 are part of the tidyverse, a collection of packages that follow the same principles and are designed to work well together.

* **Loading packages**

```R
> library(tidyverse)
── Attaching packages ───────────────────────────────────────── tidyverse 1.3.1 ──
✓ tibble  3.1.6     ✓ stringr 1.4.0
✓ readr   2.1.2     ✓ forcats 0.5.1
✓ purrr   0.3.4     
── Conflicts ──────────────────────────────────────────── tidyverse_conflicts() ──
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()
```

* **Importing review data**

```R
review_data <- read_csv("Roomba Reviews.csv")
```

* **Using filter() and summarize()**

```R
review_data %>%
  filter(product == "iRobot Roomba 650 for Pets") %>%
  summarize(stars_mean = mean(stars))
```

* **Using group_by() and summarize()**

```R
review_data %>%
  group_by(product) %>%
  summarize(stars_mean = mean(stars))
```

* **Unstructured data**

```R
review_data %>%
  group_by(product) %>%
  summarize(stars_mean = mean(review))
	
Warning message:
1: In mean.default(review):
	argument is not numeric or logical: returning NA
2: In mean.default(review):
	argument is not numeric or logical: returning NA
```

## 1.2 Counting categorical data

* **Column types**

* **Summarizing with n()**

	* `n()` computes the number of rows in the current group
	* We didn’t need any argument for `n()`

```R
review_data %>%
  summarize(number_rows = n())

# combine with `group_by()`
review_data %>%
  group_by(product) %>%
  summarize(number_rows = n())
```

* **Summarizing with count()**

	* instead of grouped summary using `n()`
	* the column with the actual counts is named n by default

```R
review_data %>%
  count(product)

# combine with `arrange()`
review_data %>%
  count(product) %>%
  arrange(desc(n))
```

## 1.3 Tokenizing and cleaning

* **Tokenizing text**

	* Some natural language processing (NLP) vocabulary:

		* Bag of words : words in a document are independent
		* Every separate body of text is a document
		* Every unique word is a term
		* Every occurrence of a term is a token
		* Creating a bag of words is called tokenizing

* **Using `unnest_tokens()`**

	* Cleaning: punctuation is gone, each word is lowercase, and white space has been removed.


```R
tidy_review <- review_data %>%
  unnest_tokens(word, review)
```

* **Counting words**

```R
tidy_review %>%
  count(word) %>%
  arrange(desc(n))
```

* **Using anti_join()**

```R
tidy_review2 <- review_data %>%
  unnest_tokens(word, review) %>%
	# Remove stop words
  anti_join(stop_words)
```

```R
tidy_review2 %>%
  count(word) %>%
  arrange(desc(n))
```

# 2. Visualizing Text

## 2.1 Plotting word counts

* **Starting with tidy text**

```R
tidy_review <- review_data %>%
  mutate(id = row_number()) %>%
  unnest_tokens(word, review) %>%
  anti_join(stop_words)
```

* **Visualizing counts with geom_col()**

```R
word_counts <- tidy_review %>%
  count(word) %>%
  arrange(desc(n))
	
ggplot(word_counts, aes(x = word, y = n)) +
  geom_col()
```

* **filter() before visualizing**

```R
word_counts2 <- tidy_review %>%
  count(word) %>%
  filter(n > 300) %>%
  arrange(desc(n))
	
ggplot(word_counts2, aes(x = word, y = n)) +
  geom_col() +
	# using coord_flip() to flip the coordinates of our plot
  coord_flip() +
  ggtitle("Review Word Counts")
```

## 2.2 Improving word count plots

* **Custom stop words**

```R
> install.packages("tidytext")
> library(tidytext)
> stop_words
# A tibble: 1,149 × 2
   word        lexicon
   <chr>       <chr>  
 1 a           SMART  
 2 a's         SMART  
 3 able        SMART  
 4 about       SMART  
 5 above       SMART  
 6 according   SMART  
 7 accordingly SMART  
 8 across      SMART  
 9 actually    SMART  
10 after       SMART  
# … with 1,139 more rows
```

* **Using `tribble()` function**

```R
tribble(
  ~word,     ~lexicon,
  "roomba",  "CUSTOM",
  "2",       "CUSTOM"
)

# A tibble: 2 × 2
  word   lexicon
  <chr>  <chr>  
1 roomba CUSTOM 
2 2      CUSTOM 
```

* **Using bind_rows()**

```R
custom_stop_words <- tribble(
  ~word,     ~lexicon,
  "roomba",  "CUSTOM",
  "2",       "CUSTOM"
)

stop_words2 <- stop_words %>%
  bind_rows(custom_stop_words)

stop_words2

# A tibble: 1,151 × 2
   word        lexicon
   <chr>       <chr>  
 1 a           SMART  
 2 a's         SMART  
 3 able        SMART  
 4 about       SMART  
 5 above       SMART  
 6 according   SMART  
 7 accordingly SMART  
 8 across      SMART  
 9 actually    SMART  
10 after       SMART  
# … with 1,141 more rows

tidy_review <- review_data %>%
	mutate(id = row_number()) %>%
	select(id, date, product, stars, review) %>%
  unnest_tokens(word, review) %>%
  anti_join(stop_words2)
tidy_review %>%
	filter(word == "roomba")
```

* **Factors**
	* Usint `fct_reorder()`

```
word_counts <- tidy_review %>%
  count(word) %>%
  filter(n > 300) %>%
  mutate(word2 = fct_reorder(word, n))

ggplot(word_counts, aes(x = word2, y =n)) +
  geom_col() +
  coord_flip() +
  ggtitle("Review Word Counts")
```

## 2.3 Faceting word count plots - compare two or more subsets of the data in the same plot



```R
word_counts <- tidy_review %>%
  # counting by product
  count(word, product) %>%
  group_by(product) %>%
  # using `top_n()`
  top_n(10, n)
  # using `ungroup()`
  ungroup()
  # using `fct_reorder()`
  mutate(word2 = fct_reorder(word, n))

ggplot(word_counts, aes(x = word2, y = n, fill = product)) +
  geom_col(show.legend = FALSE) +
	# using `facet_wrap()`
  facet_wrap(~ product, scales = "free_y") +
  coord_flip() +
  ggtitle("Review Word Counts")
```















