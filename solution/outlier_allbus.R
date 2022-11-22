## ------------------------------------------------------------------------------------------------------------------------
### a
library("rio")
allbus <- import("https://shinyapps.wiwi.hu-berlin.de/d/ALLBUS2018.sav")
stem(allbus$di05)
### b
boxplot(allbus$di05, horizontal = TRUE)
### c
z <- scale(allbus$di05)
describe(z)

