immunarch — Fast and Seamless Exploration of Single-cell and Bulk T-cell/Antibody Immune Repertoires in R
=========================================================================================================

# 1. Installation

```R
install.packages("immunarch")
```

# 2. Prepare immunarch data

## 2.1 Convert data to immunarch format

```R
# list all files in folder
temp = list.files(pattern="*.txt")
temp

# change colname to immunarch format
for (i in 1:length(temp)) {
  
  df <- as.data.frame(read.table(temp[i], header=T, sep="\t"))
  
  df <- df[ , 1:10]
  
  names(df) <- c("Clones", "Proportion", "CDR3.nt", "CDR3.aa", "V.name", "D.name", "J.name", "D.start",	"D.end",	"J.start")

  filename <- paste(temp[i], "_immunarch.txt", sep = "")
  write.table(df, filename, sep = "\t", row.names = F, col.names = T, quote = FALSE)
  
}
```

## 2.2 Load immunarch and data

```R
library(immunarch)

file_path = getwd()

immdata <- repLoad(file_path)
```

# 3. Gene usage analysis














