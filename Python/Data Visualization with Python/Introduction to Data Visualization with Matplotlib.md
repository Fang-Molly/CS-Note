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

## 2.3 Annotating time-series data

* **Annotation** https://matplotlib.org/2.0.2/users/annotations.html

```python
fig, ax = plt.subplots()1q2
plot_timeseries(ax, climate_change.index, climate_change['co2'], 'blue', 'Time', 'CO2 (ppm)')
ax2 = ax.twinx()
plot_timeseries(ax2, climate_change.index, climate_change['relative_temp'], 'red', 'Time', 'Relative temperature (Celsius)')

ax2.annotate(">1 degree", xy=(pd.Timestamp("2015-10-06"), 1))
plt.show()
```

* **Positioning the text**

```python
ax2.annotate(">1 degree", 
			 xy=(pd.Timestamp('2015-10-06'), 1), 
			 xytext=(pd.Timestamp('2008-10-06'), -0.2))
```

* **Adding arrows to annotation**

```python
ax2.annotate(">1 degree", 
			 xy=(pd.Timestamp('2015-10-06'), 1), 
			 xytext=(pd.Timestamp('2008-10-06'), -0.2), 
			 arrowprops={})

# customize arrow properties
ax2.annotate(">1 degree", 
			 xy=(pd.Timestamp('2015-10-06'), 1), 
			 xytext=(pd.Timestamp('2008-10-06'), -0.2), 
			 arrowprops={"arrowstyle":"->", "color":"gray"})
```

# 3. Quantitative comparisons and statistical visualizations

## 3.1 Quantitative comparisons: bar-charts

* **Bar charts**

```python
medals = pd.read_csv('medals_by_country_2016.csv', index_col=0)
fig, ax = plt.subplots()
ax.bar(medals.index, medals["Gold"])
plt.show()
```

* **Interlude: rotate the tick labels**

```python
fig, ax = plt.subplots()
ax.bar(medals.index, medals["Gold"])
ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")
plt.show()
```

* **Stacked bar chart**

```python
fig, ax = plt.subplots()
ax.bar(medals.index, medals["Gold"])
ax.bar(medals.index, medals["Silver"], bottom=medals["Gold"])
ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")
plt.show()
```

```python
fig, ax = plt.subplots()
ax.bar(medals.index, medals["Gold"])
ax.bar(medals.index, medals["Silver"], bottom=medals["Gold"])
ax.bar(medals.index, medals["Bronze"], bottom=medals["Gold"] + medals["Silver"])
ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")
plt.show()
```

* **Adding a legend**

	* add label key-word argument to each call
	* add a call to ax.legend()

```python
fig, ax = plt.subplots()
ax.bar(medals.index, medals["Gold"], label="Gold")
ax.bar(medals.index, medals["Silver"], bottom=medals["Gold"], label="Silver")
ax.bar(medals.index, medals["Bronze"], bottom=medals["Gold"] + medals["Silver"], label="Bronze")

ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")
ax,legend()
plt.show()
```

## 3.2 Quantitative comparisons: histograms

* **Bar chart**

```python
fig, ax = plt.subplots()
ax.bar("Rowing", mens_rowing["Height"].mean())
ax.bar("Gymnastics", mens_gymnastics["Height"].mean())
ax.set_ylabel("Height (cm)")
plt.show()
```

* **Histograms**

```python
fig, ax = plt.subplots()
ax.hist(mens_rowing["Height"])
ax.hist(mens_gymnastic["Height"])
ax.set_xlabel("Height (cm)")
ax.set_ylabel("# of observations")
plt.show()
```

* **Add labels**

```python
fig, ax = plt.subplots()
ax.hist(mens_rowing["Height"], label="Rowing")
ax.hist(mens_gymnastic["Height"], label="Gymnastics")
ax.set_xlabel("Height (cm)")
ax.set_ylabel("# of observations")
ax.legend()
plt.show()
```

* **Customize histograms: setting the number of bins**

```python
fig, ax = plt.subplots()
ax.hist(mens_rowing["Height"], label="Rowing", bins=5)
ax.hist(mens_gymnastic["Height"], label="Gymnastics", bins=5)
ax.set_xlabel("Height (cm)")
ax.set_ylabel("# of observations")
ax.legend()
plt.show()
```

* **Customize histograms: setting bin boundaries**

```python
fig, ax = plt.subplots()
ax.hist(mens_rowing["Height"], label="Rowing", bins=[150, 160, 170, 180, 190, 200, 210])
ax.hist(mens_gymnastic["Height"], label="Gymnastics", bins=[150, 160, 170, 180, 190, 200, 210])
ax.set_xlabel("Height (cm)")
ax.set_ylabel("# of observations")
ax.legend()
plt.show()
```

* **Customize histograms: transparency**

