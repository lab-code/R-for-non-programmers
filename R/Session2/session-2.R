library()
source("data/loader.R")

movies <- data_hejtmy_movies()

movies2000 <- movies[movies$Year >= 2000, ]

movies2000[movies2000$You.rated == 10, ]$Title
movies2000[movies2000$You.rated == 10, "Title"]

head(movies)
colnames(movies)

rating_after_2000 <- movies[movies$Year >= 2000, ]$You.rated
rating_before_2000 <- movies[movies$Year < 2000, ]$You.rated
t.test(rating_after_2000, rating_before_2000)

# Anova
anova = aov(You.rated ~ Year, movies) 
summary(anova)

# Selecting more complicated stuff
only_comedy <- movies[grepl("comedy", movies$Genres),]

# PLOTTING
plot(movies$Year, movies$You.rated)
hist(movies2000$You.rated)

plt = ggplot(movies, aes(x= Year, y = You.rated))
plt + geom_point()
