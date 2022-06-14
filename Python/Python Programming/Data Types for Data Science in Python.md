Data Types for Data Science in Python
=====================================

# 1. Fundamental data types

## 1.1 Introduction and lists

* **Lists**
	* Hold data in order it was added
	* Mutate
	* Index: start from zero

```python
>>> cookies = ['chocolate chip', 'peanut butter', 'sugar']

# add element: `.append()`
>>> cookies.append('Tirggel')
>>> print(cookies)
['chocolate chip', 'peanut butter', 'sugar', 'Tirggel']

# access element by index: from zero
>>> print(cookies[2])
sugar

# Combine lists using operators
>>> cakes = ['straberry', 'vanilla']
>>> desserts = cookies + cakes
>>> print(desserts)
['chocolate chip', 'peanut butter', 'sugar', 'Tirggel', 'straberry', 'vanilla']

# Combine lists: `.extend()`
>>> cookies.extend(cakes)
>>> print(cookies)
['chocolate chip', 'peanut butter', 'Tirggel', 'straberry', 'vanilla']

# Find elements in a list: `.index()`
>>> position = cookies.index('sugar')
>>> print(position)
2
>>> cookies[2]
'sugar'

# Remove elements in a list: `.pop()`
>>> name = cookies.pop(position)
>>> print(name)
sugar
>>> print(cookies)
['chocolate chip', 'peanut butter', 'Tirggel']

# Iterate over lists: `for`
>>> for cookie in cookies:
...     print(cookie)
... 
chocolate chip
peanut butter
Tirggel

# Sort lists: `sorted`, by alphabet order
>>> sorted_cookies = sorted(cookies)
>>> print(sorted_cookies)
['Tirggel', 'chocolate chip', 'peanut butter']
```

```python
# Create the empty list: baby_names
baby_names = []

# Loop over records 
for row in records:
    # Add the name to the list
    baby_names.append(row[3])
    
# Sort the names in alphabetical order
for name in sorted(baby_names):
    # Print each name
    print(name)
```

## 1.2 Meet the Tuples

* **Tuple**
	* Hold data in order
	* Index
	* Immutable
	* Pairing
	* Unpackable

```python
# Zip tuples: `zip()`
>>> us_cookies = ['Chocolate Chip', 'Brownies', 'Peanut Butter', 'Oreos', 'Oatmeal Raisin']
>>> in_cookies = ['Punjabi', 'Fruit Cake Rusk', 'Marble Cookies', 'Kaju Pista Cookies', 'Almond Cookies']
>>> top_pairs = list(zip(us_cookies, in_cookies))
>>> print(top_pairs)
[('Chocolate Chip', 'Punjabi'), ('Brownies', 'Fruit Cake Rusk'), ('Peanut Butter', 'Marble Cookies'), ('Oreos', 'Kaju Pista Cookies'), ('Oatmeal Raisin', 'Almond Cookies')]

# Unpack tuples
>>> us_num_1, in_num_1 = top_pairs[0]
>>> print(us_num_1)
Chocolate Chip
>>> print(in_num_1)
Punjabi

# Unpack in loops
>>> for us_cookie, in_cookie in top_pairs:
...     print(in_cookie)
...     print(us_cookie)
... 
Punjabi
Chocolate Chip
Fruit Cake Rusk
Brownies
Marble Cookies
Peanut Butter
Kaju Pista Cookies
Oreos
Almond Cookies
Oatmeal Raisin

# Enumerate positions: `enumerate()`
>>> for idx, item in enumerate(top_pairs):
...     us_cookie, in_cookie = item
...     print(idx, us_cookie, in_cookie)
... 
0 Chocolate Chip Punjabi
1 Brownies Fruit Cake Rusk
2 Peanut Butter Marble Cookies
3 Oreos Kaju Pista Cookies
4 Oatmeal Raisin Almond Cookies

# Use `()` to make tuples
>>> item = ('vanilla', 'chocolate')
>>> print(item)
('vanilla', 'chocolate')

# Beware of tailing commas
>>> item2 = 'butter',
>>> print(item2)
('butter',)
```

## 1.3 Sets for unordered and unique data

* **Set**
	* Unique
	* Unordered
	* Mutable
	* Python's implementation of Set Theory from Mathematics

