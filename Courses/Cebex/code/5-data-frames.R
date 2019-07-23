df <- read.table("data/loading-examples/example-row.txt", header=T, sep=";")

head(df, 3)
str(df)
tail(df, 3)
summary(df)

df <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/data/loading-examples/example-row.txt",
                 header = T, sep = ";")

head(df)

df_sep <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/data/loading-examples/example-sep.txt",
                    sep = ",")

colnames(df_sep) <- colnames(df)
df_sep <- read.table("https://raw.githubusercontent.com/lab-code/R-for-non-programmers/master/data/loading-examples/example-sep.txt",
                     sep = ",", col.names = colnames(df))
all(df_sep == df)
rm(df_sep)

df_exported <- read.table("data/loading-examples/data-exported.csv", sep=",", header = T)
all(df_exported == df)
rm(df_exported)

library(readxl)
df_excel <- read_xlsx("data/loading-examples/data.xlsx")


df_weird <- read.table("data/loading-examples/example-weird-header.txt", header = T,
                       sep=",", skip=3)

df_dec <- read.table("data/loading-examples/example-dec.txt", sep=";",
                     dec=",", col.names = colnames(df))
mean(df_dec$height)


df_err <- read.table("data/loading-examples/example-error.txt", header=T, 
                     sep=",", stringsAsFactors = F)
as.numeric(as.character(df_err$height))

str(df_err)
df_err$height <- as.numeric(df_err$height)
