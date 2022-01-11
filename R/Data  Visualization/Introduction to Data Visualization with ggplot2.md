Introduction to Data Visualization with ggplot2
===============================================

# 1. Introduction

## 1.1 Introduction

* Data visualization & data science  

* Exploratory versus  

* `MASS::mammals`

```
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

```
> mammals <- MASS::mammals
> ggplot(mammals, aes(x = body, y = brain)) +
+     geom_point()
```

* Explore with a linear model

```
ggplot(mammals, aes(x = body, y = brain)) +
+     geom_point(alpha = 0.6) +
+     stat_smooth(
+         method = "lm",
+         color = "red",
+         se = FALSE
+     )
```

* Explore: fine-tuning

```
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

```
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

```
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

```
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_point()
```

* Mapping onto color

> Species: a dataframe column, is mapped onto color, a visible aesthetic.

```
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point()
```

* Mapping onto the color aesthetic in geom

```
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

```
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

```
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point()

> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "identity")
```

* position = "jitter"

```
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

```
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

```
> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
+     geom_point(position = "jitter") +
+     labs(x = "Sepal Length", y = "Sepal Width", color = "Species")
```

## 2.4 Aesthetics best practices




# 3. Geometries

## 3.1 Scatter plots




## 3.2 Histograms




## 3.3 Bar plots



## 3.4 Line plots




# 4. Themes

## 4.1 Themes from legend



## 4.2 Theme flexibility



## 4.3 Effective explanatory plots









