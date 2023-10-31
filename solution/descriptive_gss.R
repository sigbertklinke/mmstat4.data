## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
gss <- ghload("data/gss.rds")
#str(gss)
names(gss)
#
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
plot(table(gss$sibs))
plot(table(gss$educ))
describe(gss$sibs)
describe(gss$educ)

