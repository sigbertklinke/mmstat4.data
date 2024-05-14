## ---------------------------------------------------------------------------------------------------------------------------------
library("mmstat4"); 
allbus <- ghload("data/allbus2012.rds")
height <- na.omit(allbus$height)
weight <- na.omit(allbus$weight)
## a
bowley <- c(0.02, 0.09, 0.25, 0.5, 0.75, 0.91, 0.98)
diff(qnorm(bowley))
diff(quantile(weight, bowley))
diff(quantile(height, bowley))
## b
library("moments")
x <- rnorm(1650)
mean(x)
sd(x)
# should be c(1,0,*,0,*,0,*,0,*, ...)
all.moments(x, order.max=5, central=TRUE)
all.moments(weight, order.max=5, central=TRUE)
all.moments(height, order.max=5, central=TRUE)
## b
op <- par(mfrow=c(1,2))
hist(weight, freq=FALSE, main="Weight")
curve(dnorm(x, mean=mean(weight), sd=sd(weight)), add=TRUE, col="blue")
lines(density(weight), col="red")
hist(height, freq=FALSE, main="Height")
curve(dnorm(x, mean=mean(height), sd=sd(height)), add=TRUE, col="blue")
lines(density(height), col="red")
## c
library("car")
qqPlot(weight, pch=19, cex=0.5,  main="Weight")
qqPlot(height, pch=19, cex=0.5,  main="Height")
par(op)
## d
library("nortest")
library("goftest")
# KS
ks.test(weight, "pnorm", mean=mean(weight), sd=sd(weight))
ks.test(height, "pnorm", mean=mean(height), sd=sd(height))
lillie.test(weight)
lillie.test(height)
# CVM
goftest::cvm.test(weight, null="pnorm",  mean=mean(weight), sd=sd(weight))
nortest::cvm.test(weight)
# AD
goftest::ad.test(height, null="pnorm",  mean=mean(weight), sd=sd(weight))
nortest::ad.test(height)
# JB
library("moments")
jarque.test(as.numeric(weight))
jarque.test(as.numeric(height))
# Shapiro
shapiro.test(weight)
shapiro.test(height)

