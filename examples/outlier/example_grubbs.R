library("MASS")  # for Boston Housing data
library("outliers")
set.seed(0)
crim <- sample(Boston$crim, 200)
grubbs.test(crim)
grubbs.test(crim, opposite=T)