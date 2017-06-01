library(ggplot2)

df_movies = read.table("../data/hejtmy-ratings.csv", header = T, sep = ",")

# lets control what we have
head(df_movies)

# QUESTIONS!

## Subsetting - selectioning
# what is the first movie that I rated?
class(df_movies$created)

# WHat is the most watched movie that I rated?
max(df_movies$Num.Votes)
df_movies[order(-df_movies$Num.Votes), ][1, ]

# What is the oldes movie I rated?


# What are my favorite movies?
head(df_movies[order(-df_movies$You.rated), ], 10)

# WHat movies did I not agree with the rest of the world on?
View(head(df_movies[order(df_movies$You.rated - df_movies$IMDb.Rating),], 10))

## Descrptive statistics
#what is a mean rating I gave?

# Graph a histogram of my ratings
hist(df_movies$You.rated)
ggplot(df_movies, aes(You.rated)) + geom_histogram(bins = 10)
# Graph a histogram for my ratings only for movies before 2000.
ggplot(df_movies[df_movies$Year > 2000, ], aes(You.rated)) + geom_histogram(bins = 10)

df_movies$above2000 <- df_movies$Year > 2000

ggplot(df_movies, aes(You.rated, fill = above2000)) + geom_histogram(bins = 10)

# Let's get complex!
# What 

summary(df_movies)
