Introduction to Data Visualization with Seaborn
===============================================

# 1. Introduction to Seaborn

## 1.1 Introduction to Seaborn

* **Pandas**

	* `pandas` is a fundational library for analyzing data
	* Easily read datasets from csv, txt and other types of files
	* It supports basic plotting capability

```python
import pandas as pd

df = pd.read_csv("wines.csv")

df['alcohol'].plot.hist()
```

* **Matplotlib**

	* `matplotlib` provides the raw building blocks for Seaborn's visualizations
	* It can also be used on its own to plot data

```python
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("wines.csv")

fig, ax = plt.subplots()
ax.hist(df['alcohol'])
```

* **Seaborn**

	* Seaborn is a library for making statistical graphics in Python.
	* It is built on matplotlib and works best with pandas dataframes
	
	* **Getting started**

		* Install: `pip3 install seaborn`

		* Import seaborn: `sns`, Samuel Norman Seaborn

```
# import seaborn
import seaborn as sns

# import matplotlib
import matplotlib.pyplot as plt

# show a plot
plt.show()
```

* **Seaborn Scatter plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt
height = [62, 64, 69, 75, 66, 68, 65, 71, 76, 73]
weight = [120, 136, 148, 175, 137,165, 154, 172, 200, 187]
sns.scatterplot(x=height, y=weight)
plt.show()
```

* **Seaborn count plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt
gender = ["Female", "Female", "Female", "Female", "Male", "Male", "Male", "Male", "Male", "Male"]
sns.countplot(x=gender)
plt.show()
```

* **Seaborn histplot**

```python
import pandas as pd
import seaborn as sns

df = pd.read_csv("wines.csv")

sns.histplot(df['alcohol'])
```

* **Seaborn displot**

	* The `displot` leverages the `histplot` and other functions for distribution plots
	* By default, it generates a histogram but can also generate other plot types

```python
import pandas as pd
import seaborn as sns

df = pd.read_csv("wines.csv")

sns.displot(df['alcohol'], kind="kde")
```

* **pandas Histogram vs. Displot**

	* Pandas histogram: `df['alcohol'].plot.hist()`
		* Actual frequency of observations
		* No outline of bars
		* Wide bins
		* No x-axis label
	* Seaborn displot: `sns.displot(df['alcohol'])`
		* Automatic label on x-axis
		* Muted color palette
		* Cleaner plot

## 1.2 Using the distribution plot

* **Creating a histogram**

	* The `displot` function has multiple optional arguments
	* You can overlay a KDE plot on the histogram and specity the number of bins to use

```python
import pandas as pd
import seaborn as sns

df = pd.read_csv("wines.csv")

sns.displot(df['alcohol'], kde=True, bins=10)
```

* **Alternative data distributions**

	* A rug plot is an alternative way to view the distribution of data by including small tickmarks along the x axis
	* A kde curve and rug plot can be combined

```python
import pandas as pd
import seaborn as sns

df = pd.read_csv("wines.csv")

sns.displot(df['alcohol'], kind='kde', rug=True, fill=True)
```

* **Further plot types**

	* The `displot` function uses several functions including `kdeplot`, `rugplot`, `ecdfplot`
	* The `ecdfplot` shows the cumulative distribution of the data

```python
import pandas as pd
import seaborn as sns

df = pd.read_csv("wines.csv")

sns.displot(df['alcohol'], kind='ecdf')
```

## 1.3 Using pandas with Seaborn

* **Using DataFrames with countplot()**

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
df = pd.read_csv("masculinity.csv")
sns.countplot(x="how_masculine", data=df)
plt.show()
```

## 1.4 Adding a third variable with hue

* Setting `hue` will create subgroups that are displayed as different colors on a single plot

```python
# load library
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# load dataset
tips = sns.load_dataset("tips")
tips.head()

# create scatter plot
sns.scatterplot(x="total_bill", y="tip", data=tips)
plt.show()

