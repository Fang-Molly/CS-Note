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

## 2.4 Plotting word clouds

* **Using `wordcloud()`**

```R
install.packages("wordcloud")
library(wordcloud)
word_counts <- tidy_review %>%
  count(word)
wordcloud(
  words = word_counts$word,
  freq = word_counts$n,
  max.words = 30
)
```





1. Plotting word clouds
A bar plot is probably the most effective way to visualize word counts. Sometimes you may need something a bit more evocative. Plus, if you’re doing text analysis, everyone probably assumes you know how to create word clouds.

2. Using wordcloud()
The first thing we’ll need to do is load the wordcloud package. We do this by calling library(wordcloud). Note that the wordcloud package is not part of the tidyverse, nor does it adhere to the principle of tidy data. Fortunately, it’s inputs are simple enough. First, compute the word counts using our already-tokenized and cleaned tidy_review data. Remember that the output consists of a data frame with two columns: word and n. In the wordcloud function, the first argument is words. Because this function doesn’t adhere to tidy data, we have to use some syntax from base R: the dollar sign. Here we reference the data frame, dollar sign, and the column name for the words. That tells the words argument which column in our data has the words in it. The second argument is freq for frequency, or the word counts. We follow the same syntax and reference the data frame, dollar sign, and the column name for the word counts. We control how many words are plotted with the max.words argument. And with that, we have a word cloud!

3. Fixed size and random start points
If we call that same code again we can see that the size of each of the words stays the same while the location of words in the cloud changes. This is because the size of each the words in the cloud is based on the relative word count, which is fixed. Meanwhile, where each word is located in the cloud is randomized each time the function is called.

4. Number of words in the cloud
If we call that same code again with a higher max.words, we can see that we quickly run into problems while plotting, with some of the words cut off. What you set for the max.words depends on your specific application.

5. Using colors
We can also add a bit of color to the word cloud with another argument: colors. Here we can specify a color we’d like to use for the word cloud.

6. Let's practice!
We’ll build on this with some more advanced visualization topics as we move into sentiment analysis and topic modeling. For now, let’s practice making some word clouds!















