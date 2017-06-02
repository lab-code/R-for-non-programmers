# Vectors

1. Create a vector of length 5 filled with titles of your favourite movies. Check its length
```{r}
movies #your code
movies
[1] "Battlestar Galactica" "Casablanca" "Scott Pilgrim vs. the World" "The Fifth Element" "Monty Python and the Holy Grail"

# your code
[1] 5
```
2. Select one movie randomly from the vector.

```{r}
# your code
[1] "The Fifth Element"
```

3. Randomize the order of those movies and save to a new vector

```{r}
new_order # your code
new_order
[1] "The Fifth Element"  "Casablanca" "Battlestar Galactica"  "Monty Python and the Holy Grail" "Scott Pilgrim vs. the World" 
```

4. Create a new vector with three other movies and combine both vectors to a single one and select one movie at random
```{r}
new_movies #your code
all_movies #your code
all_movies
[1] "Battlestar Galactica"            "Casablanca"                      "Scott Pilgrim vs. the World"     "The Fifth Element"               "Monty Python and the Holy Grail"
[6] "12 Angry Men"                    "The Simpsons"                    "Clerks" 
# your code
[1] "Casablanca"
```

5. Create a new vector that includes only first and last movie. Create another vector that includes ALL but the first and last movie.
```{r}
#Your code
[1] "Battlestar Galactica" "Clerks"
without_edges #your code
[1] "Casablanca"                      "Scott Pilgrim vs. the World"     "The Fifth Element"               "Monty Python and the Holy Grail" "12 Angry Men"                   
[6] "The Simpsons"  
```

6. Create a new vector that includes all movies but two. Remove them using their title.
```{r}
# Want to remove Clerks and 12 Angry men
# Your code
[1] "Battlestar Galactica"            "Casablanca"                      "Scott Pilgrim vs. the World"     "The Fifth Element"               "Monty Python and the Holy Grail"
[6] "The Simpsons
```

7. Create a vector of numbers from 1 to 100
```{r}
# Your code
[1]   1   2   3   4   5   6   7   8   9  10  11  12 ....
```
8. What is the mean, median and sd of your vector?
```{r}
# Your code
[1] 50.5
[1] 50.5
[1] 29.01149
```
9. Change the vector that it starts at 101 and continues to 200 
```{r}
# Your code
[1] 101 102 103 104 105 106 107 108 ....
```
10. Change the vector that only every second number is increased by 100. eg. 1,102,3,104 etc.
```{r}
# Your code
[1]   1 102   3 104   5 106   7 108   9 110  11 112  13 114  15 116 ...
```