```python
# Create sets
>>> cookies_eaten_today = ['Chocolate Chip', 'Peanut Butter', 'Chocolate Chip', 'Oatmeal Cream', 'Chocolate Chip']
>>> types_of_cookies_eaten = set(cookies_eaten_today)
>>> print(types_of_cookies_eaten)
{'Peanut Butter', 'Chocolate Chip', 'Oatmeal Cream'}

# Add data to sets: `.add()`
>>> types_of_cookies_eaten.add('biscotti')
>>> types_of_cookies_eaten.add('chocolate chip')
>>> print(types_of_cookies_eaten)
{'Oatmeal Cream', 'biscotti', 'Chocolate Chip', 'chocolate chip', 'Peanut Butter'}

# Add data to sets: `.update()`
>>> cookies_hugo_ate = ['chocolate chip', 'anzac']
>>> types_of_cookies_eaten.update(cookies_hugo_ate)
>>> print(types_of_cookies_eaten)
{'Oatmeal Cream', 'anzac', 'biscotti', 'Chocolate Chip', 'chocolate chip', 'Peanut Butter'}

# Remove data from sets: `.discard()`
>>> types_of_cookies_eaten.discard('biscotti')
>>> print(types_of_cookies_eaten)
{'Oatmeal Cream', 'anzac', 'Chocolate Chip', 'chocolate chip', 'Peanut Butter'}

# Remove data from sets: `.pop()`
>>> types_of_cookies_eaten.pop()
'Oatmeal Cream'
>>> types_of_cookies_eaten.pop()
'anzac'

# Set operations - Similarities
# `.union()`: set method returns a set of all the names (`or`)
# `.intersection()`: method identifies overlapping data (`and`)
>>> cookies_jason_ate = set(['chocolate chip', 'oatmeal cream', 'peanut butter'])
>>> cookies_hugo_ate = set(['chocolate chip', 'anzac'])
>>> cookies_jason_ate.union(cookies_hugo_ate)
{'oatmeal cream', 'anzac', 'chocolate chip', 'peanut butter'}
>>> cookies_jason_ate.intersection(cookies_hugo_ate)
{'chocolate chip'}

# Set operations - Differences
# `.difference()`: method identifies data present in the set on which the method was used that is not in the arguments (`-`)
>>> cookies_jason_ate.difference(cookies_hugo_ate)
{'oatmeal cream', 'peanut butter'}
>>> cookies_hugo_ate.difference(cookies_jason_ate)
{'anzac'}
```

# 2. Dictionaries - the root of Python

## 2.1 Using dictionaries

* **Creating and looping through dictionaries**

	* Hold data in key/value pairs
	* Nestable (use a dictionary as the value of a key within a dictionary)
	* Iterable
	* Created by dict() or {}

```python
art_galleries = {}

for name, zip_code in galleries:
	art_galleries[name] = zip_code
	
for name in art_galleries:
	print(name)
```

```python
# Create an empty dictionary: names_by_rank
names_by_rank = {}

# Loop over the girl names
for rank, name in female_baby_names_2012.items():
    # Add each name to the names_by_rank dictionary using rank as the key
    names_by_rank[rank] = name
    
# Sort the names_by_rank dict by rank in descending order and slice the first 10 items
for rank in sorted(names_by_rank, reverse=True)[:10]:
    # Print each item
    print(names_by_rank[rank])
```

* **Safely finding by key**

	* Getting a value from a dictionary is done using the key as an index
	* If you ask for a key that does not exist that will stop your program from running in a KeyError
	* `.get()` method allows you to safely access a key without error or expection handling
	* If a key in not in the dictionary, `.get()` returns `None` by default or you can supply a value to return 'Not Found'

```python
art_galleries.get('Louvre', 'Not Found')
'Not Found'

art_galleries.get('Zarre Andre Gallery')
'10011'
```

* **Working with nested dictionaries**

	* The `.keys()` method shows the keys for a given dictionary

```python
art_galleries.keys()

print(art_galleries['10027'].keys())
```

* **Accessing nested data**
	* Common way to deal with repeating data structures
	* Can be accessed using multiple indices or the `.get()` method

```python
art_galleries['10027']['Inner City Art Gallery Inc']
```

## 2.2 Altering dictionaries

* **Adding and extending dictionaries**

```python
# Assignment to add a new key/value to a dictionary
>>> print(galleries_10007)
{'Nyabinghi Africian Gift Shop': '(212) 566-3336'}
>>> art_galleries['10007'] = galleries_10007

# `.update()` method to update a dictionary from another dictionary, tuples or keywords
>>> galleries_11234 = [
	(A J ARTS LTD', '(718) 763-5473'), 
	('Doug Meyer Fine Art', '(718) 375-8006'), 
	('Portrait Gallery', '(718) 377-8762')]
>>> art_galleries['11234'].update(galleries_11234)
```

```python
# Assign the names_2011 dictionary as the value to the 2011 key of boy_names
boy_names[2011] = names_2011

# Update the 2012 key in the boy_names dictionary
boy_names[2012].update([(1, 'Casey'), (2, 'Aiden')])

# Loop over the years in the boy_names dictionary 
for year in boy_names:
    # Sort the data for each year by descending rank and get the lowest one
    lowest_ranked = sorted(boy_names[year], reverse=True)[0]
    # Safely print the year and the least popular name or 'Not Available'
    print(year,boy_names[year].get(lowest_ranked, 'Not Available'))
```

