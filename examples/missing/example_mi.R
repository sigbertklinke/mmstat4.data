# run example_mice.R before
library("mmstat4")
ghsource('missing/example_mice.R')
#
library("mitools")
# extract
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))
