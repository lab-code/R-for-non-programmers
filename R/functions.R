# Functions
#' We've already seen functions like rep, seq or sample in the vector part
#'

number_vec = c(1:25)

sum(number_vec)
mean(number_vec)
length(number_vec)


# We can do a bunch by wrting consecutive lines of code and then runnign it
add_numbers = function(num1, num2){
  return(num1 + num2)
}

calc_hypotenuse = function(sideA, sideB){
  hypotenuse = sqrt((sideA ^ 2) + (sideB ^ 2))
  return(hypotenuse)
}

# we can also make it look slightly nicer by making new function sqr
sqr = function(num){
  return(num^2)
}

# calculate trialngle hypotenuse
calc_hypotenuse = function(sideA, sideB){
  hypotenuse = sqrt(sqr(sideA) + sqr(sideB))
  return(hypotenuse)
}

# function SCOPING
#' Amazing function of function is also to keep stuff away of BASE environment
#' Every time you assign a variable, it happens in the base environemnt
#' Functions in R have access to this environment, but can define their own variables to reduce clutter

num_vec = c(1:6)
mean = mean(num_vec)
above_mean = num_vec > mean
above_mean = num_vec[above_mean]

above_mean = function(vector){
  mean = mean(vector)
  above = vector > mean
  above = vector[above]
  return(above)
}

num_vec2 = c(6, 20, 32, 1, 3, 5)
above = above_mean(num_vec2)
# Awful practices in matlab to do all stuff in base environment - keep your calculations inside functions