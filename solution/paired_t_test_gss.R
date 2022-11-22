## ------------------------------------------------------------------------------------------------------------------------
gss   <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
### a
dhr <- gss$husbhr-gss$wifehr
hist(dhr)
### b
t.test(gss$husbhr, gss$wifehr, paired=TRUE)
### c
t.test(dhr)

