## ------------------------------------------------------------------------------------------------------------------------
## a
library("rio")
gss <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
cor(gss$husbeduc, gss$wifeduc)
cor(gss$husbeduc, gss$wifeduc, use="complete.obs")
## b
lmh <- lm(husbeduc~wifeduc, data=gss)
summary(lmh)
lmw <- lm(wifeduc~husbeduc, data=gss)
summary(lmw)
## c
subset <- (gss$wifeft==1)
lmh <- lm(husbeduc~wifeduc, data=gss, subset=subset)
summary(lmh)
lmw <- lm(wifeduc~husbeduc, data=gss, subset=subset)
summary(lmw)

