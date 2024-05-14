## ---------------------------------------------------------------------------------------------------------------------------------
## a
data("boston", package="spData")
bhdc <- boston.c
plot(bhdc$LON, bhdc$LAT, col=bhdc$CHAS+1, pch=19)
## b
bhd <- bhdc[,c(6, 8:10, 12:15, 17:20)]
cls <- 2:5
opar <- par(mfrow=c(2,2))
on.exit(par(opar))
clorig <- vector("list", 5)
for (cl in cls) {
  clorig[[cl]] <- kmeans(bhd, cl)
  plot(bhdc$LON, bhdc$LAT, col=clorig[[cl]]$cluster, pch=19)
}
## c
library("psych")
KMO(bhd)
scree(bhd)
fa <- principal(bhd, 3, rotate="varimax")
fa
bhds <- scale(bhd)
colnames(bhds) <- c("MEDV", "CRIM", "ZN", "INDUS", "NOX", "RM", "AGE", "DIS", "TAX", "PTRATIO", "B", "LSTAT")
alpha(cor(bhds[,c("ZN", "INDUS", "NOX", "AGE", "DIS")]), check.keys=T)
alpha(cor(bhds[,c("MEDV", "RM", "PTRATIO", "LSTAT")]), check.keys=T)
alpha(cor(bhds[,c("CRIM", "TAX", "B")]), check.keys=T)
## d
keylist <- list(s1=c("-ZN", "INDUS", "NOX", "AGE", "-DIS"), s2=c("-MEDV", "-RM", "PTRATIO", "LSTAT"),
                s3=c("CRIM", "TAX", "-B"))
scales <- scoreItems(keylist, bhds)
cls <- 2:5
clscale <- vector("list", 5)
opar <- par(mfrow=c(2,2))
on.exit(par(opar))
for (cl in cls) {
  clscale[[cl]] <- kmeans(scales$scores, cl)
  plot(bhdc$LON, bhdc$LAT, col=clscale[[cl]]$cluster, pch=19)
}
## e
for (cl in cls) {
  print(table(clorig[[cl]]$cluster, clscale[[cl]]$cluster))
}

