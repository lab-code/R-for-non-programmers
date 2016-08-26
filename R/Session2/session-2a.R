set.seed(1)
age = sample(c(10:25), 25, replace = T)
gender = sample(c("male", "female"), 25, replace = T)
smoker = sample(c(T, F), 25, replace = T)
BMI = rnorm(25, 20, 2)

df = data.frame(age = age, gender = gender, smoker = smoker, BMI = BMI)

ncol(df)
nrow(df)

df[3]
df$smoker == df[[3]]

df[,3]

df[ROW, COLUMN]

age20 = age > 20
age20smoker = which(age > 20 & smoker)

numbers = 1:10
log = rep(c(T,F), 5)

select_last = c(rep(F, 24), T)

df_smokers = df[smoker,]
df_smokers$BMI
mean(df_smokers$BMI)

df[,4]
df[,"BMI"]
a = "BMI"
df[, a]

zeny = gender == "female"
age22 = age > 22
zeny22 = zeny & age22

# maximal BMI "male" age < 24 non-smoker
males = gender == "male"
age24 = age < 24
nonsmoker = !smoker
male24nonsmoker = males & age24 & nonsmoker
df[male24nonsmoker,]$BMI
