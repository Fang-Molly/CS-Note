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

* **Fixed size and random start points**

	* Each time the function is called the location of each of the words changes
	* The size of each of the words stays the same because the size in the cloud is based on the relative word count.

* **Number of words in the cloud**
	* What you set for the max.words depends on your specific application.

```R
# set a higher max.words, some words cut off
wordcloud(
  words = word_counts$word,
  freq = word_counts$n,
  max.words = 70
)
```

* **Using colors**

```R
wordcloud(
  words = word_counts$word,
  freq = word_counts$n,
  max.words = 30,
  colors = "blue"
)
```

# 3. Sentiment Analysis

## 3.1 Sentiment dictionaries

* **Bing dictionary**

```R
> library(tidytext)
> get_sentiments("bing")
# A tibble: 6,786 × 2
   word        sentiment
   <chr>       <chr>    
 1 2-faces     negative 
 2 abnormal    negative 
 3 abolish     negative 
 4 abominable  negative 
 5 abominably  negative 
 6 abominate   negative 
 7 abomination negative 
 8 abort       negative 
 9 aborted     negative 
10 aborts      negative 
# … with 6,776 more rows

> get_sentiments("bing") %>%
+   count(sentiment)
# A tibble: 2 × 2
  sentiment     n
  <chr>     <int>
1 negative   4781
2 positive   2005
```

* **Afinn dictionary**

```R
> library(textdata)
> get_sentiments("afinn")
# A tibble: 2,477 × 2                                                     
   word       value
    0s<chr>      <dbl>
 1 abandon       -2
 2 abandoned     -2
 3 abandons      -2
 4 abducted      -2
 5 abduction     -2
 6 abductions    -2
 7 abhor         -3
 8 abhorred      -3
 9 abhorrent     -3
10 abhors        -3
# … with 2,467 more rows

> get_sentiments("afinn") %>%
+   summarize(
+     min = min(value),
+     max = max(value)
+   )
# A tibble: 1 × 2
    min   max
  <dbl> <dbl>
1    -5     5
```

* **Loughran dictionary**

```R
> get_sentiments("loughran")
# A tibble: 4,150 × 2                                                                                          :  0s
   word         sentiment
   <chr>        <chr>    
 1 abandon      negative 
 2 abandoned    negative 
 3 abandoning   negative 
 4 abandonment  negative 
 5 abandonments negative 
 6 abandons     negative 
 7 abdicated    negative 
 8 abdicates    negative 
 9 abdicating   negative 
10 abdication   negative 
# … with 4,140 more rows

sentiment_counts <- get_sentiments("loughran") %>%
  count(sentiment) %>%
  mutate(sentiment2 = fct_reorder(sentiment, n))

ggplot(sentiment_counts, aes(x = sentiment2, y = n)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Sentiment Counts in Loughran",
    x = "Counts",
    y = "Sentiment"
  )
```

## 3.2 Appending dictionaries

* **Using inner_join()**

```R
tidy_review %>%
	inner_join(get_sentiments("loughran"))
```

* **Counting sentiment**

```R
sentiment_review <- tidy_review %>%
  inner_join(get_sentiments("loughran"))
	
sentiment_review %>%
  count(sentiment)
	
sentiment_review %>%
  count(word, sentiment) %>%
  arrange(desc(n))
```

* **Visualizing sentiment**

```R
sentiment_review2 <- sentiment_review %>%
  filter(sentiment %in% c("positive", "negative"))
word_counts <- sentiment_review2 %>%
  count(word, sentiment) %>%
  group_by(sentiment) %>%
  top_n(10, n) %>%
  ungroup() %>%
  mutate(word2 = fct_reorder(word, n))
	
ggplot(word_counts, aes(x = word2, y = n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ sentiment, scales = "free") +
  coord_flip() +
  labs(
    title = "Sentiment Word Counts",
    x = "Words"
  )
```

## 3.3 Improving sentiment analysis

* **Count sentiment by rating**

```R
tidy_review %>%
  inner_join(get_sentiments("bing")) %>%
  count(stars, sentiment)
```

