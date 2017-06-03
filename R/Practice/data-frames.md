# Manipulaitng data.frames

We will try to reproduce some statistics from [A Statistical Analysis of the Work of Bob Ross](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/) to demonstrate, that even basic knowledge of R will allow you to replicate world renown stats site data :)

1. Download and load data from here [path to data](https://raw.githubusercontent.com/fivethirtyeight/data/master/bob-ross/elements-by-episode.csv) to variable df_bob. I will tell you, that R works with web links quite well. SO you don't have to load the file from HDD ;)
```{r}
# Your code
> nrow(df_bob)
[1] 403
> ncol(df_bob)
[1] 69
```

At this point I recommend looking at the table closesly. What type of data you have? What are the columns etc.

```{r}
head(df_bob)
View(df_bob)
```

It shoudl be clear that what you have in each column is a logical (boolean) 0-1 value. This will come in handy :)

2. How many episodes were aired? Save to n_episodes variable.
```{r}
# your code
> n_episodes
[1] 403

```

3. How many percent if BOB's paintings have more than one TREE (column TREES)?  How many take place in Winter? 
```{r}
# Your code
[1] 0.8362283
[1] 0.1712159
```

4. How many episodes have have more than one trees AND take place in winter?
```{r}
# Your code
[1] 0.1588089
```

5. Create a new column called N_THEMES that sums how many different themes are in a single image. Take look at ?rowSums function.
```{r}
# Your code
> summary(df_bob$N_THEMES)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   2.000   2.000   2.531   3.000   6.000 
```

6. Select those episodes with the MOST themes overall and save them to df_theme_overload. E.g. if the most themes occuring are 15, select ALL episodes that have 15 themes.
```{r}
# Your code
df_theme_overload$TITLE
[1] "MOUNTAIN OVAL"

```


7. What is the average amount of themes occuring in an episode. Calculate mean, median etc.
```{r}
# Your code
[1] 18.51613
[1] 18
```

8. Calculate how many times each of themes occured and save to a new data.frame df_themes. Try to transform the table to the long format. So that the table has two columns [theme, n]. There are more approaches, but I recommend creating a new df_themes from the data in df_themes. Useful functions will be ?data.frame, ?colnames, ?as.vector and ?colSums.

```{r}
# Your code
head(df_themes,3)
            theme  n
1     APPLE_FRAME  1
2 AURORA_BOREALIS  2
3            BARN 17
```

9. In the df_themes add new column that has the numbers of themes converted to percent. Round to whole numbers. Plot the result with provided function.
```{r}
# Your code
#orders from the highes to lowest
df_themes <- df_themes[order(-df_themes$n),]
#we will plot only the firt 20
df_top_themes <- df_themes[1:10, ]
barplot(df_top_themes$percent, names.arg = df_top_themes$theme, 
        xlab="Number of occurences", ylab = "Theme name", cex.names=0.5)
```
![](https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/R/Practice/bob-fig.png)

10. Select a first episode ever aired and print all names of themes it actually has. You will need function ?colnames and somehow select only those names that have 1 in the row. You might also need to convert data frame to vector - google how it can be done.
```{r}
# Your code
[1] "BUSHES"    "DECIDUOUS" "GRASS"     "RIVER"     "TREE"      "TREES"
```