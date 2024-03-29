library("mmstat4")
ghsource("missing/generate_missing.R")
library("Amelia")
library("mitools")
# run NORM
aobj <- amelia(xmar, noms=c("chas","rad"))
# compute linear regressions
models <- lapply(aobj$imputations, function(x) {
  lm(medv~lstat, data=x)
})
# look at one model
summary(models[[1]])
# extract
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))
