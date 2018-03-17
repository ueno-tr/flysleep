# flysleep

Analyze fly sleep based on DAM (Drosophila Activity Monitor) data using R.

## Installation (Run as an Admin)

```r
install.packages("devtools")
library("devtools")
devtools::install_github("ueno-tr/flysleep", force=TRUE)
```

## Sample Data
https://drive.google.com/open?id=0B5fskUMfMyPJTGZLb2s0YjV5Z28

## Usage

###Analyze and output fly sleep
```r
library(flysleep)
x <- DAMsleep1()
```
###Sleep graph 3 days
```r
DAMsleep2(x)
```

###Sleep graph 1 day each (exclude 1 of 3 days) to compare LD, LL, DD conditions etc.
```r
DAMsleep3(x, 1-3)
```
###Delta sleep graph for sleep deprivation
```r
SDgraph(x)
```