* **Popping and deleting from dictionaries**

```python
# `del` instruction deletes a key/value
del art_galleries['11234']

# `.pop()` method safely removes a key/value from a dictionary
galleries_10310 = art_galleries.pop('10310')
```

```python
# Remove 2011 from female_names and store it: female_names_2011
female_names_2011 = female_names.pop(2011)

# Safely remove 2015 from female_names with an empty dictionary as the default: female_names_2015
female_names_2015 = female_names.pop(2015, {})

# Delete 2012 from female_names
del female_names[2012]

# Print female_names
print(female_names)
```

## 2.3 Pythonically using dictionaries

* **Working with dictionaries more pythonically**

	* `.items()` method returns an object we can iterate over

```python
for gallery, phone_num in art_galleries.items():
	print(gallery)
	print(phone_num)
	
# Iterate over the 2014 nested dictionary
for rank, name in baby_names[2014].items():
    # Print rank and name
    print(rank, name)
```

* **Checking dictionaries for data**

```python
# `.get()` does a lot of work to check for a key

# `in` operator is much more efficient and clearer
'11234' in art_galleries
False

if '10010' in art_galleries:
	print('I found: %s' % art_galleries['10010'])
else:
	print('No galleries found.')
```

## 2.4 Working with CSV files

* **CSV file**: Comma separated value files

* **Reading from a file using CSV reader**

	* Python `csv` module
	* `open()` function provides a variable that represents a file, takes a path and a mode
	* `csv.reader()` reads a file object and returns the lines from the file as tuples
	* `.close` method closes file objects

```python
import csv
csvfile = open('ART_GALLERY.csv', 'r')
for row in csv.reader(csvfile):
	print(row)
csvfile.close()
```

```python
# Import the python CSV module
import csv

# Create a python file object in read mode for the baby_names.csv file: csvfile
csvfile = open('baby_names.csv', 'r')

# Loop over a csv reader on the file object
for row in csv.reader(csvfile):
    # Print each row 
    print(row)
    # Add the rank and name to the dictionary
    baby_names[row[5]] = row[3]

# Print the dictionary keys
print(baby_names.keys())
```

* **Creating a dictionary from a file

	* Often we want to go from CSV file to dictionary
	* `csv.DictReader` does just that
	* If data doesn't have a header row, you can pass in the column names

```python
for row in csv.DictReader(csvfile):
	print(row)
```

```python
# Import the python CSV module
import csv

# Create a python file object in read mode for the `baby_names.csv` file: csvfile
csvfile = open('baby_names.csv', 'r')

# Loop over a DictReader on the file
for row in csv.DictReader(csvfile):
    # Print each row 
    print(row)
    # Add the rank and name to the dictionary: baby_names
    baby_names[row['RANK']] = row['NAME']

# Print the dictionary keys
print(baby_names.keys())
```

# 3. Meet the collections module

## 3.1 Counting made easy

* **Collections Module**

	* Part of Standard Library
	* Advanced data containers

* **Counter**

	* Special dictionary used for counting data, measuring frequency

```python
from collections import Counter
nyc_eatery_count_by_types = Counter(nyc_eatery_types)
print(nyc_eatery_count_by_type)

print(nyc_eatery_count_by_types['Restaurant'])
```

* **Counter to find the most common**

	* `.most_common()` method returns the counter values in descending order

```python
print(nyc_eatery_count_by_types.most_common(3))
```

## 3.2 Dictionaries of unknown structure - Defaultdict

* **Dictionary Handling**

```python
for park_id, name in nyc_eateries_parks:
	if park_id not in eateries_by_park:
		eateries_by_park[park_id] = []
	eateries_by_park[park_id].append(name)
print(eateries_by_park['M010'])
```

* **Using defaultdict**

	* Pass it a default type that every key will have even if it doesn't currently exist
	* Works exactly like a dictionary

```python
from collections import defaultdict
eateries_by_park = defaultdict(list)
for park_id, name in nyc_eateries_parks:
	eateries_by_park[park_id].append(name)
print(eateries_by_park['MO10']
```

```python
from collections import defaultdict
eatery_contact_types = defaultdict(int)
for eatery in nyc_eateries:
	if eatery.get('phones'):
		eatery_contact_types['phones'] += 1
	if eatery.get('website'):
		eatery_contact_types['websites'] += 1
print(eatery_contact_types)
```
	
## 3.3 Maintaining Dictionary Order with OrderedDict

* **Order in Python dictionaries**

	* Python version < 3.6 NOT ordered
	* Python version > 3.6 ordered

* **Getting started with OrderedDict**

