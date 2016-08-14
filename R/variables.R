# Variables allow us to save inbetween constructs to use them later

i = 5 # numeric
num = 5.1 #numeric
class(pi)

# here is something funny
class(c(1, 2, 3))
class(c(1:3))

# There is a limited number of varible types that you need to fit in, but you should be fine :)
str = "long character" # character vector
class(str)
char = 'c' #single quotes should work as well - BEWARE Matlab, C# or and others will kill you for that, stick to ""
class(char)
class("5")
#Funnily enough, this also works in R
"char" = "h"


bool = TRUE
bool2 = 2 < 3
class(bool)

ls = list(number = 1, text = "Interesing")
ls$number
ls$text
class(ls)

# variables are assigned from the right, so 
a = "string"
b = 1

# will actually save the variable, to the pointer a ad b, whereas 
"string" = b
# will save value of b into the variable strin

# R is a dynamic language so you can define variables as you type
num1 = 5
num2 = a * 3;
ls = list(num2 = num1, num2 = num2)

print(ls$num1 * ls$num2)

#maybe you wonder, how does R know, which part of the 

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

# Vector access
numeric_vec[1] * numeric_vec[2]
string_vec[2]
string_vec[c(1:3)]

# vector math
num_vec1 = 1:5
num_vec2 = -1:-5
num_vec2 + num_vec1

# What ould happen if you have two different types of vectors?

# string vectors?


# CONVERTING VARIABLES
num_vec1 = 1:5
as.character(num_vec1)
as.numeric("1")

# different lengths of vectors?
# Besides characters or numeric values, any variable can also save an R object
# For example, lists are R objects, data.frames are objects, functions etc.