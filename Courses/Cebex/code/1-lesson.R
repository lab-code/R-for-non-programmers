5 + 5
6 ^ 2

my_age <- 30
my_age <- NULL

my_age <- -30
abs(-5)
abs(my_age)
log(10)

log(10)

mean <- 4


my_name <- "Lukas"
toupper(my_name)

?toupper

library(ggplot2)
mpg <- ggplot2::mpg
str(mpg)
head(mpg, 2)
summary(mpg)

g <- ggplot(mpg, aes(class))
g + geom_bar()

aov_cty_manufacturer <- aov(cty ~ manufacturer, mpg)
summary(aov_cty_manufacturer)

g <- ggplot(mpg, aes(manufacturer, cty))
g + geom_boxplot()
