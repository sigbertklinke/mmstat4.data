## -------------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
bank2 <- ghload("data/bank2.rds")
## a
library("psych")
KMO(bank2)
## b
scree(bank2)
fa1 <- fa(bank2, nfactors = 2, rotate="none")
fa1
pa1 <- principal(bank2, nfactors = 2, rotate="none")
pa1
factor.congruence(fa1, pa1)
## c
fa2<-fa(bank2)
fa2$loadings
# LEFT+RIGHT+LOWER+UPPER-DIAGONAL
# DIAGONAL = SQRT(HEIGHT^2+WIDTH^2)
## d
col <- ifelse((1:200)<100, "blue", "red")
fa1 <- fa(bank2)
plot(range(fa1$scores), c(0,1), type="n")
points(fa1$scores, runif(200), pch=19, col=col)
fa2 <- fa(bank2, nfactors="2", rotate="none")
plot(fa2$scores, pch=19, col=col)