```python
fig, ax = plt.subplots()
ax.hist(mens_rowing["Height"], label="Rowing", bins=[150, 160, 170, 180, 190, 200, 210], histtype = "step")
ax.hist(mens_gymnastic["Height"], label="Gymnastics", bins=[150, 160, 170, 180, 190, 200, 210], histtype = "step")
ax.set_xlabel("Height (cm)")
ax.set_ylabel("# of observations")
ax.legend()
plt.show()
```

## 3.3 Statistical plotting

* **Adding error bars to bar charts**

```python
fig, ax = plt.subplots()
ax.bar("Rowing", mens_rowing["Height"].mean(), yerr=mens_rowing["Height"].std())
ax.bar("Gymnastics", mens_gymnastics["Height"].mean(), yerr=mens_gymnastic["Height"].std())
ax.set_ylabel("Height (cm)")
plt.show()
```

* **Adding error bars to plots**

```python
fig, ax = plt.subplots()

ax.errorbar(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], yerr=seattle_weather["MLY-TAVG-STDDEV"])

ax.errorbar(austin_weather["MONTH"], austin_weather["MLY-TAVG-NORMAL"], yerr=austin_weather["MLY-TAVG-STDDEV"])

ax.set_ylabel("Temperature (Fahrenheit)")

plt.show()
```

* **Adding boxplots**

```python
fig, ax = plt.subplots()
ax.boxplot([mens_rowing["Height"], mens_gymnastics["Height"]])
ax.set_xticklabels(["Rowing", "Gymnastics"])
ax.set_ylabel("Height (cm)")
plt.show()
```

## 3.4 Quantitative comparisons: scatter plots

```python
fig, ax = plt.subplots()
ax.scatter(climate_change["co2"], climate_change["relative_temp"])
ax.set_xlabel("CO2 (ppm)")
ax.set_ylabel("Relative temperature (Celsius)")
plt.show()
```

* **Customize scatter plots**

```python
eighties = climate_change["1980-01-01":"1989-12-31"]
nineties = climate_change["1990-01-01":"1999-12-31"]
fig, ax = plt.subplots()
ax.scatter(eighties["co2"], eighties["relative_temp"], color="red", label="eighties")
ax.scatter(nineties["co2"], nineties["relative_temp"], color="blue", label="nineties")
ax.legend()
ax.set_xlabel("CO2 (ppm)")
ax.set_ylabel("Relative temperature (Celsius)")
plt.show()
```

* **Encoding a third variable by color**

```python
fig, ax = plt.subplots()
ax.scatter(climate_change["co2"], climate_change["relative_temp"], c=climate_change.index)
ax.set_xlabel("CO2 (ppm)")
ax.set_ylabel("Relative temperature (Celsius)")
plt.show()
```

# 4. Sharing visualizations with others

## 4.1 Preparing your figures to share with others

* **Changing plot style**

```python
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"])
ax.plot(austin_weather["MONTH"], austin_weather["MLY-TAVG-NORMAL"])
ax.set_xlabel("Time (months)")
ax.set_ylabel("Average temperature (Fahrenheit degrees)")
plt.show()
```

* **Choosing a style**

```python
import matplotlib.pyplot as plt
plt.style.use("ggplot")
fig, ax = plt.subplots()
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"])
ax.plot(austin_weather["MONTH"], austin_weather["MLY-TAVG-NORMAL"])
ax.set_xlabel("Time (months)")
ax.set_ylabel("Average temperature (Fahrenheit degrees)")
plt.show()
```

* **Back to the default**

```python
plt.style.use("default")
```

* **The available styles**

https://matplotlib.org/stable/gallery/style_sheets/style_sheets_reference.html

* **Guidelines for choosing plotting style

	* Dark backgrounds are usually less visible
	* If color is important, consider choosing colorblind-friendly options
		* "seaborn-colorblind" or "tableau-colorblind10"
	* If you think that someone will want to print your figure, use less ink
	* If it will be printed in black-and-white, use the "grayscale" style

## 4.2 Saving your visualizations

```python
fig, ax = plt.subplots()

ax.bar(medals.index, medals["Gold"])
ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")

plt.show()
```

* **Saving the figure to file**

```python
fig, ax = plt.subplots()

ax.bar(medals.index, medals["Gold"])
ax.set_xticklabels(medals.index, rotation=90)
ax.set_ylabel("Number of medals")

fig.savefig("gold_medals.png")
```

* **Different file formats**

```python
fig.savefig("gold_medals.png")

fig.savefig("gold_medals.png", quality=50)

fig.savefig("gold_medals.svg")

# resolution
fig.savefig("gold_medals.png", dpi=300)

# size
fig.set_size_inches([5, 3])
```

## 4.3 Automating figures from data

* **Bar-chart of heights for all sports**

```python
sports = summer_2016_medals["Sport"].unique()

fig, ax = plt.subplots()

for sport in sports:
	sport_df = summer_2016_medals[summer_2016_medals[Sport"] == sport]
	ax.bar(sport, sport_df["Height"].mean(), yerr=sport_df["Height"].std())
	
ax.set_ylabel("Height (cm)")
ax.set_xticklabels(sports, rotation=90)

plt.show()
```


