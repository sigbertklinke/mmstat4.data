## -------------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
gss <- ghload("data/gss.rds")
### a
dhr <- gss$husbhr-gss$wifehr
hist(dhr)
### b
t.test(gss$husbhr, gss$wifehr, paired=TRUE)
### c
t.test(dhr)

