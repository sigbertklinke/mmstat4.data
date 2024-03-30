mmstat4::ghsource("missing/generate_missing.R")
library("mlmi")
library("mitools")
# run NORM
nobj <- normImp(xmar, M=5, rseed=1)
# compute linear regressions
models <- lapply(nobj, function(x) {
  lm(medv~lstat, data=x)
})
# look at one model
summary(models[[1]])
# extract
beta <- MIextract(models, fun="coef")
vcov <- MIextract(models, fun="vcov")
summary(MIcombine(beta, vcov))
summary(MIcombine(models))
