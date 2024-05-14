## ---------------------------------------------------------------------------------------------------------------------------------
library("MASS")
names(Boston)
## a
bhd <- Boston[-c(4,9)]
names(bhd)
## b
library("psych")
KMO(bhd)
scree(bhd)
pa3 <- principal(bhd, rotate="none", nfactors=3)
fa3 <- fa(bhd, rotate="none", nfactors=3)
factor.congruence(pa3, fa3)
## c
data("boston", package="spData")
bhd <- boston.c[,c(6,8:10,12:15, 17:20)]
names(bhd)
pa <- principal(bhd)
pa$loadings
# +: indus, nox, lstat, tax, age, crim, ptratio  
# -: dis, medv, zn, rm, (black)
ind <- as.numeric(cut(pa$scores, seq(-2.3, 2.7, by=0.5)))
library("RColorBrewer")
col <- brewer.pal(max(ind), "RdBu")
plot(boston.c$LON, boston.c$LAT, col=col[ind], pch=19, cex=0.75)

