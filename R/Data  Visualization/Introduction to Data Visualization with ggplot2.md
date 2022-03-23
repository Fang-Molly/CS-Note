Introduction to Data Visualization with ggplot2
===============================================

# 1. Introduction

## 1.1 Introduction

* Data visualization & data science  

* Exploratory versus  

* `MASS::mammals`

```R
> MASS::mammals
                              body   brain
Arctic fox                   3.385   44.50
Owl monkey                   0.480   15.50
Mountain beaver              1.350    8.10
Cow                        465.000  423.00
Grey wolf                   36.330  119.50
Goat                        27.660  115.00
Roe deer                    14.830   98.20
...
Pig                        192.000  180.00
Echidna                      3.000   25.00
Brazilian tapir            160.000  169.00
Tenrec                       0.900    2.60
Phalanger                    1.620   11.40
Tree shrew                   0.104    2.50
Red fox                      4.235   50.40
```

* A scatter plot

```R
> mammals <- MASS::mammals
> ggplot(mammals, aes(x = body, y = brain)) +
+     geom_point()
```

* Explore with a linear model

```R
ggplot(mammals, aes(x = body, y = brain)) +
+     geom_point(alpha = 0.6) +
+     stat_smooth(
+         method = "lm",
+         color = "red",
+         se = FALSE
+     )
```

* Explore: fine-tuning

```R
ggplot(mammals, aes(x = body, y = brain)) +
+     geom_point(alpha = 0.6) +
+     coord_fixed() +
+     scale_x_log10() +
+     scale_y_log10() +
+     stat_smooth(
+         method = "lm",
+         color = "#C42126",
+         se = FALSE,
+         size = 1
+     )
```

* Publication-ready plot

* Anscombe's plots 

## 1.2 The grammar of graphics

* Grammar of graphics

	* Plotting framework
	* Leland Wilkinson, Grammar of Graphics, 1999
	* 2 principles
		* Graphics = distinct layers of grammatical elements
		* Meaningful plots through aesthetic mappings

* Grammatical elements

|Element    |Description                                       |
|:---------:|:------------------------------------------------:|
|Data       |The data-set being plotted.                       |
|Aesthetics |The scales onto which we map our data.            |
|Geometries |The visual elements used for our data.            |
|Themes     |All non-data ink.                                 |
|Statistics |Representations of our data to aid understanding. |
|Coordinates|The space on which the data will be plotted.      |
|Facets     |Plotting small multiples.                         |

## 1.3 ggplot2 layers

* ggplot2 package

	* The grammar of graphics implemented in R
	* Two key concepts :
		1. Layer grammatical elements
		2. Aesthetic mappings

* Iris dataset

```R
> iris
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1            5.1         3.5          1.4         0.2     setosa
2            4.9         3.0          1.4         0.2     setosa
3            4.7         3.2          1.3         0.2     setosa
...
50           5.0         3.3          1.4         0.2     setosa
51           7.0         3.2          4.7         1.4 versicolor
52           6.4         3.2          4.5         1.5 versicolor
53           6.9         3.1          4.9         1.5 versicolor
...
100          5.7         2.8          4.1         1.3 versicolor
101          6.3         3.3          6.0         2.5  virginica
102          5.8         2.7          5.1         1.9  virginica
103          7.1         3.0          5.9         2.1  virginica
...
150          5.9         3.0          5.1         1.8  virginica
```

```R
> g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_jitter()
> g
> 
> g <- g +
+     labs(x = "Sepal Lengh (cm)", y = "Sepal Width (cm)") +
+     theme_classic()
> g
```

# 2. Aesthetics

## 2.1 Visible aesthetics

* Mapping onto the X and Y axes

```R
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_point()
```

* Mapping onto color

> Species: a dataframe column, is mapped onto color, a visible aesthetic.

```R
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point()
```

* Mapping onto the color aesthetic in geom

```R
> ggplot(iris) + 
+     geom_point(aes(x = Sepal.Length, y = Sepal.Width, col = Species))
```

* Typical visible aesthetics

|Aesthetic|Description                                 |
|:-------:|:------------------------------------------:|
|X        |X axis position                             |
|y        |Y axis position                             |
|fill     |Fill color                                  |
|color    |Color of points, outlines of other geoms    |
|size     |Area or radius of points, thickness of lines|
|alpha    |Transparency                                |
|linetype |line dash pattern                           |
|labels   |Text on a plot or axes                      |
|shape    |Shape                                       |

## 2.2 Using attributes

```R
> library(ggplot2)
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_point(color = "red")

> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_point(shape = 4)
```

## 2.3 Modifying aesthetics

