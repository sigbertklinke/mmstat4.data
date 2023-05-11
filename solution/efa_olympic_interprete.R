## -----------------------------------------------------------------------------------------------------------------------
library("psych")
library("mmstat4")
olymp <- ghload("data/olympic.rds")
names(olymp)
## a
dec <- olymp[,-c(1,12)]
KMO(dec)
scree(dec)
fol1 <- fa(dec, nfactors=2, rotate="varimax")
fol1
fol2 <- principal(dec, nfactors=2, rotate="varimax")
fol2
factor.congruence(fol1, fol2)
## b


## -----------------------------------------------------------------------------------------------------------------------
## c
plot(0, 0, asp=TRUE, xlim=c(-1,1), ylim=c(-1,1), type="n")
text(fol2$loadings, row.names(fol2$loadings))
library("plotrix")
draw.circle(0,0,1)
abline(v=0, h=0)
## d
oscore <- 1+ceiling(8*scale(olymp$score, min(olymp$score), diff(range(olymp$score))))
col <- terrain.colors(10)
plot(as.data.frame(fol2$scores), col=col[oscore], pch=19)