# scatter plot with hue
sns.scatterplot(x="total_bill", y="tip", data=tips, hue="smoker")
plt.show()

# setting hue order
sns.scatterplot(x="total_bill", y="tip", data=tips, hue="smoker", hue_order=["Yes", "No"])
plt.show()

# specifiy hue colors
hue_colors = {"Yes": "black", "No": "red"}
sns.scatterplot(x="total_bill", y="tip", data=tips, hue="smoker", palette=hue_colors)
plt.show()

# Using HTML hex color codes with hue
hue_colors = {"Yes": "#808080", "No": "#00FF00"}
sns.scatterplot(x="total_bill", y="tip", data=tips, hue="smoker", palette=hue_colors)
plt.show()

# Using hue with count plots
sns.scatterplot(x="smoker", data=tips, hue="sex")
plt.show()
```



# 2. Visualizing Two Quantitative Variables

## 2.1 Introduction to relational plots and subplots

* **Questions about quantitative variables**

	* **Relational plots**: show the relationship between two quantitative variables

		* Height vs. weight
		* Number of school absences vs. final grade
		* GDP vs. percent literate

* **Introducing relplot()**

	* Create "relational plots": scatter plots or line plots
		* Why use `relplot()` instead of `scatterplot()`?

	* `relplot()` lets you create subplots in a single figure

```python
# using `scatterplot()`
import seaborn as sns
import matplotlib.pyplot as plt
sns.scatterplot(x="total_bill", y="tip", data=tips)
plt.show()

# using `relplot()`
import seaborn as sns
import matplotlib.pyplot as plt
sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter")
plt.show()
```

* **Subplots in columns**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", col="smoker")
plt.show()
```

* **Subplots in rows**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", row="smoker")
plt.show()
```

* **Subplots in rows and columns**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", col="smoker", row="time")
plt.show()
```

* **Wrapping columns**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", col="day", col_wrap=2)
plt.show()
```

* **Ordering columns**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", col="day", col_wrap=2, col_order=["Thur", "Fri", "Sat", "Sun"])
plt.show()
```

## Customizing scatter plots

* **Scatter plot overview**

	* Show relationship between two quantitative variables
	* We've seen:
		* Subplots (`col` and `row`)
		* Subgroups with color (`hue`)

	* New Customizations:
		* Subgroups with point size and style
		* Changing point transparency

	* Use with both `scatterplot()` and `relplot()`

* **Subgroups with point size**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", size="size")
plt.show()
```

* **Point size and hue**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", size="size", hue="size")
plt.show()
```

* **Subgroups with point style**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", hue="smoker", style="smoker")
plt.show()
```

* **Changing point transparency**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="total_bill", y="tip", data=tips, kind="scatter", alpha=0.4)
plt.show()
```

## Introduction to line plots

* **What are line plots**

	* Two types of relational plots: 
		* Scatter plots: each plot point is an independent observation
		* Line plots: each plot point represents the same "thing", typically tracked over time

* **Scatter plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2_mean", data=air_df_mean, kind="scatter")
plt.show()
```

* **Line plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2_mean", data=air_df_mean, kind="line")
plt.show()
```

* **Subgroups by location**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2_mean", data=air_df_mean, kind="line", style="location", hue="location")
plt.show()
```

* **Add markers**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2_mean", data=air_df_mean, kind="line", style="location", hue="location", markers=True)
plt.show()
```

* **Turning off line style**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2_mean", data=air_df_mean, kind="line", style="location", hue="location", markers=True, dashes=False)
plt.show()
```

* **Multiple observations per x-value**

	* Shaded region is the confidence interval
		* Assumes dataset is a random sample
		* 95% confident that the mean is within this interval
		* Indicates uncertainty in our estimate

```python
import seaborn as sns
import matplotlib.pyplot as plt

# scatter plot
sns.relplot(x="hour", y="NO_2", data=air_df, kind="scatter")
plt.show()

# line plot
sns.relplot(x="hour", y="NO_2", data=air_df, kind="line")
plt.show()
```

* **Replacing confidence interval with standard deviation**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2", data=air_df, kind="line", ci="sd")
plt.show()
```

