Loading data
================
Lukáš ‘hejtmy’ Hejtmánek
22/07/2019

# Getting and setting folders

All loading and saving is going to be relative to your current “working
directory”. You can get working directory by `getwd()` and set it by
`setwd('path to new')`

``` r
#getwd()
#setwd
```

# Loading dataset without any issues

Just check that you have correct separator and it should be fine

``` r
df <- read.table("../../../data/loading-examples/example-row.txt", sep=";", header=T)
head(df, 2)
```

    ##   id favorite_color gender   height   salary hours_slept
    ## 1  1         yellow female 155.2932 26614.42           9
    ## 2  2          green female 151.3450 30403.00           6

``` r
str(df)
```

    ## 'data.frame':    100 obs. of  6 variables:
    ##  $ id            : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ favorite_color: Factor w/ 4 levels "blue","green",..: 4 2 1 4 3 1 2 3 2 4 ...
    ##  $ gender        : Factor w/ 2 levels "female","male": 1 1 1 1 2 2 2 2 1 1 ...
    ##  $ height        : num  155 151 169 170 153 ...
    ##  $ salary        : num  26614 30403 28939 26351 33379 ...
    ##  $ hours_slept   : int  9 6 8 10 8 10 5 7 9 8 ...

## Checking that everything is fine

``` r
head(df, 3)
```

    ##   id favorite_color gender   height   salary hours_slept
    ## 1  1         yellow female 155.2932 26614.42           9
    ## 2  2          green female 151.3450 30403.00           6
    ## 3  3           blue female 168.7019 28939.36           8

``` r
tail(df, 3)
```

    ##      id favorite_color gender   height   salary hours_slept
    ## 98   98          green   male 176.5291 34500.61           8
    ## 99   99         yellow   male 156.3720 26115.96          11
    ## 100 100           blue   male 179.6695 29446.59           5

``` r
summary(df)
```

    ##        id         favorite_color    gender       height     
    ##  Min.   :  1.00   blue  :22      female:45   Min.   :142.2  
    ##  1st Qu.: 25.75   green :23      male  :55   1st Qu.:163.5  
    ##  Median : 50.50   red   :30                  Median :171.4  
    ##  Mean   : 50.50   yellow:25                  Mean   :170.2  
    ##  3rd Qu.: 75.25                              3rd Qu.:177.5  
    ##  Max.   :100.00                              Max.   :191.9  
    ##      salary       hours_slept
    ##  Min.   :16140   Min.   : 5  
    ##  1st Qu.:25312   1st Qu.: 6  
    ##  Median :27871   Median : 8  
    ##  Mean   :28206   Mean   : 8  
    ##  3rd Qu.:32037   3rd Qu.:10  
    ##  Max.   :38090   Max.   :11

``` r
str(df)
```

    ## 'data.frame':    100 obs. of  6 variables:
    ##  $ id            : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ favorite_color: Factor w/ 4 levels "blue","green",..: 4 2 1 4 3 1 2 3 2 4 ...
    ##  $ gender        : Factor w/ 2 levels "female","male": 1 1 1 1 2 2 2 2 1 1 ...
    ##  $ height        : num  155 151 169 170 153 ...
    ##  $ salary        : num  26614 30403 28939 26351 33379 ...
    ##  $ hours_slept   : int  9 6 8 10 8 10 5 7 9 8 ...

If you wanna view or edit the contents, you can use Rstudios `View(df)`
function (capital V) or `edit(df)`. If you want to save edited df, don’t
forget to use `df <- edit(df)`

You can use `edit` to even create data.frames.

``` r
mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
#mydata <- edit(mydata)
```

## Loading options

separator header decimal-point encoding

### Strings vs factors

Factors are integers with character labels

``` r
levels(df$favorite_color)
```

    ## [1] "blue"   "green"  "red"    "yellow"

``` r
as.numeric(df$favorite_color[1:10])
```

    ##  [1] 4 2 1 4 3 1 2 3 2 4

``` r
as.character(df$favorite_color[1:10])
```

    ##  [1] "yellow" "green"  "blue"   "yellow" "red"    "blue"   "green" 
    ##  [8] "red"    "green"  "yellow"

if you don’t wan’t that conversion by default, you can load the table
with `stringsAsFactors = FALSE` or you can convert them later with
`as.character`.

[More on the diferences
here](https://swcarpentry.github.io/r-novice-inflammation/12-supp-factors/)

# Loading data from other sources

## Web

``` r
df <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/cebex/data/loading-examples/example-row.txt", sep=";", header=T)
head(df, 2)
```

    ##   id favorite_color gender   height   salary hours_slept
    ## 1  1         yellow female 155.2932 26614.42           9
    ## 2  2          green female 151.3450 30403.00           6

more on direct loading from the web
[www.r-bloggers.com/getting-data-from-an-online-source](https://www.r-bloggers.com/getting-data-from-an-online-source/)

## Reading excel

``` r
#install.packages("readxl)
df <- readxl::read_xlsx("../../../data/loading-examples/data.xlsx", sheet="Sheet2")
head(df, 2)
```

    ## # A tibble: 2 x 6
    ##      id favorite_color gender height salary hours_slept
    ##   <dbl> <chr>          <chr>   <dbl>  <dbl>       <dbl>
    ## 1     1 yellow         female   155. 26614.           9
    ## 2     2 green          female   151. 30403.           6

# Loading different datasets with different headers/commas/issues

``` r
list.files("../../../data/loading-examples/")
```

    ## [1] "data.xlsx"                "example-dec.txt"         
    ## [3] "example-error.txt"        "example-missing.txt"     
    ## [5] "example-no-header.txt"    "example-no-row.txt"      
    ## [7] "example-row.txt"          "example-sep.txt"         
    ## [9] "example-weird-header.txt"

### Final exam

  - read in all files from the loading-examples dataset into table df
  - check that you load it well by running the following code

<!-- end list -->

``` r
df_correct <- read.table("../../../data/loading-examples/example-row.txt", sep=";", header=T)
all(sapply(df, class)==c("integer","factor","factor","numeric","numeric","integer"))
```

    ## [1] FALSE

``` r
all(df==df_correct)
```

    ## [1] TRUE

[Complete tutorial on getting data into
R](https://www.datacamp.com/community/tutorials/r-data-import-tutorial)
