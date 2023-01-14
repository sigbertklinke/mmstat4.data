## -----------------------------------------------------------------------------------------------------
## a
library("mmstat4")
gss <- ghload("data/gss.rds")
lm1 <- lm(educ~speduc+paeduc+rincmdol+tvhours, data=gss, x=TRUE)
summary(lm1)
plot(lm1)
## b
ind <- as.integer(row.names(lm1$x))
opar <- par(mfrow=c(2,3))
on.exit(par(opar))
plot(rstudent(lm1)~predict(lm1))
lines(loess(rstudent(lm1)~predict(lm1)),  col="red")
plot(rstudent(lm1)~gss$speduc[ind])
plot(rstudent(lm1)~gss$paeduc[ind])
plot(rstudent(lm1)~gss$rincmdol[ind])
plot(rstudent(lm1)~gss$tvhours[ind])
plot(rstudent(lm1)~gss$maeduc[ind])
## c
opar <- par(mfrow=c(2,2))
on.exit(par(opar))
vars <- names(lm1$coefficients)
for (i in 2:length(vars)) {
  lmi <- lm(gss$educ~gss[[vars[i]]])
  plot(gss[[vars[i]]], gss$educ, ylab="educ", xlab=vars[i], main=sprintf("R^2=%.3f", summary(lmi)$r.squared))
  abline(lmi, col="blue")
} 

