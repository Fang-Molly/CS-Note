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
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], marker="o")

# triangles pointing downwards marker: lower-case letter "v"
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], marker="v")
```

* **Setting the linestyle**

```python
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], marker="v", linestyle="--")
```








































