Joining Data with pandas
========================

# 1. Data Merging Basics

## 1.1 Inner join

```python
wards = pd.read_csv("Ward_Offices.csv")
print(wards.head())
print(wards.shape)

census = pd.read_csv("Ward_Census.csv")
print(wards.head())
print(wards.shape)

wards_census = wards.merge(census, on='ward')
print(wards_census.head(4))
print(wards_census.shape)
print(wards_census.columns)

# suffixes
wards_census = wards.merge(census, on='ward', suffixes=('_ward', '_cen'))
print(wards_census.head(4))
print(wards_census.shape)
```























