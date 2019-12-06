iq_results <- c(101, 104, 110, 87, 74, 130)

iq_result_new <- 5

length(iq_results)
lenght(iq_result_new)

(iq_results - 100)/15

log(iq_results)

abs((iq_results - 100)/-15)
is <- 6
smoker <- 5
is-smoker
# is-smoker <- FALSE
my_favorite_#_is <- "keepinitreal"
my_favorite_ <- TRUE
my_favorite_#_is <- "keepinitreal"

# Cheating it for the reviewer
# iq_results <- iq_results + 6

iq_results

participant_iq <- 123
participant_1_iq <- 123
participant_ <- 127


## Characters -----
my_favorite_hashtag <- "keepinitreal"
class(my_favorite_hashtag)
class(iq_result_new)
class(iq_results)

love_icecream <- TRUE 
class(love_icecream)
TRUE <- 5
FALSE
T <- 5
is_smoker <- TRUE
is_smoker == T
is_smoker == TRUE
remove(T)
is_smoker == T

TRUE + FALSE
TRUE + TRUE

is_smoker <- c(T, T, T, F, F, T, F, T, F, F, T, T)
sum(is_smoker)
# how many people in the dataset - sum(is_smoker)
length(is_smoker) - sum(is_smoker)

iq_results <- c(iq_results, iq_results)
length(iq_results)

## WORKING with logicals
is_smoker
!is_smoker

sum(!is_smoker)
sum(iq_results >= 104)

sum(iq_results == 104)

## Lists 
person <- list(name = "Lukas", age = 30)
smoking_data <- list(is_smoker = is_smoker, iq = iq_results)

## Conversions
num_wrong <- "5"
class(num_wrong)
is.numeric(num_wrong)
as.numeric(num_wrong)
is.numeric(as.numeric(num_wrong))

smoking <- c(0, 0, 1, 0, 1, 0)
as.logical(smoking)

num_s <- as.numeric("S")
is.na(num_s)
as.numeric("five")

NA
NULL

genders <- c("m", "f", "", "m", "f", "f")
iq_results <- c(100, 105, 90, 104, 98, 120)
t.test(iq_results ~ genders)

as.data.frame(smoking_data)

## Factors
colors <- c("green", "red", "red", "blue")
as.numeric(as.factor(colors))
