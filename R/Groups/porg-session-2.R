num <- 10
num2 <- num *2
class(num)

name <- "Lukáš"
class(name)

smoker <- TRUE
class(smoker)
smoker == T
num > 5

names <- c("tereza", "Eliska", "Marian")
names <- c(names, name)
length(names)

 
names_of_my_friends <- names
names_of_my_friends == names

names <- c(5, names)
names[1]*5
as.numeric(names[2])*5
names == "Eliska"

## Working with vectors

## Creating ID
id <- c()
for(i in 1:20){
  id <-c(id, paste0("smoke", i))
}

## Randomizing number or sleep hours
set.seed(999)
sleep <- sample(6:12, 20, replace=T)
## Creatng smoking non smoking 
smoking <- rep(c(T,F), 10)
length(sleep)
length(id)
length(smoking)

hist(sleep)
mean(sleep)
sd(sleep)

### Subsetting vectors
i_smoking <- which(smoking ==T)
sleep[i_smoking]

i_sleep_10 <- sleep > 10
smoking[i_sleep_10]

sleep_smoker <- sleep[which(smoking==T)]
sleep_nonsmoker <- sleep[which(smoking == F)]

t.test(sleep_smoker, sleep_nonsmoker)

sleep[which(smoking)]
sleep[smoking]
smoking
sleep

### Working with tables
source("data/loader.R")
df_movies <- data_hejtmy_movies_preprocessed()
df_movies <- read.table("movies.csv", header=T,sep = ";", stringsAsFactors = F)

head(df_movies, 3)
str(df_movies)

df_movies$Year >= 2010
df_movies$Your.Rating[df_movies$Year >= 2010]
mean(df_movies$Your.Rating[df_movies$Year > 2010])
hist(df_movies$Your.Rating[df_movies$Year > 2010])
t.test()