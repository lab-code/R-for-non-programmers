library()

path = "C:/Lukas/LabCode/R-for-non-programmers/data/hejtmy-ratings.csv"
moviesBAD = read.table(path, sep= ",")
movies = read.table(path, sep = ",", header = T, stringsAsFactors = F)

movies2000 = movies[movies$Year >= 2000, ]

movies2000[movies2000$You.rated == 10, ]$Title
movies2000[movies2000$You.rated == 10, "Title"]

head(movies)
colnames(movies)

rating_after_2000 =  movies[movies$Year >= 2000, ]$You.rated
rating_before_2000 =  movies[movies$Year < 2000, ]$You.rated
t.test(rating_after_2000, rating_before_2000)

# Anova
anova = aov(You.rated ~ Year, movies) 
summary(anova)

# Selecting more complicated stuff
only_comedy = movies[grepl("comedy", movies$Genres),]

# PLOTTING
plot(movies$Year, movies$You.rated)
hist(movies2000$You.rated)

plt = ggplot(movies, aes(x= Year, y = You.rated))
plt + geom_point()