* **Turning off confidence interval**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.relplot(x="hour", y="NO_2", data=air_df, kind="line", ci=None)
plt.show()
```

# 3. Visualizing a Categorical and a Quantitative Variable

## 3.1 Count plots and bar plots

* **Categorical Data**
	* Data which takes on a limited and fixed number of values
	* Normally combined with numeric data
	* Examples include:
		* Geography(country, state, region)
		* Gender
		* Ethnicity
		* Blood type
		* Eye color

* **Categorical plots**: show the distribution of a quantitative variable within categories defined by a categorical variable

	* Examples: count plots, bar plots, box plots, point plots
	* Involve a categorical variable
	* Comparisons between groups

* **catplot()**

	* Used to create categorical plots
	* Same advantages of `repplot()`
	* Easily create subplots with `col=` and `row=`

* **countplot() vs. catplot()**

```python
import seaborn as sns
import matplotlib.pyplot as plt
sns.countplot(x="how_masculine", data=masculinity_data)
plt.show()
```

```python
import seaborn as sns
import matplotlib.pyplot as plt
sns.catplot(x="how_masculine", data=masculinity_data, kind="count")
plt.show()
```

* **Changing the order**

```python
import seaborn as sns
import matplotlib.pyplot as plt

category_order = ["No answer", "Not at all", "Not very", "Somewhat", "Very"]
sns.catplot(x="how_masculine", data=masculinity_data, kind="count", order=category_order)
plt.show()
```

* **Bar plots**

	* Display mean of quantitative variable per category

	* Confidence intervals
		* Lines show 95% confidence intervals for the mean
		* Shows uncertainy about our estimate
		* Assumes our data is a random sample

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="day", y="total_bill", data=tips, kind="bar")
plt.show()
```

* **Turning off confidence intervals**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="day", y="total_bill", data=tips, kind="bar", ci=None)
plt.show()
```

* **Changing the orientation**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="total_bill", y="day", data=tips, kind="bar" )
plt.show()
```


## Creating a box plot

* **What is a box plot?**

	* Shows the distribution of quantitative data
	* See median, spread, skewness, and outliers
	* Facilitations comparisons between groups

* **How to create a box plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="time", y="total_bill", data=tips, kind="box")
plt.show()
```

* **Change the order of categories**

```python
import seaborn as sns
import matplotlib.pyplot as plt

g = sns.catplot(x="time", y="total_bill", data=tips, kind="box", order=["Dinner", "Lunch"])
plt.show()
```

* **Omitting the outliers using `sym`**

```python
import seaborn as sns
import matplotlib.pyplot as plt

g = sns.catplot(x="time", y="total_bill", data=tips, kind="box", sym="")
plt.show()
```

* **Changing the whiskers using `whis`**

	* By default, the whiskers extend to 1.5 * the interquartile range
	* Make them extend to 2.0 * IQR: `whis=2.0`
	* Show the 5th and 95th percentiles: `whis=[5, 95]`
	* Show min and max values: `whis=[0, 100]`

* **Changing the whiskers using `whis`**

```python
import seaborn as sns
import matplotlib.pyplot as plt

g = sns.catplot(x="time", y="total_bill", data=tips, kind="box", whis=[0, 100])
plt.show()
```

## Point plots

* **What are point plots?**

	* Points show mean of quantitative confidence
	* Vertical lines show 95% confidence intervals

* **Point plots vs. line plots**

	* Both show:
		* Mean of quantitative variable
		* 95% confidence intervals for the mean

	* Differences:
		* Line plot has quantitative variable (usually time) on x-axis
		* Point plot has categorical variable on x-axis

* **Point plots vs. bar plots**

	* Both show:
		* Mean of quantitative variable
		* 95% confidence intervals for the mean 

* **Creating a point plot**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

* **Disconnecting the points**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point", join=False)

plt.show()
```

