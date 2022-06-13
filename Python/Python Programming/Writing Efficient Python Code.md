Writing Efficient Python Code
==============================

# 1. Foundations for efficiencies

## 1.1 Welcome!

* **Defining efficient**

  * Writing efficient Python code
    * Minimal completion time (fast runtime)
    * Minimal resource consumption (small memory footprint)

* **Defining Pythonic**

  * Writing efficient Python code
    * Focus on readability
    * Using Python's constructs as intended (i.e., Pythonic)

```python
# Non-Pythonic
doubled_numbers = []

for i in range(len(numbers)):
  doubled_numbers.append(numbers[i] * 2)
  
# Pythonic
doubled_numbers = [x * 2 for x in numbers]
```

* **The Zen of Python by Tim Peters**

```python
>>> import this
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
```























