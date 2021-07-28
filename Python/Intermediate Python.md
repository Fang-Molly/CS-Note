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
>>> plt.show()
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






























