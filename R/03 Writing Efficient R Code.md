Writing Efficient R Code
------------------------

# 1. The Art of Benchmarking

## 1.1 R Version

```R
# print the R version details using version
> version
               _                           
platform       x86_64-apple-darwin17.0     
arch           x86_64                      
os             darwin17.0                  
system         x86_64, darwin17.0          
status                                     
major          4                           
minor          1.0                         
year           2021                        
month          05                          
day            18                          
svn rev        80317                       
language       R                           
version.string R version 4.1.0 (2021-05-18)
nickname       Camp Pontanezen             

# assign the variable major to the major component
> major <- version$major
> major
[1] "4"

# extract the component using $ sign
> version$platform
[1] "x86_64-apple-darwin17.0"
```










