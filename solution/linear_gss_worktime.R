## -------------------------------------------------------------------------------------------------------------------------------------
## a
library("mmstat4")
gss <- ghload("data/gss.rds")
subset <- (gss$wrkstat==1)
plot(gss$hrs1[subset], gss$educ[subset])
## b
plot(gss$hrs1[subset], gss$educ[subset], col=gss$sex[subset])
## c+d
lmfull <- lm(hrs1~educ, data=gss, subset=subset)
summary(lmfull)
plot(gss$educ[subset], gss$hrs1[subset], col=gss$sex[subset])
abline(lmfull)
subsetm <- subset & (gss$sex==1)
lmmale <- lm(hrs1~educ, data=gss, subset=subsetm)
abline(lmmale, col="blue")
subsetf <- subset & (gss$sex==2)
lmfemale <- lm(hrs1~educ, data=gss, subset=subsetf)
abline(lmfemale, col="red")
summary(lmfull)
summary(lmmale)
summary(lmfemale)

