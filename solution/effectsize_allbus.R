## ----------------------------------------------------------------------------------------------------------------
## a
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
tab <- table(allbus$land, allbus$di06)
tab
chisq.test(tab)
chisq.test(tab, simulate.p.value=TRUE)
## b
tab0  <- table(allbus$ep03, allbus$ep06)
test0 <- chisq.test(tab0)
test0
# Cohens w
sqrt(test0$statistic/sum(tab0))
## c
# 50% 
index <- sample(1:nrow(allbus), size=nrow(allbus)/2, replace=TRUE)
tab1  <- table(allbus$ep03[index], allbus$ep06[index])
test1 <- chisq.test(tab1)
test1
# Cohens w
sqrt(test1$statistic/sum(tab1))
# 25% 
index <- sample(1:nrow(allbus), size=nrow(allbus)/4, replace=TRUE)
tab2  <- table(allbus$ep03[index], allbus$ep06[index])
test2 <- chisq.test(tab2)
test2
# Cohens w
sqrt(test2$statistic/sum(tab2))

