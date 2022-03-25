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

* **Using tribble()**

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



The easiest way to do this is to first create our own data frame, or tibble, composed of the custom stop words we would like to remove. To do this, we use the tribble() function. If you get the Star Trek reference, congratulations. The arguments in tribble() are simple: the column names, with the tilde in front of them, followed by the values on each row. We can even organize the inputs to look like the data frame itself. Here we want the columns to be a character type and so we put the values in quotes. Note the column names match the column names in the stop_words data frame and they don’t need to be in quotes because they aren’t values in the data frame. Our custom stop words include Roomba, the name of the brand for the two products, which appears frequently in the reviews and isn’t very informative. The number 2 also appears often, probably an artifact of scraping the reviews from the web. Voila! We’ve created our own data frame!

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
```




4. Using bind_rows()
Let’s assign this new data frame to custom_stop_words. Now let’s combine the original stop_words and our custom_stop_words. We’ve briefly discussed joins, which are about joining columns with matching values based on a shared column. This is different because we want to bind rows together, not join columns. Here, we use a function called bind_rows(). To use it, the two data frames need to have matching columns with matching names.

5. Removing stop words again
Here we are again tokenizing and cleaning the review_data. Instead of using the standard stop_words in our anti_join(), we use stop_words2, which now includes our custom stop words. To demonstrate that this worked, let’s filter for just the rows that contain “roomba.” That’s right: we have a data frame with zero rows -- Roomba has been removed!

6. Factors
Another problem we’ve seen is that the arrange() function doesn’t affect the plots, like this plot from the last video. To address this, we’re going to need to consider column types again. We’ve talked about categorical data being stored as the character type. However, there is another type used to store both categorical data in R: a factor. While in a character column, the words can be sorted alphabetically. However, a factor column can include information about the order in which the words should appear.

7. Using fct_reorder()
After counting and filtering for the words that occur more than 300 times, we use mutate() to create a new column. Within mutate() we use the function fct_reorder() and include two arguments: the column we want to reorder and the column we want to reorder it by. Here we are saying that we want our new column word2 to be composed of words ordered by the word count n.

8. Using fct_reorder()
Sure enough, we can see that this new column is of type <fct> or factor.

9. Arranging the bar plot
Now we can use this new, reordered factor column to create a bar plot that is arranged by word count and far easier to read.
























