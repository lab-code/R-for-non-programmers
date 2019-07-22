Vectors and vector subsetting
================
Lukáš ‘hejtmy’ Hejtmánek
21/07/2019

# vectors

Basically anything in R is a vector. IN other languages, these may be
called arrays (jacascript/c\#) or lists(python). You can get length of a
vector

``` r
num <- 1
length(num)
```

    ## [1] 1

``` r
length("hello")
```

    ## [1] 1

## Creating vectors

Most commonly you are going to be creating vectors by reading in data,
but here are few important functions to generate your own dataset.

``` r
vec <- c(1,2,3,4,5,6,7,8,9)
vec <- seq(1, 9, 1)
vec <- rep(1, 10)
vec <- 1:9
vec2 <- 10:19
vec_complete <- c(vec, vec2)
```

Tasks

  - Create vector of 5 cities called cities with 5 EU capitals. It must
    include Prague
  - Create vector temperatures of human temperature from 36.3 to 40.5
    with 0.1 steps
  - create vector roulette\_numbers with numbers from 0 to 36
  - Create vector called roulette\_colors with “green” and then 18 times
    “red” and “black”
  - create vector called weekdays with each day of the week
  - create vector called weekdays\_10 which is days in 10 weeks
    consecutively
  - Crete vector of odd numbers call odd\_numbers with numbers from 1 to
    99
  - Create vector of length 100 called true\_false (T, F, T, F, T, F, T,
    F …)

<!-- end list -->

``` r
cities <- c("Prague", "Madrid", "London", "Berlin", "Rome")
temperatures <- seq(36.3,40.5,0.1)
roulette_numbers <- 0:36
roulette_colors <- c("green", rep(c("red", "black"), 18))
weekdays <- c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday")
weekdays_10 <- rep(weekdays, 10)
```

### Randomizing

``` r
sample(1:10, 10)
```

    ##  [1]  2  3  4  8  7 10  1  5  6  9

``` r
sample(1:10, 10, replace=T)
```

    ##  [1] 4 1 3 7 6 9 2 7 9 6

Tasks - sample temperature of 5 people - sample 10 roulette numbers
properly

``` r
set.seed(1)
sample(1:10, 1)
```

    ## [1] 9

seeding

Tasks - set seed to 666 - sample temeprature of 10 people and save to
subject\_temperature - sample 10 roulette numbers and save to
roulette\_turns

``` r
set.seed(666)
subject_temperature <- sample(temperatures, 10, replace = T)
roulette_turns <- sample(roulette_numbers, 10, replace = T)
```

## Accessing vectors

### Indexing by number

R has 1 based indexing, meaning the first position in a vector has

``` r
vec <- 1:9
vec[1]
```

    ## [1] 1

``` r
vec[5]
```

    ## [1] 5

``` r
vec[vec[2]]
```

    ## [1] 2

``` r
vec[-5]
```

    ## [1] 1 2 3 4 6 7 8 9

``` r
vec[-c(1:4)]
```

    ## [1] 5 6 7 8 9

Tasks - select monday from the weekdays vector - select all mondays from
teh weekdays\_10 - select prague from the cities vector - select all
false from the true\_false vector - select all "black numbers from the
roulette numbers - what colours did we draw in roulette turns?

### Indexing by Logical

``` r
vec_bool <- c(T,T,F,F,T,T)
vec_num <- 1:6
vec_num[vec_bool]
```

    ## [1] 1 2 5 6

R automatically repeats vectors if you run out of them

``` r
bool <- c(TRUE, FALSE)
vec <- 1:100
vec[bool]
```

    ##  [1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45
    ## [24] 47 49 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83 85 87 89 91
    ## [47] 93 95 97 99

``` r
vec[FALSE]
```

    ## integer(0)

Taks - use the true\_false vector to create the odd\_numbers vector -
select every other day in the weekdays\_10 vector

### Indexing by condition

`Which` function

``` r
which(cities == "Prague")
```

    ## [1] 1

``` r
i_prague <- which(cities == "Prague")
cities[i_prague]
```

    ## [1] "Prague"

``` r
cities[-i_prague]
```

    ## [1] "Madrid" "London" "Berlin" "Rome"

``` r
cities[cities != "Prague"]
```

    ## [1] "Madrid" "London" "Berlin" "Rome"

`%in` function

``` r
fav_cities <- c("Prague", "London")
which(cities %in% fav_cities)
```

    ## [1] 1 3

Task - what are indices of “monday” in your weekdays\_10 vector? - what
are indices of either weekend day in your weekdays\_10 vector? - what
are indices of “black” in your roulettes\_colors vector?

## Selecting by condition

Most common and easiest to read

``` r
temp_above_37 <- temperatures > 37
temperatures[temp_above_37]
```

    ##  [1] 37.1 37.2 37.3 37.4 37.5 37.6 37.7 37.8 37.9 38.0 38.1 38.2 38.3 38.4
    ## [15] 38.5 38.6 38.7 38.8 38.9 39.0 39.1 39.2 39.3 39.4 39.5 39.6 39.7 39.8
    ## [29] 39.9 40.0 40.1 40.2 40.3 40.4 40.5

``` r
temperatures[temperatures > 37]
```

    ##  [1] 37.1 37.2 37.3 37.4 37.5 37.6 37.7 37.8 37.9 38.0 38.1 38.2 38.3 38.4
    ## [15] 38.5 38.6 38.7 38.8 38.9 39.0 39.1 39.2 39.3 39.4 39.5 39.6 39.7 39.8
    ## [29] 39.9 40.0 40.1 40.2 40.3 40.4 40.5

Tasks - how many possible temperatures are above 37.5C? -

## Vector functions

### Vector math

Adding vectors togehter

Tasks

Most R functions work on vectors

``` r
vec <- 1:100

mean(vec)
```

    ## [1] 50.5

``` r
median(vec)
```

    ## [1] 50.5

``` r
summary(vec)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   25.75   50.50   50.50   75.25  100.00

``` r
table(weekdays_10)
```

    ## weekdays_10
    ##    friday    monday  saturday    sunday  thursday   tuesday wednesday 
    ##        10        10        10        10        10        10        10

tasks - what is the mean and median temeprature of people in the

# Final exam

Each of these should be written in code on a single line

1.  Create a vector of years between 1924 until 2019 by one year
2.  Create a vector of chinese zodiac for each year, beginning with rat,
    repeating 10 times (120 years)
3.  What years are for “horse”?
4.  What sign was year 1987?
5.  What is the sum of years for the “rooster”?
6.  What is the median year for the “dragon”
7.  What is the 3rd\_year of a goat modulo 7?

<!-- end list -->

``` r
signs <- rep(c("rat", "ox", "tiger", "rabbit", "dragon", "snake", "horse", "goat", "monkey", "rooster", "dog", "pig"), 10)
years <- 1924:2019
i_years <- years - 1923

years[i_years[signs=="horse"]] #1
```

    ##  [1] 1930 1942 1954 1966 1978 1990 2002 2014   NA   NA

``` r
signs[years==1987] #2
```

    ## [1] "rabbit"

``` r
sum(years[i_years[signs=="rooster"]], na.rm=T)
```

    ## [1] 15800

``` r
median(years[i_years[signs=="dragon"]], na.rm=T)
```

    ## [1] 1970

``` r
years[i_years[signs=="goat"]][3] %% 7
```

    ## [1] 2
