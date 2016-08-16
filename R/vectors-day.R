ec = c(1, 3, 5)
1:10
10:1

rep("ME", 100)

x = c("MALE", "FEMALE")
vystup = c("MALE", "FEMALE", "MALE", "FEMALE")

sequence = seq(1, 5, 1/10)


sampling_vec = 1:25
sample(sampling_vec, 25, rep = T)

names = c("Rickon", "Rob", "Bran", "Sansa", "Arya", "Ned", "Catelyn", "Jon", "Hodor")
sample(names, 1)

arya_index = which(names == "Arya")
names[arya_index]

names = names[-c(1, 4)]
names = c(names, "Sansa", "Rickon")

not_favorite = names[c(8:9)]
names = names[-c(8:9)]
names = c(names, not_favorite)

place_index = which(table$Title == "The Place Beyond the Pines")

1:5 + -1:-5


numbers = seq(from = 1, to = 99, by = 2)
winners = sample(numbers, 10)
genders = rep(c("M", "F"), Length(numbers)/2)

indices_winners = which(numbers %in% winners)


