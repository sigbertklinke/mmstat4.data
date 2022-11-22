## ------------------------------------------------------------------------------------------------------------------------
gss <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
#str(gss)
names(gss)
#
opar <- par(mfrow=c(1,2))
on.exit(par(opar))
plot(table(gss$sibs))
plot(table(gss$educ))
describe(gss$sibs)
describe(gss$educ)

