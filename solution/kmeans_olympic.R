## -----------------------------------------------------------------------------------------------------
## a+ b
library("mmstat4")
olymp <- ghload("data/olympic.rds")
names(olymp)
dec <- olymp[,-c(1,12)]
#
fol2 <- principal(dec, nfactors=2, rotate="varimax")
fol2
cls <- 2:5
cli <- vector("list", 5)
opar <- par(mfrow=c(2,2))
on.exit(par(opar))
for (cl in cls) {
  cli[[cl]] <- kmeans(dec, cl)
  plot(as.data.frame(fol2$scores), col=cli[[cl]]$cluster, pch=19)
}
## c
library("cluster")
d   <- dist(dec)
opar <- par(mfrow=c(2,2))
on.exit(par(opar))
for (cl in cls) {
  s <- silhouette(cli[[cl]]$cluster, d)
  plot(s)
}

