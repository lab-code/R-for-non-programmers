# Create vector of T, F logical(100), e.g. T, F, T, F, T, F ...
finished_test <- rep(c(T, F), 50)
# Set randomizing number to 100
set.seed(100)
# Create vector of T, F logical(100) which is a random selection
#     - set the probablitities of finishing to 90 percent
finished_test <- sample(c(T, F), 100, replace = TRUE, prob = c(0.9, 0.1))
table(finished_test)
# create a numeric(100) of 1 to 100
participant_id <- 1:100
participant_id <- seq(1, 100, by = 1)
# create a character(100) of gender "male", "female", "other" 
#     - random selection, c(45, 45, 10)
participant_gender <- sample(c("male", "female", "other"), 
                             100, replace = TRUE, prob = c(0.45, 0.45, 0.1))
table(participant_gender)
# create a numeric(100) percentile results 
#     - rnorm, mean = 50, sd = 20
participant_percentile <- rnorm(100, 50, 20)
hist(participant_percentile, breaks = 20)
## creating new vectors
# create a new vector of participant_score which is calculated ad 
#     - percentile 50 = 100, percentile SD = 20 is test_score sd = 30
z_score <- (participant_percentile - 50)/20
participant_score <- (z_score * 30) + 100# switch to z-score -> change m and sd

## Selection
#' == equal
#' != doesn't equal
#' >=, >, <=, < gt, ls then
#' %in% in
#' | or
#' & and

# which positions in the percentile are larger than X
table(participant_percentile > 90)
table((participant_percentile > 90) | (participant_percentile < 10))

i_good <- which(participant_percentile > 80)

# select only those positions in gender which are female
table(participant_gender == "female")
i_female <- which(participant_gender == "female")

# select either female or male
i_not_other <- which(participant_gender %in% c("male", "female"))
i_not_other <- which(participant_gender != "other")

#' select only test_scores which are above
#' 0th quantile of the data (top 20 percent)
quantile(participant_score, 0.8)
i_best <- which(participant_score > quantile(participant_score, 0.8))

## Vector access -----
participant_gender[1]
participant_gender[c(1, 2, 3, 4, 5)]
participant_gender[c(5, 4, 3, 2, 1)]
participant_gender[1:5]
participant_gender[i_best]

participant_percentile[i_best]
participant_percentile[which(participant_score > quantile(participant_score, 0.8))]

participant_percentile[participant_score > quantile(participant_score, 0.8)]
participant_gender == "male"
participant_percentile[participant_gender == "male"]

c(1, 5, 6, 8)[c(TRUE, FALSE, FALSE, TRUE)]
c(1, 5, 6, 8)[c(TRUE, FALSE)]

# frequency of genders in participants above 75th percentile
table(participant_gender[participant_percentile > 75])

# average score of participants who didn't finish
mean(participant_score[!finished_test])

# freqneucy of finish not finished among participants < 85 points in score
table(finished_test[participant_score < 85])

hist(participant_score[participant_gender == "female"])

df <- read.table("data/hejtmy-ratings.csv", header = TRUE, sep = ",", 
           stringsAsFactors = FALSE)
head(df)

mean(df$Your.Rating[df$Year > 2009])
mean(df$Your.Rating[df$Year <= 2009])
t.test(df$Your.Rating ~ (df$Year > 2009))

