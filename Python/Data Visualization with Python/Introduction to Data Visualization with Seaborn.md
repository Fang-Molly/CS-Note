Introduction to Data Visualization with Seaborn
===============================================

# 1. Introduction to Seaborn

## 1.1 Introduction to Seaborn

* **What is Seaborn?**

	* Seaborn is a library for making statistical graphics in Python.

	* It builds on top of matplotlib and integrates closely with pandas data structures.

* **Getting started**

	* Install: `pip3 install seaborn`

	* Import seaborn: `sns`, Samuel Norman Seaborn

```
import seaborn as sns
import matplotlib.pyplot as plt
```

* **Example 1: Scatter plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt
height = [62, 64, 69, 75, 66, 68, 65, 71, 76, 73]
weight = [120, 136, 148, 175, 137,165, 154, 172, 200, 187]
sns.scatterplot(x=height, y=weight)
plt.show()
```

* **Example 2: Create a count plot**

```python
import seaborn as sns
import matplotlib.pyplot as plt
gender = ["Female", "Female", "Female", "Female", "Male", "Male", "Male", "Male", "Male", "Male"]
sns.countplot(x=gender)
plt.show()
```

## 1.2 Using pandas with Seaborn

* **Using DataFrames with countplot()**

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
df = pd.read_csv("masculinity.csv")
sns.countplot(x="how_masculine", data=df)
plt.show()
```

## 1.3 Adding a third variable with hue

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

	* Relational plots

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

* **Categorical plots**

	* Examples: count plots, bar plots
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

* **Why customize?**

	* Personal preference
	* Improve readability
	* Guide interpretation

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

* **Changing the palette**

	* Figure "palette" changes the color of the main elements of the plot
	* `sns.set_palette()`
	* Use present palettes or create a custom palette

* **Diverging palettes**

	* "RdBu"
	* "PRGn"
	* "RdBu_r"
	* "PRGn_r"

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

* **Sequential palettes**

	* "Greys"
	* "Blues"
	* "PuRd"
	* "GnBu"

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

## Adding titles and labels

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

* **Adding a tile to FacetGrid**























