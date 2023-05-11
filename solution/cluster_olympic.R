## -----------------------------------------------------------------------------------------------------------------------
library("mmstat4")
olymp <- ghload("data/olympic.rds")
names(olymp)
dec <- olymp[,-c(1,12)]
sdec <- scale(dec)
## a
d  <- dist(sdec)
hl <- hclust(d, "ward.D2")
## b
plot(hl) # 2 or 3
## c
cl2 <- cutree(hl, 2)
cl3 <- cutree(hl, 3)
fa <- principal(sdec, 2)
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
plot(as.data.frame(fa$scores), col=cl2, pch=19)
plot(as.data.frame(fa$scores), col=cl3, pch=19)

