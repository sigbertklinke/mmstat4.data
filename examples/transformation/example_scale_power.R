data(Boston, package="MASS")
library("car")    
# scale
summary(Boston$crim)
sccrim <- scale(Boston$crim)
summary(sccrim)
# Power
op <- par(mfrow=c(1,2))
hist(Boston$crim, main="crim")
spcrim <- basicPower(Boston$crim, -0.1)  
hist(spcrim, main="basicPower(crim, -0.1)")
par(op)