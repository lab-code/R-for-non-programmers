#' Vectors

str1 = "I"
str2 = "am"
str3 = "great"
num1 = 0
num2 = -5
num3 = pi

#' Vectors allow us to save multiple values in the same variable
#' It seems useless but will be awesome when we get to looping, data.frames etc.
string_vec = c(str1, str2, str3)

numeric_vec = c(num1, num2, num3)

numeric_vec2 = 1:5
numeric_vec3 = -5:-10

# Vectors can oly store one TYPE of variabe

combined_vec = c(str1, num2)
# Well? No ERROR? let's have a look at it
combined_vec
class(combined_vec)

#' This is something that programming calls implicit conversion
#'  You asked it to make a vector of two variables that can't make a vector
#'  so it converted one the the least "defined" type it knows - which is always character
#'  integer -> numeric -> character

#interesting way to create vectors
# REPETITION
all_ones = rep(1, 100)

# SEQUENCING
small_increments = seq(1, 100, by = 0.1)
larger_increments = seq(2, 100, length.out = 50)

# RANDOM
set.seed(666)
uniform_deviations = runif(25)

# Vector access
numeric_vec[1] * numeric_vec[2]
string_vec[2]
string_vec[c(1:3)]

# vector math
num_vec1 = 1:5
num_vec2 = -1:-5
num_vec2 + num_vec1