library(ggplot2)

source("data/loader.R")
df_movies <- data_hejtmy_movies_preprocessed()
# lets control what we have
head(df_movies)

# QUESTIONS!

## Subsetting - selectioning
# what is the first movie that I rated?

#what is the olders movie that I rated
min(df_movies$Date.Rated)
i <- which.min(df_movies$Date.Rated)
df_movies[i,]

# WHat is the most watched movie that I rated?
max(df_movies$Num.Votes)
ormax <- order(-df_movies$Num.Votes)
df_movies[ormax, "Title"]
df_movies[df_movies$You.rated > 7, ]

# What are my favorite movies?
head(df_movies[order(-df_movies$You.rated), ], 10)

df_movies[df_movies$Your.Rating == 10, "Title"]

# WHat movies did I not agree with the rest of the world on?
View(head(df_movies[order(df_movies$You.rated - df_movies$IMDb.Rating),], 10))

## Descrptive statistics
#what is a mean rating I gave?

# Graph a histogram of my ratings
hist(df_movies$Your.Rating)
ggplot(df_movies, aes(Your.Rating)) + geom_histogram(bins = 10)
# Graph a histogram for my ratings only for movies before 2000.
ggplot(df_movies[df_movies$Year > 2000, ], aes(Your.Rating)) + geom_histogram(bins = 10)

df_movies$above2000 <- df_movies$Year > 2000

ggplot(df_movies, aes(Your.Rating, fill = above2000)) + geom_histogram(bins = 10)

# Let's get complex!
# What 

summary(df_movies)

# WHAT movies have rating above 7
df_movies$Title[df_movies$Your.Rating == 10]
df_movies$Title[df_movies$Your.Rating  >= 7 & df_movies$Your.Rating <= 9]
df_movies$Title[df_movies$Your.Rating  <= 3 | df_movies$Your.Rating >= 8]
hist(df_movies$Your.Rating)
df_movies$after_2000 <- df_movies$Year > 2000
t.test(df_movies$You.rated ~ df_movies$after_2000)
