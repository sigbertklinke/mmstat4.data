## ------------------------------------------------------------------------------------------------------------------------
library("rio")
gss <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
names(gss)
### a
cor(gss$paeduc, gss$maeduc)  # NA!
cor(gss$paeduc, gss$maeduc, use="complete.obs")
### b
cor(gss$incomdol, gss$rincmdol, use="complete.obs")
plot(gss$incomdol, gss$rincmdol, pch=19, cex=0.5)

