## ------------------------------------------------------------------------------------------------------------------------
#a
library("rio")
gss <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
#
chi2 <- chisq.test(gss$hapmar, gss$happy)
chi2$statistic
#b theory
tab <- table(gss$hapmar, gss$happy)
chisq.test(tab)$statistic
chisq.test(3*tab)$statistic
#c
chisq.test(gss$hapmar, gss$happy, simulate.p.value = T)
#d
library("vcd")
tab <- table(gss$hapmar, gss$happy)
tab # column: hapmar, row: general happiness
assocstats(tab)

