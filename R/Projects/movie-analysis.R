source("data/loader.R")
df_movies <- data_hejtmy_movies_preprocessed()

# What genres do we have?
unique_genres(df_movies$Genres)

# Do I like commedies more than drama?
library(ggplot2)
## Long version
m_c <- mean(df_movies$Your.Rating[df_movies$Comedy])
sd_c <- sd(df_movies$Your.Rating[df_movies$Comedy])

m_nc <- mean(df_movies$Your.Rating[!df_movies$Comedy])
sd_nc <- sd(df_movies$Your.Rating[!df_movies$Comedy])

agg_df <- data.frame(mean = c(m_c, m_nc), comedy = c(T, F))

## Semi long version
agg_df <- data.frame(mean = c(m_c, m_nc), comedy = c(T, F))

## GGplot version
ggplot(df_movies, aes(Comedy, Your.Rating, fill=Comedy)) + stat_summary(fun.y = "mean", geom = "bar")


## Demonstration
ug <- unique_genres(df_movies$Genres)
df_genre <- data.frame(genre=character(), 
                       mean=numeric(), 
                       stdev=numeric(),
                       n=numeric(),
                       stringsAsFactors = F)
for(genre in ug){
  genre <- as.character(genre)
  i <- df_movies[[genre]]
  ls <- data.frame(genre=genre,
             mean=mean(df_movies$Your.Rating[i], na.rm=T), 
             stdev=sd(df_movies$Your.Rating[i], na.rm = T),
             n=sum(i))
  df_genre <- rbind(df_genre, ls)
}

df_genre <- df_genre[order(df_genre$mean),]
ggplot(df_genre, aes(reorder(genre,-mean), mean, fill=genre)) + geom_col()


ggplot(df_genre, aes(reorder(genre,-mean), mean, fill=genre)) + geom_col() + geom_errorbar(aes(ymin=mean-stdev, ymax=mean+stdev), width=.2,
position=position_dodge(.9))

ggplot(df_genre, aes(reorder(genre,-n), mean, fill=n)) + geom_col() + geom_errorbar(aes(ymin=mean-stdev, ymax=mean+stdev), width=.2,
                                                                                           position=position_dodge(.9))


