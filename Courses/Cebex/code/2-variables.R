a <- 3
# create data frame cars
df_cars <- data.frame(name=character(0), cylinders=numeric(0), mpg=numeric(0))

# sets removing participants above 4 years old
const_remove <- 4

# install.packages("ggplot2")
# my age before summer
mabs <- 29.5

# Capitalization -----
number <- 5
Number <- 4

OUTLIER_EXCLUSION <- 5

# NUmeric ----
my_age <- 29.5
class(my_age)

# Character ----
my_name <- "Lukas"
class(my_name)


# Logical ---
long_hair <- TRUE 
class(long_hair)
long_hair <- "TRUE"

short_hair <- FALSE


# List ---

person <- list()
person$name <- my_name
person$age <- my_age
person$long_hair <- T
person <- list(name=my_name, age=my_age, long_hair=T)

# SPECIAL ----
missing <- NA
missing_differently <- NULL

is.na(missing)
is.null(missing)
is.null(missing_differently)

# Checking contents ----
is.numeric(person$age)
is.logical(T)
is.character("hello")
is.list(person)

# Converting ----
number <- "5"
class(number)
# number * 5 - throws error
as.numeric(number) * 5
number <- as.numeric(number)
number * 5

paste("hello", "class")
paste("number is", number)

number
T + T + T


# Comparing -----
number1 <- 5
number2 <- 4

number1 > number2
number1 = number2
number1 == number2

# reassigning because I messed up
number1 <- 5
number2 <- 4
number3 <- 3

number3 > number1 > number2
(number3 > number1 & number1 > number2) | number3 == number1
number3 > number1 | number1 > number2

number3 > number1 && number1 > number2
number3 > number1 || number1 > number2

number1 == number2
number1 != number2

!TRUE
!FALSE
