## ----------------------------------------------------------------------------------------------------------------
### a
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
# 1 = missing in di05, no missing in di06
# 2 = no missing in di05, missing in di06
# 3 = missing in di05, missing in di06
incans <- is.na(allbus$di05)+2*is.na(allbus$di06)
table(incans)
head(allbus[incans==1, c("di05", "di06", "hhinc")])
head(allbus[incans==2, c("di05", "di06", "hhinc")])
head(allbus[incans==3, c("di05", "di06", "hhinc")])
### b
library('mice')
df <- data.frame(nic=allbus$di05, lage=allbus$ep03, land=allbus$land)
impute <- mice(df, m=1)
imp1   <- complete(impute)
# how many missing?
table(is.na(imp1$nic))
### c
# find labels
labels <- function(x, xlab) {
  lab <- rep('', length(x))
  for (i in seq(xlab)) {
    lab[x==xlab[i]] <- names(xlab)[i]
  }  
  lab
}
#
nic <- imp1$nic[incans==1]
lab <- labels(allbus$di06[incans==1], attr(allbus$di06, 'labels'))
old <- par(mai=c(2.1,2.1,0.6,0.6))
on.exit(par(old))
boxplot(nic~lab, las=2)
### d
# Use the mean of the class interval

