# flysleep

Analyze fly sleep based on DAM (Drosophila Activity Monitor) data using R.

## Installation

```r
install.packages("devtools")
library("devtools")
devtools::install_github("ueno-tr/flysleep", force=TRUE)
```

## Sample Data
https://dl.dropboxusercontent.com/u/14848009/testDAM.zip

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