* **Displaying the median**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="smoker", y="total_bill", data=tips, kind="point")
plt.show()
```

```python
import seaborn as sns
import matplotlib.pyplot as plt
from numpy import median

sns.catplot(x="smoker", y="total_bill", data=tips, kind="point", estimator=median)
plt.show()
```

* **Customizing the confidence intervals**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="smoker", y="total_bill", data=tips, kind="point", capsize=0.2)
plt.show()
```

* **Turning off confidence intervals**

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.catplot(x="smoker", y="total_bill", data=tips, kind="point", ci=None)
plt.show()
```

# 4. Customizing Seaborn Plots

## 4.1 Changing plot style and color

* **Setting Styles**

	* Seaborn has default configurations that can be applied with `sns.set()`
	* These styles can override matplotlib and pandas plots as well

* **Changing the figure style**

	* Figure "style" includes background and axes
	* Preset options: "white", "dark", "whitegrid", "darkgrid", "ticks"
	* `sns.set_style()`

* **Default figure style ("white")

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

* **Figure style: "whitegrid"**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("whitegrid")

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

* **Other styles**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("ticks")

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("dark")

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("darkgrid")

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

```python
for style in ['white', 'dark', 'whitegrid', 'darkgrid', 'ticks']:
	sns.set_style(style)
	sns.displot(df['Tuition'])
	plt.show()
```

* **Removing axes with despine()**

	* Sometimes plots are improved by removing elements
	* Seaborn contains a shortcut for removing the spines of a plot

```python
sns.set_style('white')
sns.displot(df['Tuition'])
sns.despine(left=True)
```

* **Defining a color for a plot**

	* Seaborn supports assigning colors to plots using `matplotlib` color codes

```python
sns.set(color_codes=True)
sns.displot(df['Tuition'], color='g')
```

* **Palettes**
	* Figure "palette" changes the color of the main elements of the plot
	* Seaborn uses the `sns.set_palette()` function to define a palette
	* Use present palettes or create a custom palette

```python
palettes = ['deep', 'muted', 'pastel', 'bright', 'dark', 'color blind']
for p in palettes:
	sns.set_palette(p)
	sns.displot(df['Tuition'])
```

* **Displaying Palettes**

	* `sns.palplot()` function displays a palette
	* `sns.color_palette()` returns the current palette

```python
import matplotlib.pyplot as plt
import seaborn as sns
palettes = ['deep', 'muted', 'pastel', 'bright', 'dark', 'color blind']
for p in palettes:
	sns.set_palette(p)
	sns.palplot(sns.color_palette())
	plt.show()
