data_hejtmy_movies <- function(){
    df_movies <- read.table("data/hejtmy-ratings.csv", header = T, sep = ",", 
                            stringsAsFactors = F)
    return(df_movies)
}

data_hejtmy_movies_preprocessed <- function(){
  df_movies <- data_hejtmy_movies()
  df_movies$Date.Rated <- as.Date(df_movies$Date.Rated,format = "%d/%m/%Y")
  df_movies <- add_genres(df_movies)
  return(df_movies)
}

add_genres <- function(df_movies){
  genres <- unique_genres(df_movies$Genres)
  for(genre in genres){
    df_movies[[genre]] <- grepl(genre, df_movies$Genres)
  }
  return(df_movies)
} 

unique_genres <- function(Genres){
  genres <- paste0(Genres, collapse = ",")
  genres <- strsplit(genres, ",")
  trim <- function (x) gsub("^\\s+|\\s+$", "", x)
  genres <- sapply(genres, trim)
  genres <- unique(genres)
  return(genres)
}
