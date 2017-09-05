# flysleep

Analyze fly sleep based on DAM (Drosophila Activity Monitor) data using R.

## Installation (Run as an Admin)

```r
install.packages("devtools")
library("devtools")
devtools::install_github("ueno-tr/flysleep", force=TRUE)
```

## Sample Data
https://drive.google.com/open?id=0B95gzTDviXuGZGtzRUJVTTV2ZjQ

## Usage

###Analyze and output fly sleep
```r
library(flysleep)
x <- DAMsleep1()
```
###Sleep graph
```r
DAMsleep2(x)
```
