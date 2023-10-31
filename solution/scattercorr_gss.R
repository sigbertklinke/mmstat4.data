## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
gss <- ghload("data/gss.rds")
names(gss)
### a+b
educc <- complete.cases(cbind(gss$husbeduc, gss$wifeduc)) 
plot(gss$husbeduc[educc], gss$wifeduc[educc]) # overplotting
sunflowerplot(gss$husbeduc[educc], gss$wifeduc[educc])
### c
cor(gss$husbeduc, gss$wifeduc, use="complete.obs")
### d
cor(gss$husbeduc[gss$wifeft==0], gss$wifeduc[gss$wifeft==0], use="complete.obs")
cor(gss$husbeduc[gss$wifeft==1], gss$wifeduc[gss$wifeft==1], use="complete.obs")

