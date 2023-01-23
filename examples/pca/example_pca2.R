library("mmstat4")
bank2 <- ghload("bank2.rds")
par(mfrow=c(1,2))
# do PCA (correlation)
pc <- prcomp(bank2, center=T, scale=T)
summary(pc)
plot(pc$sdev^2, type="b", main="Scree plot")
#
library("psych")
ppc<-principal(bank2, rotate="none")
ppc
scree(bank2)
