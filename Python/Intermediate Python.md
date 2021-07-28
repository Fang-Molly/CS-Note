# 1 Matplotlib

## 1.1 Basic plots with Matplotlib

* Matplotlib : visualization packages
    * pyplot : subpackage
        
> Line plot

```python
>>> import matplotlib.pyplot as plt
>>> year = [1950, 1970, 1990, 2010]
>>> pop = [2.519, 3.692, 5.263, 6.972]
>>> plt.plot(year, pop)
[<matplotlib.lines.Line2D object at 0x7f9b5f4636a0>]
>>> plt.show()  # display a plot
```

> Scatter plot
    
```python
>>> import matplotlib.pyplot as plt
>>> year =[1950, 1970, 1990, 2010]
>>> pop = [2.519, 3.692, 5.263, 6.972]
>>> plt.scatter(year, pop)
<matplotlib.collections.PathCollection object at 0x7f9b60fc0a00>
>>> plt.show()
```

```python
# put the x-axis on a logarithmic scale
plt.xscale('log')
```

## 1.2 Histogram

* Histogram

    * Explore dataset
    * Get idea about distribution

* Matplotlib 

```python
>>> import matplotlib.pyplot as plt
>>> values = [0, 0.6, 1.4, 1.6, 2.2, 2.5, 2.6, 3.2, 3.5, 3.9, 4.2, 6]
>>> plt.hist(values, bins=3)
(array([4., 6., 2.]), array([0., 2., 4., 6.]), <BarContainer object of 3 artists>)
>>> plt.show()
```

* `plt.clf()` clean it up again so you can start afresh

```python
# Build histogram with 5 bins
plt.hist(life_exp, bins=5)

# Show and clean up plot
plt.show()
plt.clf()

# Build histogram with 20 bins
plt.hist(life_exp, bins=20)

# Show and clean up again
plt.show()
plt.clf()
```

## 1.3 Customization

* Data visualization

    * Many options
        * Different plot types
        * Many customizations

    * Choice depends on
        * Data
        * Story you want to tell

*  Customization plot

```python
import matplotlib.pyplot as plt
year = [1950, 1951, 1952, ... , 2100]
pop = [2.538, 2.57, 2.62, ..., 10.85]

# add more data
year = [1800, 1850, 1900] + year
pop = [1.0, 1.262, 1.650] + pop

plt.plot(year, pop)

# Axis labels
plt.xlabel('Year')
plt.ylabel('Population')

# Title
plt.title('World Population Projections')

# Ticks
plt.yticks([0, 2, 4, 6, 8, 10],
           ['0', '2B', '4B', '6B', '8B', '10B'])

plt.show()
```























