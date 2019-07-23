df_math <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/data/student-alcohol-consumption/student-mat.csv",
                      header = T, sep=",", stringsAsFactors = F)
df_portugese <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/data/student-alcohol-consumption/student-por.csv",
                           header=T, sep=",", stringsAsFactors = F)

colnames(df_math)

## Accessing data.frame
df_math$freetime
df_math$freetime[5]
df_math[5, "freetime"]

df_math$sex[3]
df_math[3, "sex"]
df_math[3, 2]

df_math$sex
df_math[, "sex"]
df_math[, 2]
df_math[1,]
df_math[1:3,]
df_math[c(1,5),]

df_math[c(1,5),c("school", "studytime")]
df_math[c(1:5, (nrow(df_math)-4):nrow(df_math)),]
n_df_math <- nrow(df_math)
df_math[c(1:5, (n_df_math-4):n_df_math),]


## Merging dataframe

df_test <- data.frame(id=1:100, gender=sample(c("F", "M"), 100, replace=T))
df_test_lab2 <- data.frame(results=rnorm(100, 100, 15))
df_test_all <- cbind(df_test, df_test_lab2)
df_test_all$id <- NULL


### 
df_test <- data.frame(id=1:50, 
                      gender=sample(c("F", "M"), 50, replace=T),
                      results=rnorm(50, 100, 15))
df_test_lab2 <- data.frame(id=51:100, 
                      gender=sample(c("F", "M"), 50, replace=T),
                      results=rnorm(50, 100, 15))

df_test_all <- rbind(df_test, df_test_lab2)

all(colnames(df_math)==colnames(df_portugese))
df_all <- rbind(df_math, df_portugese)
dim(df_all)  
  
## Merge
df_test <- data.frame(id=1:50, 
                      gender=sample(c("F", "M"), 50, replace=T),
                      results=rnorm(50, 100, 15))
df_test_lab2 <- data.frame(code=sample(1:50, 50), results=rnorm(50, 10, 1))
df_all <- merge(df_test, df_test_lab2, by.x="id", by.y="code", 
                suffixes =c("_lab1", "_lab2"))


# Cleaning up duplicates from 
match_columns <- c("school","sex","age","address","famsize","Pstatus",
                   "Medu","Fedu","Mjob","Fjob","reason","nursery",
                   "internet","higher", "famsup", "freetime", "goout", 
                   "romantic", "activities", "health", "famrel", "guardian", 
                   "traveltime","schoolsup")
df_all <- rbind(df_math, df_portugese)
head(df_all[, match_columns])
table(duplicated(df_all[, match_columns]))
sum(duplicated(df_all[, match_columns]))
mean(duplicated(df_all[, match_columns]))

df_all_students <- merge(df_math, df_portugese, 
                         by=match_columns, all=T,
                         suffixes = c("_math", "_portugese"))

# recoding variables
head(df_all_students[df_all_students$address == "U", ])
df_all_students$address[df_all_students$address == "U"] <- "urban"
df_all_students$address[df_all_students$address == "R"] <- "rural"
table(df_all_students$address)

## recoding Pstatus T="together", A="apart"

## recoding all "yes" and "no" to TRUE/FALSE
df_all_students[df_all_students == "yes"] <- T
df_all_students[df_all_students == "no"] <- F

## new variables
df_all_students$large_family <- df_all_students$famsize == "GT3"

## any_support = T if famsup or schoosup is T
df_all_students$any_support <- as.logical(df_all_students$famsup) | 
                               as.logical(df_all_students$schoolsup)
## both_courses = T if both portugese and math, F if only one
df_all_students$both_courses <- !is.na(df_all_students$absences_math) & 
                                !is.na(df_all_students$absences_portugese)
df_all_students$both_courses <- complete.cases(df_all_students)
## total_math_g, total_portugese_g = susms of G1-G3 in math and/portugese
df_all_students$total_math_g <- df_all_students$G1_math + 
  df_all_students$G2_math + df_all_students$G3_math
## total_alcohol = dalc + walc (for math and portugese separately)
df_all_students$total_alcohol <- sum(df_all_students$Dalc_math, df_all_students$Dalc_portugese,
                                     df_all_students$Walc_math, df_all_students$Walc_portugese,
                                     na.rm=T)
df_all_students$total_alcohol[df_all_students$both_courses] <- df_all_students$total_alcohol/2

## saving the data
write.table(df_all_students, "students-preprocessed.csv", sep = ";", row.names = F)
