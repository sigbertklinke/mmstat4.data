## ------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
cps <- ghload("data/cps.rds")
cps85 <- subset(cps, cps$year==85)
## a
opar <- par(mfrow=c(2,3))
on.exit(par(opar))
o <- order(cps85$exper)
for (i in 1:3) {
  lmi <- lm(lwage~poly(exper,i), x=TRUE, data=cps85)
  plot(cps85$exper, cps85$lwage, pch=19, cex=0.5, main=sprintf("R^2=%.3f", summary(lmi)$r.squared))
  lines(cps85$exper[o], fitted(lmi)[o], col="red", lwd=2)
}
o <- order(cps85$educ)
for (i in 1:3) {
  lmi <- lm(lwage~poly(educ,i), x=TRUE, data=cps85)
  plot(cps85$educ, cps85$lwage, pch=19, cex=0.5, main=sprintf("R^2=%.3f", summary(lmi)$r.squared))
  lines(cps85$educ[o], fitted(lmi)[o], col="red", lwd=2)
}  
## b
lm1 <- lm(lwage~., data=cps85)
summary(lm1)
lm2 <- lm(lwage~educ+south+female+expersq+union, data=cps85)
summary(lm2)
## c 
plot(lm2)

