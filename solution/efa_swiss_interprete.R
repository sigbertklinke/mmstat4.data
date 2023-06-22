## ------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
bank2 <- ghload("data/bank2.rds")
## a+b
library("psych")
KMO(bank2)
scree(bank2)
efa1 <- fa(bank2, nfactors=2, rotate="varimax")
efa1
## ultra-Heywood case was detected. Examine the results carefully
efa2 <- principal(bank2, nfactors=2, rotate="varimax")
efa2
## c
sbank2 <- as.data.frame(scale(bank2))
f1 <- sbank2$LEFT+sbank2$RIGHT+sbank2$LOWER+sbank2$UPPER-sbank2$DIAGONAL
f2 <- sbank2$WIDTH
plot(f1, f2, pch=19, col=1+((1:200)<100))

