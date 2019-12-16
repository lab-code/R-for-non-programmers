df <- read.table("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", 
                 header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Acces of vectors
head(df)
str(df)

## just data 85-99

# Names of airlines with at least one fatal accident betwen 85_99
df$airline[df$fatal_accidents_85_99 > 1]

# Avearge avail seak km for flights with no fatal accidents
mean(df$avail_seat_km_per_week[df$fatal_accidents_85_99 == 0])

# number of airlines with no indcident
length(df$airline[df$incidents_85_99 == 0])
sum(df$incidents_85_99 == 0)

# histogram of incidets for companies with more than average fatalities
avg_fatalities <- mean(df$fatalities_85_99)
hist(df$incidents_85_99[df$fatalities_85_99 > avg_fatalities])

## Loading
df <- read.table("https://raw.githubusercontent.com/hejtmy/r-courses/master/data/loading-examples/example-sep.txt",
                 sep = ",")
df <- read.table(sep = ";", dec = ",",
                 file = "https://raw.githubusercontent.com/hejtmy/r-courses/master/data/loading-examples/example-dec.txt")
df <- read.table(sep = ",", header = TRUE, skip = 2, stringsAsFactors = FALSE,
                 file = "https://raw.githubusercontent.com/hejtmy/r-courses/master/data/loading-examples/example-weird-header.txt")
df <- read.table(sep = ",", header = TRUE,stringsAsFactors = FALSE, fill = TRUE, 
                 file = "https://raw.githubusercontent.com/hejtmy/r-courses/master/data/loading-examples/example-error.txt")
head(df)
str(df)

## Preprocessing
df <- read.table("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", 
                 header = TRUE, sep = ",", stringsAsFactors = FALSE)

df$incidents_85_99 <- df$incidents_85_99*100
head(df)
df$incidents_85_99 <- df$incidents_85_99/100
head(df)
df$incidents_85_99 <- as.numeric(df$incidents_85_99)

df$id <- 1:nrow(df)
head(df)

### total_incidents
df$total_incidents <- df$incidents_85_99 + df$incidents_00_14

### total_accidents
df$total_accidents <- df$fatal_accidents_85_99 + df$fatal_accidents_00_14

### total_fatalities
df$total_fatalities <- df$fatalities_85_99 + df$fatalities_00_14

### fatalities_per_accident
df$fatalities_per_accident <- df$total_fatalities/df$total_accidents
head(df)

### 
df[1,]
df[,1]
df[, "airline"] == df$airline

df[c(TRUE, FALSE), ]
df[c(1, 6, 9), ]
df[4, c(1, 6, 9)]

df[4, c("airline", "total_fatalities")]
## try negatives 
df[-(1:55), -1]
## try non existent numbers
df[900,]
df[,900]
## try mutliples of the same number 
df[c(1, 1, 1),]


### column removal 
#df$incidents_85_99 <- NULL
df[, c("incidents_85_99", "incidents_00_14", "fatal_accidents_85_99",
       "fatal_accidents_00_14", "fatalities_85_99", "fatalities_00_14")] <- NULL

write.table(df, "flights-preprocessed.txt", sep= ";", row.names = FALSE)

### row removal
df <- df[-1, ]
df <- df[2:56, ]

df <- read.table("flights-preprocessed.txt", sep=";", header = TRUE)

## Descriptives

### order
head(df[(order(-df$total_fatalities)), ])
head(df[(order(df$total_fatalities)), ])

head(df[(order(-df$total_fatalities)), c("airline", "total_fatalities")])

###

library(dplyr)

df %>%
  arrange(-total_fatalities) %>%
  select(airline, total_fatalities) %>%
  head()
