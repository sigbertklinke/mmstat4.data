data(Boston, package="MASS")
library("psych")
#
summary(Boston$medv)
fivenum(Boston$medv)
describe(Boston$medv)
