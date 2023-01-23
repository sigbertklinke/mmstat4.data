# run example_mice.R before
ghsource('missing/example_mice.R')
#
library("mitools")
# extract
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))
