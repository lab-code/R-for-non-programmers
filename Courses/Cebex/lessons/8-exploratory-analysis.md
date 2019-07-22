Exploratory analysis and dplyr
================
Lukáš ‘hejtmy’ Hejtmánek
22/07/2019

``` r
df <- read.csv("../../../data/student-alcohol-consumption/school-preprocessed.csv", sep = ";")
```

## Subsetting data.frames

``` r
df[1, ]
df[df$sex == "F",]
df[df$large_family, ]
table(df[df$any_support, "address"])
table(df[!df$any_support,]$address)
```

Tasks: - what is the mean total\_perfomance for rural vs urban groups? -
what is the mean health for men - what is the frequency of
parent\_higher\_ed and higher?

## Descriptive stats easier

``` r
library(psych)
```

``` r
describe(df$age)
```

    ##    vars   n  mean   sd median trimmed  mad min max range skew kurtosis
    ## X1    1 674 16.81 1.26     17   16.75 1.48  15  22     7 0.42    -0.04
    ##      se
    ## X1 0.05

``` r
describeBy(df$health, df$address)
```

    ## 
    ##  Descriptive statistics by group 
    ## group: rural
    ##    vars   n mean   sd median trimmed  mad min max range  skew kurtosis  se
    ## X1    1 204 3.54 1.42      4    3.68 1.48   1   5     4 -0.49    -1.12 0.1
    ## -------------------------------------------------------- 
    ## group: urban
    ##    vars   n mean   sd median trimmed  mad min max range  skew kurtosis
    ## X1    1 470 3.53 1.44      4    3.66 1.48   1   5     4 -0.49    -1.12
    ##      se
    ## X1 0.07

## plotting

# Dplyr syntax

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

## select

``` r
select(df, address)
select(df, address, famsize, Mjob)
```

## filter

``` r
filter(df, address=='rural', freetime > 2)
filter(df, schoolsup, famsize == "GT3" | goout < 3)
```

## summarize

``` r
summarize(df, avg=mean(health), sd=sd(health))
```

    ##        avg      sd
    ## 1 3.532641 1.43496

## %\>%

Pipe operator allows us to chain commands

``` r
df %>% filter(address=='rural') %>% select(health, activities, guardian) %>% head()
```

    ##   health activities guardian
    ## 1      1        yes   mother
    ## 2      1        yes   mother
    ## 3      5         no   mother
    ## 4      2        yes   mother
    ## 5      5        yes   mother
    ## 6      3        yes    other

## group\_by

``` r
df %>% group_by(address) %>% summarize(avg=mean(health), sd=sd(health))
```

    ## # A tibble: 2 x 3
    ##   address   avg    sd
    ##   <fct>   <dbl> <dbl>
    ## 1 rural    3.54  1.42
    ## 2 urban    3.53  1.44

## Tasks

# Graphing and stats

## Using dplyr to plot data
