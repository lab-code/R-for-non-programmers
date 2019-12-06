iq <- c(95, 96? 97, 98, 99)
iq <- 95:105
seq(95, 105, 1)
?seq
seq(95, 105, 1, 0, 9, 11)
seq(to = 105, from = 95, by = 1)
seq(from)

## 
?read.table
df <- read.table("data/hejtmy-ratings.csv", header = TRUE, sep = ",", 
           stringsAsFactors = FALSE)
readLines("data/hejtmy-ratings.csv", 4)

## sample
?sample

iq_possible <- 80:120
set.seed(2122019)
iq <- sample(iq_possible, 50, replace = TRUE)
likes_icecream <- sample(c(rep(F, 45), rep(T, 55)), 50, replace = TRUE)
iq <- rnorm(50, 100, 15)

df <- data.frame(ice = likes_icecream, iq = iq, stringsAsFactors = FALSE)

## Decriptives
table(df$ice) #how many people are in each group
mean(df$iq) #average iq
median(df$iq)
sd(df$iq)

summary(df)

head(df, 5)

hist(df$iq, breaks = 15)
