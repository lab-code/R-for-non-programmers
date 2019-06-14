# Data frames
row_order <- seq(1:30)
gender <- rep(c("Male", "Female"), 15)
age <- sample(c(5:40), 15)
df <- data.frame(gender = gender, age = age)


# reading in data.frames
tab <- read.csv()
tab <- read.delim()
tab <- read.table("../Data/hejtmy-ratings.csv", sep = ",", header = T)

# Extracting columns from data frames - similar to lists
# multiple ways to extract position
tab$position
tab$"position"
tab[,"position"]
tab[, 1]
tab[[1]]
tab[1]

# see the difference between 
tab[1] == tab[[1]]

# extracting rows
tab[1,]

#extracted rows allow us to 

# combining - we want fifth year 
tab$Year[5]
tab[5, "Year"]
tab[5,]$Year


#' Now combining this knowledge with subsetting the data set. 
#' Previously we were still only working with vectors, now we want to create subsetted tables

#' The process is extremely simillar to wat we did previously, we just need to select entire rows

year_2000 <- tab$Year >= 2000
data_2000 <- tab[year_2000,] #done
data_2000b <- tab[tab$Year >=2000, ]

