## ------------------------------------------------------------------------------------------------------------------------
## a
library("rio")
cps <- import("https://shinyapps.wiwi.hu-berlin.de/d/CPS78-85.sav")
#  
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
hist(cps$educ, freq = FALSE)
rug(cps$educ)
x <- seq(min(cps$educ), max(cps$educ), length.out=100)
lines(x, dnorm(x, mean=mean(cps$educ), sd=sd(cps$educ)), col="blue")
#
hist(cps$exper, freq = FALSE)
rug(cps$exper)
x <- seq(min(cps$exper), max(cps$exper), length.out=100)
lines(x, dnorm(x, mean=mean(cps$exper), sd=sd(cps$exper)), col="blue")
## b
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
hist(cps$educ, freq = FALSE, ylim=c(0, 0.5))
rug(cps$educ)
lines(density(cps$educ), col="red")
lines(density(cps$educ, adjust=2), col="blue")
hist(cps$exper, freq = FALSE)
rug(cps$exper)
lines(density(cps$exper), col="red")

