## -------------------------------------------------------------------------------------------------------------------------------------
library("MASS")
names(Boston)
##a 
bhd <- Boston[-c(4,9)]
names(bhd)
## b
KMO(bhd)
scree(bhd)
pa3 <- principal(bhd, rotate="varimax", nfactors=3)
pa3
# rc1: -zn, indus, nox, age, -dis (inner-outer)
# rc2: -rm, ptratio, lstat, -medv (size/price, surrounding)
# rc3: crim, tax, -black (security)

## c 
data("boston", package="spData")
bhd <- boston.c[,c(6,8:10,12:15, 17:20)]
names(bhd)
pa3 <- principal(bhd, rotate="varimax", nfactors=3)
# rc1: -zn, indus, nox, age, -dis (inner-outer)
library("RColorBrewer")
ind <- as.numeric(cut(pa3$scores[,1], seq(min(pa3$scores[,1])-0.01, max(pa3$scores[,1])+0.01, length.out=11)))
col <- brewer.pal(max(ind), "RdBu")
plot(boston.c$LON, boston.c$LAT, col=col[ind], pch=19, cex=0.75, main="PC1")
# rc2: -rm, ptratio, lstat, -medv (size/price, surrounding)
ind <- as.numeric(cut(pa3$scores[,2], seq(min(pa3$scores[,2])-0.01, max(pa3$scores[,2])+0.01, length.out=11)))
col <- brewer.pal(max(ind), "RdBu")
plot(boston.c$LON, boston.c$LAT, col=col[ind], pch=19, cex=0.75, main="PC2")
# rc3: crim, tax, -black (security)
ind <- as.numeric(cut(pa3$scores[,3], seq(min(pa3$scores[,3])-0.01, max(pa3$scores[,3])+0.01, length.out=11)))
col <- brewer.pal(max(ind), "RdBu")
plot(boston.c$LON, boston.c$LAT, col=col[ind], pch=19, cex=0.75, main="PC3")

