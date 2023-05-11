## -----------------------------------------------------------------------------------------------------------------------
### a-c
library("mmstat4")
pechstein <- ghload("data/pechstein.rds")
str(pechstein)
#
# see https://en.wikipedia.org/wiki/Reticulocyte
# norm values: 0.5% to 2.5% 
hist(pechstein$Retikulozyten)
rug(pechstein$Retikulozyten)
abline(v=2.5, col="red")
boxplot(pechstein$Retikulozyten, horizontal = TRUE)
### d
library("robustbase")
out <- adjOutlyingness(pechstein$Retikulozyten, ndir=1)
boxplot(out$adjout, horizontal = TRUE)
rug(out$adjout)

