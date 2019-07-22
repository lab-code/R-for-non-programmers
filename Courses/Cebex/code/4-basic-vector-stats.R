set.seed(2019)

#vectors of length 100:
# - favorite_color <- sample of red, green, yellow, blue
colors <- c("red", "green", "yellow", "blue")
favorite_color <- sample(colors, 100, replace = T)
# - gender <- "male", "female", ....
gender <- sample(c("male", "female"), 100, T)
# - height - rnorm, mean =170, SD=10
height <- rnorm(100, 170, 10)
# - salary - rnorm, mean =29000, SD=5000
salary <- rnorm(100, 29000, 500)
# - hours_slept - sample between 5 to 11
hours_slept <- sample(5:11, 100, replace = T)


# Descriptive stats
summary(height)

table(favorite_color)
table(gender)
table(gender, favorite_color)


# Statistical tests
height_men <- height[gender == "male"]
height_women <- height[gender == "female"]
t.test(height_men, height_women)
cor(height, salary)
lm_salary_height <- lm(salary ~ height)
summary(lm_salary_height)


# Plotting
hist(height)
hist(height, 20)
hist(height, 40, col="blue")

d <- density(height)
plot(d)

count_colors <- table(favorite_color)
barplot(count_colors)

count_colors_gender <- table(gender, favorite_color)
barplot(count_colors_gender, beside = T, legend=rownames(count_colors_gender),
        xlab="favorite color", ylab="count of people")

plot(height, salary)
abline(lm(salary~height))
