Data preparation
================
Lukáš ‘hejtmy’ Hejtmánek
22/07/2019

Donwload dataset about [student alcohol
comsumtion](https://www.kaggle.com/uciml/student-alcohol-consumption/)

# Accessing data frames

Columns are basically just list fields, so can be accessed with `$` or
with a column number

``` r
df_math <- read.table("../../../data/student-alcohol-consumption/student-mat.csv", sep = ",", header=T, stringsAsFactors = F)
df_portugese <- read.table("../../../data/student-alcohol-consumption/student-por.csv", sep = ",", header=T, stringsAsFactors = F)
```

``` r
df_math$school[1]
```

    ## [1] "GP"

Data.frame uses \[row, column\] notation. So you can access first cell
of thrid column as `df[1,3]`. If you want entire columns, you can do it
in multiple ways

``` r
df_math[, 3]
df_math[, "school"]
df_math$school
df_math[, c("school", "age")]
df_math[, c(1,5)]
df_math[, c(1:3, 8:10)]
```

# Merging datasets

Let’s have a loot at the data first

Tasks - do both have same column names? - are there any obvious
differences between the datasets?

## cbind

Cbind allows us to add new variable/columns to existing dataframe. It
expects bound dataframes to have the same number of rows and be ordered
appropriately. IN case, each si ordered differently, we need to bind
them using IDs with `merge`

``` r
df_test <- data.frame(id=1:100, gender=sample(c("M", "F"), 50, replace = T))
df_test_2 <- data.frame(test_result = rnorm(50, 100, 15))
df_all <- cbind(df_test, df_test_2)
colnames(df_all)
```

    ## [1] "id"          "gender"      "test_result"

## rbind

rbind (row bind) allow us to append new rows to a data.frame

``` r
df_test <- data.frame(id=1:100, gender=sample(c("M", "F"), 50, replace = T), test_result = rnorm(50, 100, 15))
nrow(df_test)
```

    ## [1] 100

``` r
df_test_2 <- data.frame(id=101:200, gender=sample(c("M", "F"), 50, replace = T), test_result = rnorm(50, 100, 15))
df_all <- rbind(df_test, df_test_2)
nrow(df_all)
```

    ## [1] 200

Applying on our student data

``` r
df_students <- rbind(df_portugese, df_math)
```

## Removing duplicit data

By combinding these two datasets, we have created multiple logs for
several students who are doing both portugese and math. We can find them
using the duplicated function

``` r
match_columns <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob",
                   "reason","nursery","internet","higher", "famsup", "freetime", "goout", "romantic",
                   "activities", "health", "famrel", "guardian", "traveltime","schoolsup")
sum(duplicated(df_students[, match_columns]))
```

    ## [1] 372

## merge

Merge allows us to match data based on given id

``` r
df_test <- data.frame(id=1:100, gender=sample(c("M", "F"), 50, replace = T))
df_test_2 <- data.frame(id=100:1, test_result = rnorm(50, 100, 15))
head(merge(df_test, df_test_2, by="id"))
```

    ##   id gender test_result
    ## 1  1      F   113.27799
    ## 2  2      M   127.56239
    ## 3  3      M   101.04026
    ## 4  4      M   118.59421
    ## 5  5      F   104.19125
    ## 6  6      F    92.44767

By default merge only produces combination of both datasets, dropping
any rows whcih are not matched in both datasets

``` r
df_students <- merge(df_portugese, df_math, by=match_columns)
print(nrow(df_students))
```

    ## [1] 370

if we want to keep even those which are not found in both we can do
“left join” or “right join”

``` r
df_students <- merge(df_portugese, df_math, by=match_columns, all = T)
print(nrow(df_students))
```

    ## [1] 674

``` r
colnames(df_students)
```

    ##  [1] "school"      "sex"         "age"         "address"     "famsize"    
    ##  [6] "Pstatus"     "Medu"        "Fedu"        "Mjob"        "Fjob"       
    ## [11] "reason"      "nursery"     "internet"    "higher"      "famsup"     
    ## [16] "freetime"    "goout"       "romantic"    "activities"  "health"     
    ## [21] "famrel"      "guardian"    "traveltime"  "schoolsup"   "studytime.x"
    ## [26] "failures.x"  "paid.x"      "Dalc.x"      "Walc.x"      "absences.x" 
    ## [31] "G1.x"        "G2.x"        "G3.x"        "studytime.y" "failures.y" 
    ## [36] "paid.y"      "Dalc.y"      "Walc.y"      "absences.y"  "G1.y"       
    ## [41] "G2.y"        "G3.y"

And if we want to keep things tidy, we can rename the added suffixes

``` r
df_students <- merge(df_portugese, df_math, by=match_columns, all = T, suffixes = c(".portugese", ".math"))
print(nrow(df_students))
```

    ## [1] 674

``` r
colnames(df_students)
```

    ##  [1] "school"              "sex"                 "age"                
    ##  [4] "address"             "famsize"             "Pstatus"            
    ##  [7] "Medu"                "Fedu"                "Mjob"               
    ## [10] "Fjob"                "reason"              "nursery"            
    ## [13] "internet"            "higher"              "famsup"             
    ## [16] "freetime"            "goout"               "romantic"           
    ## [19] "activities"          "health"              "famrel"             
    ## [22] "guardian"            "traveltime"          "schoolsup"          
    ## [25] "studytime.portugese" "failures.portugese"  "paid.portugese"     
    ## [28] "Dalc.portugese"      "Walc.portugese"      "absences.portugese" 
    ## [31] "G1.portugese"        "G2.portugese"        "G3.portugese"       
    ## [34] "studytime.math"      "failures.math"       "paid.math"          
    ## [37] "Dalc.math"           "Walc.math"           "absences.math"      
    ## [40] "G1.math"             "G2.math"             "G3.math"

# Recoding variables

``` r
str(df_students)
```

    ## 'data.frame':    674 obs. of  42 variables:
    ##  $ school             : chr  "GP" "GP" "GP" "GP" ...
    ##  $ sex                : chr  "F" "F" "F" "F" ...
    ##  $ age                : int  15 15 15 15 15 15 15 15 15 15 ...
    ##  $ address            : chr  "R" "R" "R" "R" ...
    ##  $ famsize            : chr  "GT3" "GT3" "GT3" "GT3" ...
    ##  $ Pstatus            : chr  "T" "T" "T" "T" ...
    ##  $ Medu               : int  1 1 1 2 2 3 3 3 2 3 ...
    ##  $ Fedu               : int  1 1 1 2 4 3 4 4 2 1 ...
    ##  $ Mjob               : chr  "at_home" "other" "other" "at_home" ...
    ##  $ Fjob               : chr  "other" "other" "other" "other" ...
    ##  $ reason             : chr  "home" "course" "reputation" "reputation" ...
    ##  $ nursery            : chr  "yes" "yes" "no" "yes" ...
    ##  $ internet           : chr  "yes" "yes" "yes" "no" ...
    ##  $ higher             : chr  "yes" "yes" "yes" "yes" ...
    ##  $ famsup             : chr  "yes" "no" "yes" "yes" ...
    ##  $ freetime           : int  1 5 3 3 3 2 3 2 1 4 ...
    ##  $ goout              : int  2 5 4 1 2 1 2 2 3 2 ...
    ##  $ romantic           : chr  "no" "yes" "yes" "no" ...
    ##  $ activities         : chr  "yes" "yes" "no" "yes" ...
    ##  $ health             : int  1 1 5 2 5 3 5 5 4 3 ...
    ##  $ famrel             : int  3 5 3 4 4 4 4 4 4 4 ...
    ##  $ guardian           : chr  "mother" "mother" "mother" "mother" ...
    ##  $ traveltime         : int  2 3 1 1 1 2 1 2 2 2 ...
    ##  $ schoolsup          : chr  "yes" "no" "yes" "yes" ...
    ##  $ studytime.portugese: int  4 1 2 1 3 3 3 3 2 4 ...
    ##  $ failures.portugese : int  0 1 0 0 0 0 0 0 0 0 ...
    ##  $ paid.portugese     : chr  "yes" "no" "no" "no" ...
    ##  $ Dalc.portugese     : int  1 1 2 1 1 2 1 2 1 2 ...
    ##  $ Walc.portugese     : int  1 1 4 1 1 3 1 2 3 3 ...
    ##  $ absences.portugese : int  4 2 2 8 2 2 2 0 0 6 ...
    ##  $ G1.portugese       : int  13 8 13 14 10 13 11 10 11 15 ...
    ##  $ G2.portugese       : int  13 9 11 13 11 13 12 11 10 15 ...
    ##  $ G3.portugese       : int  13 9 11 12 10 13 12 12 11 15 ...
    ##  $ studytime.math     : int  4 NA 2 1 3 3 3 3 2 4 ...
    ##  $ failures.math      : int  1 NA 2 0 0 2 0 2 0 0 ...
    ##  $ paid.math          : chr  "yes" NA "no" "yes" ...
    ##  $ Dalc.math          : int  1 NA 2 1 1 2 1 2 1 2 ...
    ##  $ Walc.math          : int  1 NA 4 1 1 3 1 2 3 3 ...
    ##  $ absences.math      : int  2 NA 2 8 2 8 2 0 2 12 ...
    ##  $ G1.math            : int  7 NA 8 14 10 10 12 12 8 16 ...
    ##  $ G2.math            : int  10 NA 6 13 9 10 12 0 9 16 ...
    ##  $ G3.math            : int  10 NA 5 13 8 10 11 0 8 16 ...

``` r
#address - student's home address type (binary: 'U' - urban or 'R' - rural)
df_students$address <- dplyr::recode(df_students$address, "R"="rural", "U"="urban")
table(df_students$address)
```

    ## 
    ## rural urban 
    ##   204   470

Tasks - check that all binary columns (nursery, internet …) only contain
binary values and no missing data - recode all binary columns to TRUE
and FALSE

``` r
df_students$famsup <- df_students$famsup == "yes"
df_students$schoolsup <- df_students$schoolsup == "yes"
```

## Using factors

Factors have an advantage over strings of allowing us to order them.
Some of the fields int eh data are more likely to be factors than
numeric values:

``` r
df_students$traveltime  <- factor(df_students$traveltime , levels = 1:4, 
                                  labels = c("<15 min", "15-30 min","30-60 min",">60 min"), ordered = T)
min(df_students$traveltime)
```

    ## [1] <15 min
    ## Levels: <15 min < 15-30 min < 30-60 min < >60 min

Tasks - factor studytime - factor Medu, Fedu

# New variables

Adding new variables is generally easy

``` r
df_test <- data.frame(id=1:100, test_1=rnorm(100,100,15), test_2 = rnorm(100,100,15))
df_test$mean_test <- (df_test$test_1+df_test$test_2)/2
```

Tasks: - create variable large\_family to either true if famsize is GT3
and false if LE3 - Create any\_support variable which is true if either
famsup or schoolsup is true - create variable both\_courses which
indicates if the student is taking both courses - create variable
either\_higher\_ed which is true if either father or mother education is
higher - create variable relationships which is a sum of famrel and a 3
if romantic is yes - create variable total\_failures which is a sum of
math and portugeese failures (because of NA values, you will need
`rowSums` function) - create variable total\_perfomance for math and
portugeese which is a sum of G1-G3

``` r
df_students$large_family <- df_students$famsize == "GT3"
df_students$any_support <- df_students$famsup | df_students$schoolsup
df_students$relationships <- df_students$famrel + 3*(df_students$romantic == "yes")
df_students$total_failures <- rowSums(df_students[,c("failures.portugese", "failures.math")], na.rm = T)
df_students$both_courses <- !(is.na(df_students$studytime.math) | is.na(df_students$studytime.portugese))
#df_students$parent_higher_ed <- df_students$
```

# Saving the data

saving of pure data is done with the write.table function

important arguments are: - sep - row.names - col.names - dec

RECOMMENDATION: DON’T save row names, use “;” as a separator

``` r
#write.table(df_students, "students-preprocessed.txt", sep=";", row.names = F)
```
