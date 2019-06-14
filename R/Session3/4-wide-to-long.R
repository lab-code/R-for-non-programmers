plays <- read.table("../../data//hejtmy-plays.csv", sep = ",", header = T, encoding = "UTF-8")
head(plays)

## ingenious way

plays_recoded <- data.frame()
for (i in 1:nrow(plays)){
  row <- plays[i,]
  print(i)
  play_df <- data.frame()
  iPlayer_info <- which(names(plays) == "player.1.username")
  play_info <- row[, (1:(iPlayer_info - 1))]
  nPlayerCol <- 8
  for (i in 1:8){
    # now we want to extract information about the specific player
    iStart <- iPlayer_info + (i-1) * nPlayerCol
    iEnd <- iStart + nPlayerCol - 1
    player_info <- row[, iStart:iEnd]
    colnames(player_info) <- c("player.username" ,"player.name", "player.startposition", "player.color", "player.score",
                              "player.new", "player.rating", "player.win")
    if(player_info$player.name == ""){break}
    player_row <- cbind(play_info, player_info)
    play_df <- rbind(play_df, player_row)
  }
  plays_recoded <- rbind(plays_recoded, play_df)
}
plays_recoded
