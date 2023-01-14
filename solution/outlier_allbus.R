## -----------------------------------------------------------------------------------------------------
### a
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
stem(allbus$di05)
### b
boxplot(allbus$di05, horizontal = TRUE)
### c
z <- scale(allbus$di05)
describe(z)

