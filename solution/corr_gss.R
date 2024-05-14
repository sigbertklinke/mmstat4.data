## ---------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
gss <- ghload("data/gss.rds")
names(gss)
### a
cor(gss$paeduc, gss$maeduc)  # NA!
cor(gss$paeduc, gss$maeduc, use="complete.obs")
### b
cor(gss$incomdol, gss$rincmdol, use="complete.obs")
plot(gss$incomdol, gss$rincmdol, pch=19, cex=0.5)

