R Notebook
================

Load the Bob ROSS dataframe from this link
“<https://raw.githubusercontent.com/fivethirtyeight/data/master/bob-ross/elements-by-episode.csv>”.
It contains list of all bob ross episodes with information about what
his painting featured. e.g WINDMILL variable says if the episode paining
contained image of a windmill or not.

Inspect it first in the browser to choose correct arguments for the
`read.table` command. After loading it, inspect it with `str`, `head`
and other commands to make sure you loaded it well.

``` r
df <- read.table("https://raw.githubusercontent.com/fivethirtyeight/data/master/bob-ross/elements-by-episode.csv", sep=",", header = T, stringsAsFactors = F)
str(df)
head(df)
```

What are the table dimensions?

1)  1 column and 404 rows
2)  69 columns and 403 rows
3)  69 columns and 404 rows
4)  403 columns and 69 rows\*

<!-- end list -->

``` r
dim(df)
```

    ## [1] 403  69

What type of variable is the CABIN column? (choose the BEST possibility,
not necessarily what R decided)

1)  logical\*
2)  data.frame
3)  character
4)  list

<!-- end list -->

``` r
class(df$CABIN)
```

    ## [1] "integer"

``` r
df$CABIN[1:10]
```

    ##  [1] 0 1 1 0 0 1 0 0 0 0

How many percent of episoded featured bushes?

1)  23 %
2)  28 %
3)  30 %\*
4)  49 %

<!-- end list -->

``` r
sum(df$BUSHES)/nrow(df)
```

    ## [1] 0.2977667

which of these episodes didn’t feature guest?

1)  “PEACEFUL WATERS”
2)  “WINDING STREAM”\*
3)  “LAKE BY MOUNTAIN”
4)  “MOUNTAINS OF GRACE”

<!-- end list -->

``` r
df[df$GUEST == 1, "TITLE"]
```

    ##  [1] "\"PEACEFUL WATERS\""         "\"WINTER SAWSCAPE\""        
    ##  [3] "\"NORTHWEST MAJESTY\""       "\"MOUNTAIN BLOSSOMS\""      
    ##  [5] "\"OCEAN SUNRISE\""           "\"ANATOMY OF A WAVE\""      
    ##  [7] "\"INDIAN GIRL\""             "\"PORTRAIT OF SALLY\""      
    ##  [9] "\"LAKE BY MOUNTAIN\""        "\"MOUNTAIN RANGE\""         
    ## [11] "\"MOUNTAIN OVAL\""           "\"SURPRISING FALLS\""       
    ## [13] "\"CONTEMPLATIVE LADY\""      "\"THAT TIME OF YEAR\""      
    ## [15] "\"LAKE VIEW\""               "\"MOUNTAIN BEAUTY\""        
    ## [17] "\"ICY LAKE\""                "\"SUMMER IN THE MOUNTAIN\"" 
    ## [19] "\"SUNLIGHT IN THE SHADOWS\"" "\"POT 'O POSIES\""          
    ## [21] "\"MOUNTAINS OF GRACE\""      "\"LAKE AT THE RIDGE\""

Which of these is the least common feature? You can get the `colsums`
and `sort` function

1)  CLIFF
2)  LAKES\*
3)  TREE
4)  FARM

<!-- end list -->

``` r
sort(colSums(df[, 3:69]))[1:10]
```

    ##             LAKES       APPLE_FRAME          BUILDING       DIANE_ANDRE 
    ##                 0                 1                 1                 1 
    ##              DOCK DOUBLE_OVAL_FRAME              FARM              FIRE 
    ##                 1                 1                 1                 1 
    ##     FLORIDA_FRAME HALF_CIRCLE_FRAME 
    ##                 1                 1

How many episodes have TREES and take place in WINTER?

1)  0
2)  9
3)  52
4)  64\*

<!-- end list -->

``` r
sum(df$TREES & df$WINTER)
```

    ## [1] 64

### Correct answers

4, 1, 3, 2, 2, 4
