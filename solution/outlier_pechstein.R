## ------------------------------------------------------------------------------------------------------------------------
### a-c
library('rio')
pechstein <- import("https://shinyapps.wiwi.hu-berlin.de/d/pechstein.sav")[-30,]
str(pechstein)
#
# see https://en.wikipedia.org/wiki/Reticulocyte
# norm values: 0.5% to 2.5% 
hist(pechstein$RETIKULOZYTEN)
rug(pechstein$RETIKULOZYTEN)
abline(v=2.5, col="red")
boxplot(pechstein$RETIKULOZYTEN, horizontal = TRUE)
### d
library("robustbase")
out <- adjOutlyingness(pechstein$RETIKULOZYTEN, ndir=1)
boxplot(out$adjout, horizontal = TRUE)
rug(out$adjout)

