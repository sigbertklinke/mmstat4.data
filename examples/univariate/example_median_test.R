data(Boston, package="MASS")
#
library("UsingR")
simple.median.test(Boston$medv, mean(Boston$medv))
