Introduction to Data Visualization with Matplotlib
==================================================

# 1. Introduction to Matplotlib

## 1.1 Introduction to data visualization with Matplotlib

```python
# introduce the pyplot interface
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
plt.show()

# add data to axes
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"])
plt.show()

# add more data
fig, ax = plt.subplots()
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"])
ax.plot(austin_weather["MONTH"], austin_weather["MLY-TAVG-NORMAL"])
plt.show()
```

## 1.2 Customizing your plots

* **Adding markers**

```python
# circle marker: lower-case letter "o"
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], 
		marker="o")

# triangles pointing downwards marker: lower-case letter "v"
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], 
		marker="v")
```

* **Setting the linestyle**

```python
# dashed line
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], 
		marker="v", linestyle="--")

# eliminate the lines
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], 
		marker="v", linestyle="None")
```

* **Choosing color**

```python
# in red color
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], 
		marker="v", linestyle="--", color="r")
```

* **Customizing the axes labels**

```python
ax.set_xlabel("Time (months)")
ax.set_ylabel("Average temperature (Fahrenheit degrees)")
plt.show()
```

* **Adding a title**

```python
ax.set_title("Weather in Seattle")
plt.show()
```

## 1.3 Small multiples

* **Adding data**

```python
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-NORMAL"], 
		color="b")
ax.set_xlabel("Time (months)")
ax.set_ylabel("Precipitation (inches)")
plt.show()

# add more data
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-25PCTL"], 
		linestyle="--", color="b")
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-75PCTL"], 
		linestyle="--", color="b")
plt.show()

# add more data
ax.plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-NORMAL"], 
		color="r")
ax.plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-25PCTL"], 
		linestyle="--", color="r")
ax.plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-75PCTL"], 
		linestyle="--", color="r")
plt.show()
```

* **Small multiples with plt.subplots**

```python
fig, ax = plt.subplots(3, 2)
plt.show()

ax.shape
(3, 2)

ax[0, 0].plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-NORMAL"], color="b"
plt.show()
```

```python
fig, ax = plt.subplots(2, 1)

ax[0].plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-NORMAL"], 
		   color="b")
ax[0].plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-25PCTL"], 
		   linestyle="--", color="b")
ax[0].plot(seattle_weather["MONTH"], seattle_weather["MLY-PRCP-75PCTL"], 
		   linestyle="--", color="b")
		
ax[1].plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-NORMAL"], 
		   color="r")
ax[1].plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-25PCTL"], 
		   linestyle="--", color="r")
ax[1].plot(austin_weather["MONTH"], austin_weather["MLY-PRCP-75PCTL"], 
		   linestyle="--", color="r")
		
ax[0].set_ylabel("Precipitation (inches)")
ax[1].set_ylabel("Precipitation (inches)")
ax[1].set_xlabel("Time (months)")

plt.show()

# set the same range of y-axis values
fig, ax = plt.subplots(2, 1, sharey=True)
```

# 2. Plotting time-series

## 2.1 Plotting time-series data

```python
import pandas as pd
climate_change = pd.read_csv('climate_change.csv', parse_dates=["date"], index_col="date")

import matplotlib.pyplot as plt
fig, ax = plt.subplots()

ax.plot(climate_change.index, climate_change['co2'])
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)')
plt.show()

# Zooming in on a decade
sixties = climate_changes["1960-01-01":"1969-12-31"]
fig, ax = plt.subplots()
ax.plot(sixties.index, sixties['co2'])
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)')
plt.show()

# Zooming in on one year
sixty_nine = climate_change["1969-01-01":"1969-12-31"]
fig, ax = plt.subplots()
ax.plot(sixty_nine.index, sixty_nine['co2'])
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)')
plt.show()
```

## 2.2 Plotting time-series with different variables

* **Plotting two time-series together**

```python
import pandas as pd
climate_change = pd.read_csv('climate_change.csv', parse_dates=["date"], index_col="date")

import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot(climate_change.index, climate_change['co2'])
ax.plot(climate_change.index, climate_change['relative_temp'])
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)/ Relative temperature')
plt.show()
```

* **Using twin axes**

```python
fig, ax = plt.subplots()
ax.plot(climate_change.index, climate_change['co2'])
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)')

ax2 = ax.twinx()
ax2.plot(climate_change.index, climate_change['relative_temp'])
ax2.set_ylabel('Relative temperature (Celsius)')
plt.show()
```
 
* **Separating variables by color**

```python
fig, ax = plt.subplots()
ax.plot(climate_change.index, climate_change['co2'], color='blue')
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)', color='blue')

ax2 = ax.twinx()
ax2.plot(climate_change.index, climate_change['relative_temp'], color='red')
ax2.set_ylabel('Relative temperature (Celsius)', color='red')
plt.show()
```

* **Coloring the ticks**

```python
fig, ax = plt.subplots()
ax.plot(climate_change.index, climate_change['co2'], color='blue')
ax.set_xlabel('Time')
ax.set_ylabel('CO2 (ppm)', color='blue')
ax.tick_params('y', colors='blue')

ax2 = ax.twinx()
ax2.plot(climate_change.index, climate_change['relative_temp'], color='red')
ax2.set_ylabel('Relative temperature (Celsius)', color='red')
ax2.tick_params('y', colors='red')
plt.show()
```

* **A function that plots time-series**

```python
def plot_timeseries(axes, x, y, color, xlabel, ylabel):
	axes.plot(x, y, color=color)
	axes.set_xlabel(xlabel)
	axes.set_ylabel(ylabel, color=color)
	axes.tick_params('y', colors=color)
	
fig, ax = plt.subplots()
plot_timeseries(ax, climate_change.index, climate_change['co2'], 'blue', 'Time', 'CO2 (ppm)')

ax2 = ax.twinx()
plot_timeseries(ax2, climate_change.index, climate_change['relative_temp'], 'red', 'Time', 'Relative temperature (Celsius)')
plt.show()
```




# 3. Quantitative comparisons and statistical visualizations





# 4. Sharing visualizations with others






















