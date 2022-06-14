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














