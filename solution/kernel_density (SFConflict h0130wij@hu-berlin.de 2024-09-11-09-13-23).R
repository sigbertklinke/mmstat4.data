## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
cps <- ghload("data/cps.rds")
cps85 <- subset(cps, cps$year==85)
## a
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
hist(cps85$educ, freq = FALSE)
x <- seq(min(cps85$educ), max(cps85$educ), by=0.05)
lines(x, dnorm(x, mean=mean(cps85$educ), sd=sd(cps85$educ)))
hist(cps85$exper, freq = FALSE)
x <- seq(min(cps85$exper), max(cps85$exper), by=0.05)
lines(x, dnorm(x, mean=mean(cps85$exper), sd=sd(cps85$exper)))
## b
library("np")
bw <- npudensbw(~educ+exper, data=cps85, bwmethod="normal-reference")
fhat <- npudens(bw)
plot(fhat, view="fixed", theta=60, phi=30)

