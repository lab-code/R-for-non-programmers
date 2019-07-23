source("Courses/Cebex/code/6-preprocessing.R")

df <- df_all_students
### Select portugese number of absences
mean(df$traveltime)
hist(df$traveltime)

mean(df$absences_math[df$traveltime == 1], na.rm = T)

library(psych)
describeBy(df$absences_math, df$traveltime)


## Dplyr
library(dplyr)
filter(df, traveltime==1) == df[df$traveltime == 1, ]

select(df, absences_math)

# %>%
df %>% filter(traveltime == 1) %>% 
  select(absences_math) %>% 
  summarize(average=mean(absences_math, na.rm=T))

df %>% group_by(traveltime) %>%
  summarize(average=mean(absences_math, na.rm=T))

output <- df %>% group_by(traveltime) %>%
  filter(both_courses) %>%
  summarize(average_absence=mean(absences_math + absences_portugese))

barplot(output$average_absence)

df_filtered <- filter(df, traveltime == 1)
df_filtered <- df[df$traveltime == 1, ]

output <- df %>% group_by(sex) %>% summarize(alcohol=mean(total_alcohol))
barplot(output$alcohol, names.arg = output$sex)

hist(df$absences_math, breaks = 40)

hist(df$absences_math[df$school=="MS"], breaks = 40)


## Running tests
t.test(total_alcohol ~ sex, data = df)
