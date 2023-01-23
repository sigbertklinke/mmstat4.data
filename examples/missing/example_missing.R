library("mmstat4")
allbus2018 <- ghload("allbus2018.rds")
vars  <- startsWith(names(allbus2018), "pt")
trust <- allbus2018[,vars]
# count number of missing values
r <- is.na(trust)
# no. per column
apply(r, 2, sum)
# no. per row
apply(r, 1, sum)
# number of complete cases
cc <- complete.cases(trust)
sum(cc)
# filter functions
head(na.omit(trust))
try(na.fail(trust))
