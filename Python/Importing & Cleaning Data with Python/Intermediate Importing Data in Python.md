Intermediate Importing Data in Python
=====================================

# 1. Importing data from the Internet

## 1.1 Importing flat files from the web

* **The urllib package**

	* Provides interface for fetching data across the web
	* `urlopen()` - accepts URLs instead of file names

* **How to automate file download in Python**

```python
# Import package
from urllib.request import urlretrieve

# Import pandas
import pandas as pd

# Assign url of file: url
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv'

# Save file locally
urlretrieve(url, 'winequality-white.csv')

('winequality-white.csv', <http.client.HTTPMessage object at 0x7fd5e8335f40>)

# Read file into a DataFrame and print its head
df = pd.read_csv('winequality-white.csv', sep=';')
print(df.head())
```

## 1.2 HTTP requests to import files from the web






## 1.3 Scraping the web in Python







# 2. Interacting with APIs to import data from the web

## 2.1 Introduction to APIs and JSONs







## 2.2 APIs and interacting with the world wide web








# 3. Diving deep into the Twitter API

## 3.1 The Twitter API and Authentication