* Positions : Adjustment for overlapping
	* identity
  * dodge
  * stack
  * fill
  * jitter
  * jitterdodge
  * nudge

* position = "identity" (default)

```R
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point()

> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "identity")
```

* position = "jitter"

```R
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "jitter")

# position_jitter()
> posn_j <- position_jitter(0.1)
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = posn_j)

> posn_j <- position_jitter(0.1, seed = 136)
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = posn_j)
```

* Scale functions

	* `scale_x_*()`, `scale_x_continuous()`
  * `scale_y_*()`
  * `scale_color_*()` or `scale_colour_*()`, `scale_color_discrete()`
  * `scale_fill_*()`
  * `scale_shape_*()`
  * `scale_linetype_*()`
  * `scale_size_*()`

```R
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "jitter") +
+     scale_x_continuous("Sepal Length") +
+     scale_color_discrete("Species")

> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "jitter") +
+     scale_x_continuous("Sepal Length", limits = c(2,8), breaks = seq(2, 8, 3), expand = c(0, 0), labels = c("Setosa", "Versicolor", "Virginica")) +
+     scale_color_discrete("Species")
```

* labs()

```R
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "jitter") +
+     labs(x = "Sepal Length", y = "Sepal Width", color = "Species")
```

## 2.4 Aesthetics best practices

* **Which aesthetics?**

	* Use your creative know-how, and follow some clear guidelines
	* Jacques Bertin
		* The Semiology of Graphics, 1967
	* William Cleveland
		* The Elements of Graphing Data, 1985
		* Visualizing Data, 1993

* **Form follows function**

	* Function 
		* Primary: Accurate and efficient representations
		* Secondary: Visually appealing, beautiful plots

	* Guiding principles
		* Never : 
			* Misrepresent or obscure data
			* Confuse viewers with complexity

		* Always :
			* Consider the audience and purpose of every plot

* **The best choices for aesthetics**

	* Efficient
		* Provides a faster overview than numeric summaries
	
	* Accurate
		* Minimizes information loss

* **Aesthetics - continuous variables**

The scatter plot maps data as position on a common scale.

```R
ggplot(iris, aes(x = Sepal.Length,
				 y = Sepal.Width,
				 color = Species)) +
	geom_point()
```

```R
ggplot(iris, aes(color = Sepal.Length,
                 y = Sepal.Width,
                 x = Species)) +
  geom_point()
```

* **Aesthetics - categorical variables**

Color is often used to good effect for a categorical variables.

```R
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 col = Species)) +
  geom_point()
```

```R
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 col = Species)) +
  geom_point(position = "jitter",
             alpha = 0.5)
```

# 3. Geometries

## 3.1 Scatter plots

* **48 geometries**
          

* **Common plot types**

|Plot type.   |Possible Geoms                       |
|:-----------:|:-----------------------------------:|
|Scatter plots|points, jitter, abline, smooth, count|


* **Scatter plots**

	* Each geom can accept specific aesthetic mappings, e.g. geom_point()
	
	|Essential|Optional                               |
	|:-------:|:-------------------------------------:|
	|x, y.    |alpha, color, fill, shape, size, stroke|

```R
# essential
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width)) +
  geom_point()

# Optional
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 col = Species)) +
  geom_point()
```

* **Geom-specific aesthetic mappings**

```R
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 col = Species)) +
  geom_point()
  
# specify both geom-specific data and aesthetics, control aesthetic mappings of each layer independently
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,)) +
  geom_point(aes(col = Species))
```

```R
head(iris, 3)
>
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
>
library(dplyr)
iris %>%
  group_by(Species) %>%
  summarise_all(mean) -> iris.summary
iris.summary
>
# A tibble: 3 × 5
  Species    Sepal.Length Sepal.Width Petal.Length Petal.Width
  <fct>             <dbl>       <dbl>        <dbl>       <dbl>
1 setosa             5.01        3.43         1.46       0.246
2 versicolor         5.94        2.77         4.26       1.33 
3 virginica          6.59        2.97         5.55       2.03 
>
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 col = Species)) +
  # Inherits both data and aes from ggplot()
  geom_point() +
  # Different data, but inherited aes
  geom_point(data = iris.summary, shape = 15, size = 5)
```

* **Shape attribute values**

```R
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  # Inherits both data and aes from ggplot()
  geom_point() +
  # Different data, but inherited aes
  geom_point(data = iris.summary, shape = 21, size = 5, fill = "black", stroke = 2)
```

* **position = "jitter"**

> `geom_jitter()` : short-cut to `geom_point(position = "jitter")

```R
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point(position = "jitter")

