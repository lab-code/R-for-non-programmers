# Looping
for (i in 1:5){
  print(i)
}

results <- c("ERROR", "WARNING", "GOOD", "ERROR")
for(result in results){
  print(result)
}

# more strongly typed and less prone to user errors
for(i in length(results)){
  print(result[i])
}


# WHILE
index <- 1
result <- results[index]
while(result != "GOOD"){
  index <- index + 1
  result <- results[index]
}