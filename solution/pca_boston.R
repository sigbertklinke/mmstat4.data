## -------------------------------------------------------------------------------------------------------------------------------------
## a
library("MASS")
names(Boston)
bhd <- Boston[,-c(4,9)]
names(bhd)
## b
vvar <- diag(var(bhd))
sum(vvar)
round(vvar/sum(vvar), digits=3)
#
sbhd <- scale(bhd)
vvar <- diag(var(sbhd))
sum(vvar)
round(vvar/sum(vvar), digits=3)
## c+d
library("plot.matrix")
prb <- princomp(bhd)
opar <- par(mar=c(5.1, 4.1, 5.1, 4.1))   # adapt margins
on.exit(par(opar))
plot(prb$loadings, cex=0.7, axis.col=list(side=3, cex.axis=0.7, las=3), axis.row=list(cex.axis=0.7, las=1), main="")
#
prb <- princomp(sbhd)
pcvar <- prb$sdev^2
pcvar
cumsum(pcvar)/sum(pcvar)
opar <- par(mar=c(5.1, 4.1, 5.1, 4.1))   # adapt margins
on.exit(par(opar))
plot(prb$loadings, cex=0.7, axis.col=list(side=3, cex.axis=0.7, las=3), axis.row=list(cex.axis=0.7, las=1), main="")
screeplot(prb)
abline(h=1)
# e
d <- sqrt(rowSums(sbhd^2))
boxplot(d, horizontal = TRUE)
# exclude outliers
outlier <- which(d>7)
obhd <- sbhd[-outlier,]
prb <- princomp(obhd)
pcvar <- prb$sdev^2
pcvar
cumsum(pcvar)/sum(pcvar)
opar <- par(mar=c(5.1, 4.1, 5.1, 4.1))   # adapt margins
on.exit(par(opar))
plot(prb$loadings, cex=0.7, axis.col=list(side=3, cex.axis=0.7, las=3), axis.row=list(cex.axis=0.7, las=1), main="")
screeplot(prb)
abline(h=1)
devtools::unload('plot.matrix') # Package devtools must be installed!

