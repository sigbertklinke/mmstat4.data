data(Boston, package="MASS")
library("car")
op <- par(mfrow=c(1,2))
# Box-Cox
hist(Boston$crim, main="crim")
bccrim <- bcPower(Boston$crim, 0)
hist(bccrim, main="bcPower(crim,0)")
#
library("Transform")
out <- bcTransform(Boston$crim)
str(out)
par(op)