# the same result
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter()
```

* **alpha**

```R
# combine jittering with alpha-blending
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter(alpha = 0.6)
```

* **Hollow circles `shape = 1`**

```R
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter(shape = 1)
```

## 3.2 Histograms

* **Common plot types**

|Plot type    |Possible Geoms                       |
|:-----------:|:-----------------------------------:|
|Scatter plots|points, jitter, abline, smooth, count|
|Bar plots    |histogram, bar, col, errorbar        |
|Line plots   |line, path                           |

* **Histograms**

```R
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram()
```

* A plot of binned values
	* i.e. a statistical function

* `stat_bin()` : a specific statistic
	* The bin argument took the default value of 30
	*  Pick better value with `binwidth`.

* Default of 30 even bins

```R
# Default bin width:
diff(range(iris$Sepal.Width)) / 30
>
[1] 0.08
```

* Intuitive and meaningful bin widths

	* Always set a meaningful bin widths for your data
	* No space between bars
	
```R
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.1)
```

* Re-position tick marks
	* Always set a meaningful bin widths for your data
	* No spaces between bars
	* X axis labels are between bars

```R
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.1, 
                 center = 0.05)
```

* **Different Species**

```R
ggplot(iris, aes(x = Sepal.Width,
                 fill = Species)) +
  geom_histogram(binwidth = 0.1, 
                 center = 0.05)
```

* **Default position is "stack"**

```R
ggplot(iris, aes(x = Sepal.Width,
                 fill = Species)) +
  geom_histogram(binwidth = 0.1, 
                 center = 0.05,
                 position = "stack")
```

* **position = "dodge"**

```R
ggplot(iris, aes(x = Sepal.Width,
                 fill = Species)) +
  geom_histogram(binwidth = 0.1, 
                 center = 0.05,
                 position = "dodge")
```		

* **position = "fill"**

```R
ggplot(iris, aes(x = Sepal.Width,
                 fill = Species)) +
  geom_histogram(binwidth = 0.1, 
                 center = 0.05,
                 position = "fill")
```

## 3.3 Bar plots

* **Bar Plots, with a categorical X-axis**

	* Use `geom_bar()` or `geom_col()`

	|Geom        |Stat      |Action                                       |
	|:----------:|:--------:|:-------------------------------------------:|
	|`geom_bar()`|"count"   |Counts the number of cases at each x position|
	|`geom_col()`|"identity"|Plot actual values                           |

	* All positions from before are available
	* Two types
		* Absolute counts
		* Distributions

* **Bar plot**

```R
str(sleep)
>
'data.frame':	20 obs. of  3 variables:
 $ extra: num  0.7 -1.6 -0.2 -1.2 -0.1 3.4 3.7 0.8 0 2 ...
 $ group: Factor w/ 2 levels "1","2": 1 1 1 1 1 1 1 1 1 1 ...
 $ ID   : Factor w/ 10 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
>
head(sleep)
>
extra group ID
1   0.7     1  1
2  -1.6     1  2
3  -0.2     1  3
4  -1.2     1  4
5  -0.1     1  5
6   3.4     1  6
>
ggplot(sleep, aes(vore)) +
	geom_bar()
```

* **Plotting distributions instead of absolute counts**

```R
iris_summ_long <- iris %>%
  select(Species, Sepal.Width) %>%
  gather(key, value, -Species) %>%
  group_by(Species) %>%
  summarise(avg = mean(value),
            stdev = sd(value))

iris_summ_long
>
# A tibble: 3 × 3
  Species      avg stdev
  <fct>      <dbl> <dbl>
1 setosa      3.43 0.379
2 versicolor  2.77 0.314
3 virginica   2.97 0.322
>
# plotting distributions
ggplot(iris_summ_long, aes(x = Species, 
                           y = avg)) +
  geom_col() +
  geom_errorbar(aes(ymin = avg - stdev, 
                    ymax = avg + stdev),
                width = 0.1)
```

## 3.4 Line plots

* **Basic**

```R
ggplot(beaver, aes(x = time, 
                   y = temp)) +
  geom_line()
```

* **Color each segment**

```R
ggplot(beaver, aes(x = time, 
                   y = temp, 
                   color = factor(active)) +
  geom_line()
```

* **Linetype aesthetic**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 linetype = Species)) +
  geom_line()
```

* **Size aesthetic**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 size = Species)) +
  geom_line()
```

* **Color aesthetic**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 color = Species)) +
  geom_line()
```

* **Aesthetics for categorical variables**

* **Fill aesthetic with geom_area()**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 fill = Species)) +
  geom_area()
```

* **Using position = "fill"**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 fill = Species)) +
  geom_area(position = "fill")
```