* **Using spread()**

```R
tidy_review %>%
  inner_join(get_sentiments("bing")) %>%
  count(stars, sentiment) %>%
  spread(sentiment, n)
```

* **Computing overall sentiment**

```R
tidy_review %>%
  inner_join(get_sentiments("bing")) %>%
  count(stars, sentiment) %>%
  spread(sentiment, n) %>%
  mutate(overall_sentiment = positive - negative)
```

* **Visualize sentiment by rating**

```R
tidy_review %>%
  inner_join(get_sentiments("bing")) %>%
  count(stars, sentiment) %>%
  spread(sentiment, n) %>%
  mutate(
    overall_sentiment = positive - negative,
    stars = fct_reorder(stars, overall_sentiment)
  )
	
ggplot(
  sentiment_stars,
  aes(x = stars, y = overall_sentiment, fill = as.factor((stars))) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  labs(
    title = "Overall Sentiment by Stars",
    subtitle = "Reviews for Robotic Vacuums",
    x = "Stars",
    y = "Overall Sentiment"
  )
)
```

# 4. Topic Modeling

## 4.1 Latent Dirichlet allocation

* **Unsupervised learning**

	* Some more natural language processing (NLP) vocabulary:
		* Latent Dirichlet allocation (LDA) is a standard topic model
		* A collection of documents is known as a corpus
		* Bag-of-words is treating every word in a document separately
		* Topic models find patterns of words appearing together
		* Searching for patterns rather than predicting is known as unsupervised learning

* **Clustering vs. topic modeling**

	* Clustering
		* Clusters are uncovered based on distance, which is continuous
		* Every object is assigned to a single cluster

	* Topic Modeling
		* Topics are uncovered based on word frequency, which is discrete
		* Every document is a mixture (i.e., partial member) of every topic.

## 4.2 Document term matrices
	
* **Documents term matrices (DTM)**

When you have a matrix that is composed mostly of zeros, this is referred to as sparsity or a sparse matrix.   

* **Using cast_dtm()**

```R
tidy_review %>%
  count(word, id) %>%
  cast_dtm(id, word, n)
```
	
* **Using as.matirx()**

```R
dtm_review <- tidy_review %>%
	count(word, id) %>%
	cast_dtm(id, word, n) %>%
	as.matrix()
dtm_review[1:4, 2000:2004]
```

## 4.3 Running topic models

* **Using LDA()**

```R
install.packages("topicmodels")
library(topicmodels)

lda_out <- LDA(
  dtm_review,
  k = 2,
  method = "Gibbs",
  control = list(seed = 42)
)
```

* **Using glimpse()**

```R
glimpse(lda_out)
```

* **Using tidy()**

```R
lda_topics <- lda_out %>%
  tidy(matrix = "beta")
lda_topics %>%
  arrange(desc(beta))
```

## 4.4 Interpreting topics

* **Two topics**

```R
lda_topics <- LDA(
  dtm_review,
  k = 2,
  method = "Gibbs",
  control = list(seed = 42)
) %>%
  tidy(matrix = "beta")

word_probs <- lda_topics %>%
  group_by(topic) %>%
  top_n(15, beta) %>%
  ungroup() %>%
  mutate(term2 = fct_reorder(term, beta))
	
ggplot(
  word_probs,
  aes(term2, beta, fill = as.factor(topic))
) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()
```

* **Three topics**

```R
lda_topics2 <- LDA(
  dtm_review,
  k = 3,
  method = "Gibbs",
  control = list(seed = 42)
) %>%
  tidy(matrix = "beta")

word_probs2 <- lda_topics2 %>%
  group_by(topic) %>%
  top_n(15, beta) %>%
  ungroup() %>%
  mutate(term2 = fct_reorder(term, beta))

ggplot(
  word_probs2,
  aes(term2, beta, fill = as.factor(topic))
) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip()
```

* **The art of model selection**

	* Adding topics that are different is good
	* If we start repeating topics, we've gone too far
	* Name the topics based on the combination of high-probability words






























