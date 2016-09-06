# You should already by able to load data table
movies = read.table("../data/hejtmy-ratings.csv", sep = ",", header = T, stringsAsFactors = F)

string = "TV series"
grep("TV", string)


if (grep("V ser", string)){print("this one is good")}
if (grep(" V ser", string)){print("this one is good as well")}