```python
from collections import OrderedDict
nyc_eatery_permits = OrderedDict()
for eatery in nyc_eateries:
	nyc_eatery_permits[eatery['end_date']] = eatery
print(list(nyc_eatery_permits.items())[:3]
```

* **OrderedDict power feature**

```python
# Print the first key in ridership_date
print(list(ridership_date.keys())[0])

# Pop the first item from ridership_date and print it
# `.popitem()` method returns items in reverse insertion order
# Use the `last=False` keyword argument to return the items in insertion order
print(ridership_date.popitem(last=False))

# Print the last key in ridership_date
print(list(ridership_date.keys())[-1])

# Pop the last item from ridership_date and print it
print(ridership_date.popitem())
```

## 3.4 What do you mean I don't have any class? Namedtuple

* **What is a namedtuple?**

	* A tuple where each position (column) has a name
	* Ensure each one has the same properties
	* Alternative to a `pandas` DataFrame row

* **Creating a namedtuple**

```python
from collections import namedtuple
Eatery = namedtuple('Eatery', ['name', 'location', 'park_id', 'type_name'])
eateries = []
for eatery in nyc_eateries:
	details = Eatery(eatery['name'],
					 eatery['location'],
					 eatery['park_id'],
					 eatery['type_name'])
	eateries.append(details)
print(eateries[0])
```

* **Leveraging namedtuples**
	* Each field is available as an attribute of the namedtuple

```python
for eatery in eateries[:3]:
	print(eatery.name)
	print(eatery.park_id)
	print(eatery.location)
```

# 4. Handling Dates and Times

## 4.1 There and Back Again a DateTime Journey

* **From string to datetime**

	* The `datetime` module is part of the Python standard library
	* Use the `datetime` type from inside the `datetime` module
	* `.strptime()` method converts from a string to a `datetime` object

```python
from datetime import datetime
print(parking_violations_date)
```

* **Parsing strings into datetimes**

```python
date_dt = datetime.strptime(parking_violations_date, '%m/%d/%Y')
print(date_dt)
```

* **Time Format Strings**

	* `%d`: Day of the month as a zero-padded decimal number
		* 01, 02, ..., 31
	* `%m`: Month as a zero-padded decimal number
		* 01, 02, ..., 12
	* `%Y`: Year with century as a decimal number
		* 0001, 0002, ..., 2013, 2014, ..., 9998, 9999

* **Datetime to String**

	* `.strftime()` method uses a format string to convert a datetime object to a string
	
	```python
	date_dt.strftime('%m/%d/%Y')
	'06/11/2016'
	```
	
	* `isoformat()` method outputs a datetime as an ISO standard string

	```python
	date_dt.isoformat()
	'2016-06-11T00:00:00'
	```
	
## 4.2 Working with Datetime Components and current time

* **Datetime Components**

	* `day`, `month`, `year`, `hour`, `minute`, `second`, and more are available from a datetime instance
	* Great for grouping data

```python
daily_violations = defaultdict(int)
for violation in parking_violations:
	violation_date = datetime.strptime(violation[4], '%m/%d/%Y')
	daily_violations[violation_date.day] += 1
```

* **What is the deal with now and utcnow**

	* `.now()` method returns the current local datetime
	* `.utcnow()` method returns the current UTC datetime

```python
>>> from datetime import datetime

>>> local_dt = datetime.now()
>>> print(local_dt)
2022-06-14 15:41:47.663393

>>> utc_dt = datetime.utcnow()
>>> print(utc_dt)
2022-06-14 19:42:41.911984
```

* **Timezones**

	* Naive datetime objects have no timezone data
	* Aware datetime objects have a timezone
	* Timezone data is available via the `pytz` module via the `timezone` object
	* Aware objects have `.astimezone()` so you can get the time in another timezone

```python
from pytz import timezone
record_dt = datetime.strptime('07/12/2016 04:39PM', '%m/%d/%Y %H:%M%p')
ny_tz = timezone('US/Eastern')
a_tz = timezone('US/Pacific')
ny_dt = record_dt.replace(tzinfo=ny_tz)
la_dt = ny_dt.astimezone(la_tz)
```

## 4.3 Time Travel (Adding and Subtracting Time)

* **Incrementing through time**

	* `timedelta` is used to represent an amount of change in time
	* Used to add or subtract a set amount of time from a datetime object

```python
from datetime import timedelta
flashback = timedelta(days=90)
print(record_dt)
print(record_dt - flashback)
print(record_dt + flashback)
```

* **Datetime differences**

```python
# use the `-` operator to calculate the difference
time_diff = record_dt - record2_dt
type(time_diff)
datetime.timedelta
```

## 4.4 HELP! Libraries to make it easier

* 













# 5. Answering Data Science Questions

## 5.1 Counting within Date Ranges





## 5.2 Dictionaries with Time Windows for Keys





