# 1
movies <- c("Battlestar Galactica", "Casablanca", "Scott Pilgrim vs. the World", "The Fifth Element", "Monty Python and the Holy Grail")
movies
length(movies)

# 2
sample(movies, 1)

# 3
new_order <- sample(movies)
new_order

# 4
new_movies <- c("12 Angry Men", "The Simpsons", "Clerks")
all_movies <- c(movies, new_movies)
all_movies
sample(all_movies, 1)

# 5
edges <- all_movies[c(1, length(all_movies))]
without_edges <- all_movies[-c(1, length(all_movies))]

# 6
# Want to remove Clerks and 12 Angry men
without_two <- all_movies[!(all_movies %in% c("Clerks", "12 Angry Men"))]
without_two

without_clerks <- all_movies[all_movies != "Clerks"]
without_angry_clerks <- without_clerks[without_clerks != "12 Angry Men"]
without_two == without_angry_clerks

# 7
one_to_hundred <- seq(1, 100)
one_to_hundred == 1:100

# 8
mean(one_to_hundred)
median(one_to_hundred)
sd(one_to_hundred)

# 9
# Change the vector that it starts at 101 and continues to 200 
new_vec <- one_to_hundred + 100
new_vec
# 10
#Change the vector that only every second number is increased by 100. eg. 1,102,3,104 etc.
one_to_hundred + c(0, 100)