```

* **Defining Custom Palettes**

	* **Circular colors**: when the data is not ordered
		* `sns.palplot(sns.color_palette("Paired",
	
	* **Diverging colors**: when both the low and high values are interesting
		* "RdBu", "PRGn", "RdBu_r", "PRGn_r"
		* `sns.palplot(sns.color_palette("BrBG",

	* **Sequential colors**: When the data has a consistent range from high to low
		* "Greys", "Blues", "PuRd", "GnBu"
		* `sns.palplot(sns.color_palette("Blues",

* **Example (default palette)

```python
import matplotlib.pyplot as plt
import seaborn as sns

category_order = ["No answer", "Not at all", "Not very", "Somewhat", "Very"]

sns.catplot(x="how_masculine", data=masculinity_data, kind="count", order=category_order)

plt.show()
```

* **Example (diverging palette)**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_palette("RdBu")

category_order = ["No answer", "Not at all", "Not very", "Somewhat", "Very"]

sns.catplot(x="how_masculine", data=masculinity_data, kind="count", order=category_order)

plt.show()
```

* **Custom palettes**

```python
custom_palettle = ["red", "green", "orange", "blue", "yellow", "purple"]

sns.set_palette(custom_palette)
```

```python
custom_palettle = ['#FBB4AE', '#B3CDE3', '#CCEBC5', '#DECBE4', '#FED9A6', '#FFFFCC', '#E5D8BD', '#FDDAEC', '#F2F2F2']

sns.set_palette(custom_palette)
```

* **Changing the scale**

	* Figure "context" changes the scale of the plot elements and labels
	* `sns.set_context()`
	* Smallest to largest: "paper", "notebook", "talk", "poster"

* **Default context: "paper"**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

* **Larger context: "talk"**

```python
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_context("talk")

sns.catplot(x="age", y="masculinity_important", data=masculinity_data, hue="feel_masculine", kind="point")

plt.show()
```

## 4.2 Adding titles and labels

* **Creating informative visualizations**

* **FacetGrid vs. AxesSubplot objects**

	* `FacetGrid`
		* `relplot()`, `catplot()`
		* Can create subplots
	
	* `AxesSubplot`
		* `scatterplot()`, `countplot()`, etc
		* Only creates a single plot

```python
g = sns.scatterplot(x="height", y="weight", data=df)
type(g)
```

|Object Type  |Plot Types                          |Characteristics           |
|:-----------:|:----------------------------------:|:------------------------:|
|`FacetGrid`  |`relplot()`, `catplot()`            |Can create subplots       |
|`AxesSubplot`|`scatterplot()`, `countplot()`, etc.|Only creates a single plot|

* **Adding a tile to FacetGrid**

```python
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box")
g.fig.suptitle("New Title")
plt.show()
```

* **Adjusting height of title in FacetGrid**

```python
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box")
g.fig.suptitle("New Title", y=1.03)
plt.show()
```

* **Adding a title to AxesSubplot**

```python
# FacetGrid
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box")
g.fig.suptitle("New Title", y=1.03)

# AxesSubplot
g = sns.boxplot(x="Region", y="Birthrate", data=gdp_data)
g.set_title("New Title", y=1.03)
```

* **Titles for subplots**

```python
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box", col="Group")

g.fig.suptitle("New Title", y=1.03)

g.set_title("This is {col_name}")
```

* **Adding axis labels**

```python
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box")

g.set(xlabel="New X Label", ylabel="New Y Label")

plt.show()
```

* **Rotating x-axis tick labels**

```python
g = sns.catplot(x="Region", y="Birthrate", data=gdp_data, kind="box")

plt.xticks(rotation=90)

plt.show()
```

## 4.3 Customizing with matplotlib

* **Matplotlib Axes**

	* Most customization available through `matplotlib` `Axes` objects
	* `Axes` can be passed to seaborn functions

```python
fig, ax = plt.subplots()
sns.histplot(df['Tuition'], ax=ax)
ax.set(xlabel='Tuition 2013-14')
```

* **Further Customizations**

	* The `axes` object supports many common customizations

```python
fig, ax = plt.subplots()
sns.histplot(df['Tuition'], ax=ax)
ax.set(xlabel='Tuition 2013-14', ylabel='Distribution', xlim=(0, 50000), title='2013-14 Tuition and Fees Distribution')
```

* **Combining Multiple Plots**

```python
fig, (axo, ax1) = plt.subplots(nrows=1, ncols=2, sharey=Ture, figsize(7, 4))

sns.histplot(df['Tuition'], stat='density', ax=ax0)
sns.histplot(df.query('State == "MN")['Tuition'], stat='")

ax1.set(xlabel='Tuition(MN)', xlim=(0, 70000))
ax1.axvline(x=20000, label='My Budget', linestyle='--')
ax1.legend()
```

# 5. Additional Plot Types

## 5.1 Categorical Plot Types

* **Plots of each observation - stripplot**

```python
sns.stripplot(data=df, y="DRG Definition", x="Average Covered Charges", jitter=True)
```

* **Plots of each observation - swarmplot**

```python
sns.swarmplot(data=df, y="DRG Definition", x="Average Covered Charges")
```

* **Abstract representations - boxplot**

```python
sns.boxplot(data=df, y="DRG Definition", x="Average Covered Charges")
```

* **Abstract representations - violinplot**

```python
sns.violinplot(data=df, y="DRG Definition", x="Average Covered Charges")
```

* **Abstract representations - boxenplot**

```python
sns.boxenplot(data=df, y="DRG Definition", x="Average Covered Charges")
```

* **Statistical estimates - barplot**

```python
sns.barplot(data=df, y="DRG Definition", x="Average Covered Charges", hue="Region")
```

* **Statistical estimates - pointplot**

```python
sns.poinplot(data=df, y="DRG Definition", x="Average Covered Charges", hue="Region")
```

* **Statistical estimates - countplot**

```python
sns.countplot(data=df, y="DRG Definition", x="Average Covered Charges", hue="Region")
```

## 5.2 Regression Plots

* **Introduction to regplot**

	* The `regplot` function generates a scatter plot with a regression line
	* Usage is similar to the `displot`
	* The `data` and `x` and `y` variables must be defined

`sns.regplot(data=df, x="alcohol", y="pH")`

* **lmplot() builds on top of the base regplot()**

	* `regplot` - low level
	
	```python
	sns.regplot(data=df, x="alcohol", y="quality")
	```
	
	* `lmplot` - high level

	```python
	sns.lmplot(data=df, x="alcohol", y="quality")
	```

* **lmplot faceting**

	* Organize data by colors (`hue`)
	
	```python
	sns.lmplot(data=df, x="quality", y="alcohol", hue="type")
	```
	
	* Organize data by columns (`col`)
	
	```python
	sns.lmplot(data=df, x="quality", y="alcohol", col="type")
	```
	
* **Plotting with regplot()**

```python
sns.regplot(data=df, x='temp', y='total_rentals', marker='+')
```

* **Evaluating regression with residplot()**

	* A residual plot is useful for evaluating the fit of a model
	* Seaborn supports through `residplot` function

```python
sns.residplot(data=df, x='temp', y='total_rentals')
```

* **Polynomial regression**

	* Seaborn supports polynomial regression using the `order` parameter

```python
sns.regplot(data=df, x='temp', y='total_rentals', order=2)
```

* **residplot with polynomial regression

```python
sns.residplot(data=df, x='temp', y='total_rentals', order=2)
```

* **Categorical values**

```python
sns.regplot(data=df, x='mnth', y='total_rentals', x_jitter=.1, order=2)
```

* **Estimators**

	* In some cases, an `x_estimator` can be useful for highlighting trends

```python
sns.regplot(data=df, x='mnth', y='total_rentals', x_estimator=np.mean, order=2)
```

* **Binning the data

	* `x_bins` can be used to divide the data into discrete bins
	* The regression line is still fit against all the data

```python
sns.regplot(data=df, x='temp', y='total_rentals', x_bins=4)
```

## 5.3 Matrix Plots

* **Getting data in the right format**

	* Seaborn's `heatmap()` function requires data to be in a grid format
	* pandas `crosstab()` is frequently used to manipulate the data

```python
pd.crosstab(df["mnth"], df["weekday"], values=df["total_rentals"], aggfunc="mean").round(0)
```

* **Build a heatmap**

```python
sns.heatmap(pd.crosstab(df["mnth"], df["weekday"], values=df["total_rentals"], aggfunc="mean"))
```

* **Customize a heatmap**

```python
sns.heatmap(df_crosstab, annot=True, fmt="d", cmap="YlGnBu", cbar=False, linewidths=.5)
```

* **Centering a heatmap**

```python
sns.heatmap(df_crosstab, annot=True, fmt="d", cmap="YlGnBu", cbar=True, center=df_crosstab.loc[9, 6])
```

* **Plotting a correlation matrix**

	* Pandas `corr` function calculates correlations between columns in a dataframe
	* The output can be converted to a heatmap with seaborn

```python
cols = ['total_rentals', 'temp', 'casual', 'hum', 'windspeed']
sns.heatmap(df[cols].corr(), cmap='YlGnBu')
```

# 6. Creating Plots on Data Aware Grids

## 6.1 Using FacetGrid, catplot and lmplot

* **Tidy data**

	* Seaborn's grid plots require data in "tidy format"
	* One observation per row of data

* **FacetGrid**

	* The `FacetGrid` is foundational for many data aware grids
	* It allows the user to control how data is distributed across columns, rows and hue
	* Once a `FacetGrid` is created, the plot type must be mapped to the grid

* **FacetGrid Categorical Example**

```python
g = sns.FacetGrid(df, col='HIGHDEG')
g.map(sns.boxplot, 'Tuition', order=['1', '2', '3', '4'])
```

* **catplot()**

	* The `catplot` is a simpler way to use a `FacetGrid` for categorical data
	* Combines the facetting and mapping process into 1 function

```python
sns.catplot(x="Tuition", data=df, col="HIGHDEG", kind="box")
```

* **FacetGrid for regression**

	* `FacetGrid()` can also be used for scatter or regression plots

```python
g = sns.FacetGrid(df, col='HIGHDEG')
g.map(plt.scatter, 'Tuition', 'SAT_AVG_ALL')
```

* **lmplot**

	* `lmplot` plots scatter and regression plots on a `FacetGrid`

```python
sns.lmplot(data=df, x="Tuition", y="SAT_AVG_ALL", col="HIGHDEG", fit_reg=False)
```

* **lmplot with regression**

```python
sns.lmplot(data=df, x="Tuition", y="SAT_AVG_ALL", col="HIGHDEG", row="REGION")
```

## 6.2 Using PairGrid and pairplot

* **Pairwise relationships**

	* `PairGrid` shows pairwise relationships between data elements

* **Creating a PairGrid**

	* The `PairGrid` follows similar API to FacetGrid

```python
g = sns.PairGrid(df, vars=["Fair_Mrkt_Rent","Median_Income"])
g = g.map(sns.scatterplot)
```

* **Customizing the PairGrid diagonals**

```python
g = sns.PairGrid(df, vars=["Fair_Mrkt_Rent", "Median_Income"])
g = g.map_diag(sns.histplot)
g = g.map_offdiag(sns.scatterplot)
```

* **Pairplot**

	* `pairplot` is a shortcut for the `PairGrid`

```python
sns.pairplot(df, vars=["Fair_Mrkt_Rent","Median_Income"], kind="reg", diag_kind="hist")
```

* **Customizing a pairplot**

```python
sns.pairplot(df.query("BEDRMS < 3"), vars=["Fair_Mrkt_Rent", "Median_Income", "UTILITY"], hue="BEDRMS", palette="husl", plot_kws={"alpha": 0.5})
```

## 6.3 Using JointGrid and jointplot

* **Basic JointGrid**

```python
g = sns.JointGrid(data=df, x="Tuition", y="ADM_RATE_ALL")
g.plot(sns.regplot, sns.histplot)
```

* **Advanced JointGrid**

```python
g = sns.JointGrid(data=df, x="Tuition", y="ADM_RATE_ALL")
g = g.plot_joint(sns.kdeplot)
g = g.plot_marginals(sns.kdeplot, shade=True)
```

* **jointplot()**

```python
sns.jointplot(data=df, x="Tuition", y="ADM_RATE_ALL", kind=
```

* **Customizing a jointplot**

```python
g = (sns.jointplot(x="Tuition", y="ADM_RATE_ALL", kind="scatter", xlim=(0, 25000), data=df.query('UG < 2500 & Ownership == "Public"')).plot_joint(sns.kdeplot))
```

## 6.4 Selecting Seaborn Plots

* **Univariate Distribution Analysis**

	* `displot()` is the best place to start for this analysis
	* `rugplot()`, `kdeplot()` and `ecdfplot()` can be useful alternatives

* **Regression Analysis**

	* `lmplot()` performs regression analysis and supports facetting

* **Categorical Plots**

	* Explore data with the categorical plots and facet with 

* **pairplot() and jointplot()**

	* Perform regression analysis with `lmplot`
	* Analyze distributions with `displot`


























