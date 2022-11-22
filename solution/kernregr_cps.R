## ------------------------------------------------------------------------------------------------------------------------
library("rio")
cps   <- import("https://shinyapps.wiwi.hu-berlin.de/d/CPS78-85.sav")
cps85 <- subset(cps, cps$year==85)
## a
plot(cps85$exper, cps85$lwage)
lines(lowess(cps85$exper, cps85$lwage), col="red", lwd=2)
plot(cps85$educ, cps85$lwage)
lines(lowess(cps85$educ, cps85$lwage), col="red", lwd=2)
## 
library("np")
model <- npreg(lwage~educ+exper, data=cps85)
plot(model, theta=135+180, phi=20, view="fixed")

