Introduction to Data Visualization with Seaborn
===============================================

# 1. Introduction to Seaborn

## 1.1 Introduction to Seaborn

* What is Seaborn?

	* Seaborn is a library for making statistical graphics in Python.

	* It builds on top of matplotlib and integrates closely with pandas data structures.

* Getting started

	* Install: `pip3 install seaborn`

	* Import seaborn: `sns`, Samuel Norman Seaborn

```
import seaborn as sns
import matplotlib.pyplot as plt
```

* Example 1: Scatter plot

```python
import seaborn as sns
import matplotlib.pyplot as plt
height = [62, 64, 69, 75, 66, 68, 65, 71, 76, 73]
weight = [120, 136, 148, 175, 137,165, 154, 172, 200, 187]
sns.scatterplot(x=height, y=weight)
plt.show()
```

* Example 2: Create a count plot 

```python
import seaborn as sns
import matplotlib.pyplot as plt
gender = ["Female", "Female", "Female", "Female", "Male", "Male", "Male", "Male", "Male", "Male"]
sns.countplot(x=gender)
plt.show()
```

## 1.2 Using pandas with Seaborn

* Using DataFrames with countplot()

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

* Questions about quantitative variables

	* Relational plots

		* Height vs. weight
		* Number of school absences vs. final grade
		* GDP vs. percent literate

* Introducing relplot()

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

* **Customizing scatter plots**





# 3. Visualizing a Categorical and a Quantitative Variable






# 4. Customizing Seaborn Plots