* **geom_ribbon()**

```R
ggplot(fish, aes(x = Year,
                 y = Capture,
                 fill = Species)) +
  geom_ribbon(aes(ymax = Capture,
                  ymin = 0),
              alpha = 0.3)
```

# 4. Themes

## 4.1 Themes from scratch

* **The themes layer**

	* All non-data ink
	* Visual elements not part of the data

* **Three types**

|type     |modified using|
|:-------:|:------------:|
|text     |element_text()|
|line     |element_line()|
|rectangle|element_rect()|

* **The text elements**

```R
theme(
text,
  axis.title,
    axis.title.x,
      axis.title.x.top,
      axis.title.x.bottom,
    axis.title.y,
      axis.title.y.left,
      axis.title.y.right,
  title,
    legend.title,
    plot.title,
    plot.subtitle,,
    plot.caption,
    plot.tag,
  axis.text,
    axis.text.x,
      axis.text.x.top,
      axis.text.x.bottom,
    axis.text.y,
      axis.text.y.left,
      axis.text.y.right,
  legend.text,
  strip.text,
    strip.text.x,
    strip.text.y)
```

* **Adjusting theme elements**

```R
ggplot(iris, aes(x = Sepal.Length, 
                 y = Sepal.Width,
                 color = Species)) +
  geom_jitter(alpha = 0.6) +
  theme(axis.title = element_text(color = "blue"))
```

* **Line elements**

```R
theme(
line,
	axis.ticks,
		axis.ticks.x,
			axis.ticks.x.top,
			axis.ticks.x.bottom,
		axis.ticks.y,
			axis.ticks.y.left,
			axis.ticks.y.right,
		axis.line,
			axis.line.x,
				axis.line.x.top,
				axis.line.x.bottom,
			axis.line.y,
				axis.line.y.left,
				axis.line.y.right,
		panel.grid,
			panel.grid.major,
				panel.grid.major.x,
				panel.grid.major.y,
			panel.grid.minor,
				panel.grid.minor.x,
				panel.grid.minor.y)
```

* **Rect elements**

```R
theme(
rect,
	legend.background,
	legend.key,
	legend.box.background,
	panel.background,
	panel.border,
	plot.background,
	strip.background,
		strip.background.x,
		strip.background.y)
```

* **element_blank()**

```R
ggplot(iris, aes(x = Sepal.Length, 
                 y = Sepal.Width,
                 color = Species)) +
  geom_jitter(alpha = 0.6) +
  theme(line = element_blank(),
        rect = element_blank(),
        text = element_blank())
```

## 4.2 Theme flexibility

* **Ways to use themes**

	* From scratch
	* Theme layer object
	* Built-in themes                       
		* ggplot2 or ggthemes packages
	* Built-in themes from other packages
	* Update/Set default theme

* **Defining theme objects**

	* Useful when you have many plots
	* Provides consistency in style
	* Apply a specific theme everywhere

```R
z <- ggplot(iris, aes(x = Sepal.Length, 
                      y = Sepal.Width, 
                      color = Species)) +
  geom_jitter(alpha = 0.6) +
  scale_x_continuous("Sepal Length (cm)", 
                     limits = c(4, 8), 
                     expand = c(0, 0)) +
  scale_y_continuous("Sepal Width (cm)", 
                     limits = c(1.5, 5), 
                     expand = c(0, 0)) +
  scale_color_brewer("Species", 
                     palette = "Dark2", 
                     labels = c("Stetosa", "Versicolor", "Virginica"))

z + theme(text = element_text(family = "serif", size = 14),
          rect = element_blank(),
          panel.grid = element_blank(),
          title = element_text(color = "#8b0000"),
          axis.line = element_line(color = "black"))
```

```R
theme_iris <- theme(text = element_text(family = "serif", size = 14),
                    rect = element_blank(),
                    panel.grid = element_blank(),
                    title = element_text(color = "#8b0000"),
                    axis.line = element_line(color = "black"))
z + theme_iris
```

* **Using built-in themes**

	* `theme_gray()` : the default
	* `theme_classic()` : more traditional
	* `theme_bw()` : useful when you use transparency
	* `theme_void()` : removes everything but the data


* **The ggthemes package**

```R
install.packages("ggthemes")
library(ggthemes)

z + theme_tufte()
```

* **Updating themes**

```R
original <- theme_update(text = element_text(family = "serif", size = 14),
                         rect = element_blank(),
                         panel.grid = element_blank(),
                         title = element_text(color = "#8b0000"),
                         axis.line = element_line(color = "black"))

theme_set(original)
```

## 4.3 Effective explanatory plots












