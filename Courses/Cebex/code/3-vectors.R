num <- 1
length(num)

length("hello")

numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
length(numbers)

error_vector <- c(1, 3, T, 1)
error_vector <- c(1, 3, "5", 1)

# Creating vectors -----
numbers <- seq(from=1, to=9, by=1)
numbers <- seq(1, 9, 1)
numbers <- seq(to=9)
numbers <- 1:9

ten_ones <- rep(...........)
numbers2 <- 10:19

numbers_all <- c(numbers, numbers2)


# Vector creation
cities <- c("London", "Paris", "Prague", "Berlin", "Oslo") #5 cities in EU, capital first letter
temperatures <- seq(36.3, 40.5, 0.1) #human temperatures form 36.3 - 40.5, with 0.1 increments
roulette_numbers <- 0:36 #0-36
red_black <- rep(c("red", "black"), 18)
roulette_colors <- c("green", red_black)#green, and then red and black until 36
weekdays <- c("monday","tuesday", "wednesday", "thursday", "friday", 
              "saturday", "sunday") #days of the week, lowercase
weekdays_10 <- rep(weekdays, 10) #10 weeks of days
odd_numbers <- seq(from=1, to=99, by=2)#numbers from 1-99
true_false <- rep(c(T, F), 50)#T, F, T, F 50 times (100 long)

# Sampling ----
random_100 <- sample(1:100, 100)
random_city <- sample(cities, 1)

set.seed(2019)
sample(1:100, 20)

# Math problems with vectors
set.seed(2019)
years <- 1950:2019
years <- years - 1950
height <- sample(160:180, 50, replace = T)
weight <- sample(50:80, 50, replace = T)
height_m <- height/100
bmi <- weight/(height_m^2)
hist(bmi)

# Vectors -----
mean(height_m)
median(height_m)
sd(height_m)
var(height_m)
range(height_m)
min(height_m)
max(height_m)
summary(height_m)
table(roulette_colors)
summary(weekdays_10)
table(weekdays_10)

# Vector subsetting -----
roulette_colors[17]
roulette_colors[17:20]
set.seed(1)
rand_number <- sample(roulette_numbers, 1)
roulette_colors[rand_number+1]
sample(roulette_numbers, 1)

roulette_colors[sample(roulette_numbers, 1)+1]

table(roulette_colors[-(1:2)])
i_below_37 <- which(temperatures < 37)
temperatures[i_below_37]
temperatures[which(temperatures < 37)]

weekdays_10[which(weekdays_10 == "monday")]

weekdays_10[weekdays_10 == "monday"]
is_monday <- weekdays_10 == "monday"
weekdays_10[is_monday]
weekdays_10[!is_monday]

roulette_colors[roulette_colors == "red"]

# Final exam ----
years <- 1924:2019 #1924 - 2019
#zodiac signs starting with "rat", repeated 10 times
signs <- rep(c("rat", "ox", "tiger", "rabbit", "dragon", "snake",
               "horse", "goat", "monkey", "rooster", "dog", "pig"), 10)

# Questions
#1. What years are horse years?
years[signs == "horse"]
#2. what sign was in 1987?
signs[years == 1987]
#3. What is the sum of the rooster years?
sum(years[signs == "rooster"], na.rm = T)
rooster_years <- years[signs == "rooster"]
sum(rooster_years[!is.na(rooster_years)])
#4. What is thhe median dragon year?
median(years[signs == "dragon"], na.rm = T)
#5. What is the 3rd goat year?
goat_years <- years[signs == "goat"]
goat_years[3]
years[signs == "goat"][3]

