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

* **GET requests using urllib**

```python
# Import packages
from urllib.request import urlopen, Request

# Specify the url
url = "http://www.wikipedia.org/"

# This packages the request
request = Request(url)

# Sends the request and catches the response: response
response = urlopen(request)

# Extract the response: html
html = response.read()

# Print the html
print(html)

# Be polite and close the response!
response.close()
```

* **GET requests using requests**

```python
# Import package
import requests

# Specify the url: url
url = "http://www.wikipedia.org/"

# Packages the request, send the request and catch the response: r
r = requests.get(url)

# Extract the response: text
text = r.text

# Print the html
print(text)
```

## 1.3 Scraping the web in Python

* **BeautifulSoup**

	* Parse and extract structured data from HTML
	* Make tag soup beautiful and extract information

```python
# Import packages
from bs4 import BeautifulSoup
import requests

# Specify url: url
url = 'https://www.crummy.com/software/BeautifulSoup/'

# Package the request, send the request and catch the response: r
r = requests.get(url)

# Extracts the response as html: html_doc
html_doc = r.text

# Create a BeautifulSoup object from the HTML: soup
soup = BeautifulSoup(html_doc)

# Prettify the BeautifulSoup object: pretty_soup
print(soup.prettify())

# Get the title
print(soup.title)

# Get the text
print(soup.get_text())

# `find_all()`
# find all 'a' tags (which define hyperlinks
a_tags = soup.find_all('a')

# print the URLs to the shell
for link in a_tags:
	print(link.get('href'))
```

# 2. Interacting with APIs to import data from the web

## 2.1 Introduction to APIs and JSONs

* **APIs**

	* Application Programming Interface
	* Protocols and routines
		* Building and interacing with software applications

* **JSONs**

	* JavaScript Object Notation
	* Real-time server-to-browser communication
	* Douglas Crockford
	* Human readable

* **Loading JSONs in Python**

```python
import json
with open('snakes.json', 'r') as json_file:
	json_data = json.load(json_file)
	
type(json_data)
dict

for key, value in json_data.items():
	print(key + ':', value)
```

## 2.2 APIs and interacting with the world wide web

* **What is an API?**

	* Set of protocols and routines

	* Bunch of code

		* Allows two software programs to communicate with each other

* **Connecting to an API in Python**

```python
# Import requests package
import requests

# Assign URL to variable: url
url = 'http://www.omdbapi.com/?t=hackers'

# Package the request, send the request and catch the response: r
r = requests.get(url)
json_data = r.json()
for key, value in json_data.items():
	print(key + ':', value)
```

* **What was that URL?**

	* http - making an HTTP request
	* www.omdbapi.com - querying the OMDB API
	* `?t=hackers`
		* Query string
		* Return data for a movie with title (t) 'Hackers'
		* `http://www.omdbapi.com/?t=hackers`


# 3. Diving deep into the Twitter API

## 3.1 The Twitter API and Authentication

* **tweets.py**

```python
import tweepy, json
access_token = "..."
access_token_secret = "..."
consumer_key = "..."
consumer_secret = "..."

# Create streaming object
stream = tweepy.Stream(consumer_key, consumer_secret, access_token, access_token_secret)

# This line filters Twitter Streams to capture data by keywords:
stream.filter(track=['apples', 'oranges'])
```










