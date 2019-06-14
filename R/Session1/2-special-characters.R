#' Special characters are characters that have meaning in the R syntax. 
#' Therefore they should never be used in variable names or functions!
#' 
#' List

#' asignments
#' 
#' = <-
num1 <- 5
num2 <- 4
arr1 <- c(num1, num2)

#' comparing
#' 
#' == < > %in%
num1 == num2
num1 != num2
num1 %in% arr1
num1 < num2

# logical
#' 
#' & |

num1 > num2
(num1 > num2) && (num2 < num1)
(num1 < num2) || (num2 == num1)

#' algebra
#' 
#' + - * / % ^
num1 * num2
num1 + num2
num1 - num2
num1 / num2
num1 %% num2

# vectors and accessing vectors
vec = 1:9
vec[1]
vec[1:3]
vec[vec[2]]

# Let'S try to break R by using these symbols where they don't belong
num1/ = 1
num1% = 2
I|>you = "YES"

# Just keep to letters, numbers and underscore when naming Things