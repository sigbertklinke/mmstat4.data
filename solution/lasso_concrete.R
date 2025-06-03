## -------------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
concrete <- ghload("data/concrete.rds")
## a 
library("MASS")
lm1 <- lm(Strength~.-Slump-Flow, data=concrete, x=TRUE)
summary(lm1)
# Backward regression
lmb <- stepAIC(lm1, direction = "backward", x=TRUE)
## b
lr <- lm.ridge(Strength~.-Slump-Flow, data=concrete, lambda=seq(0, 3, by=0.1))
select(lr)
plot(lr$lambda, lr$GCV, type="l", xlab=expression(lambda), ylab="Mean squared error", main="Generalized crossvalidation")
abline(v=1)
plot(lr)
lm1$coefficients
lr <- lm.ridge(Strength~.-Slump-Flow, data=concrete, lambda=1)
lr
## c
library("glmnet")
x <- as.matrix(concrete[,1:7])
y <- concrete[,10]
lmenet<- cv.glmnet(x, y, alpha=0.5)
plot(lmenet)
lmenet$lambda.min
lmenet$lambda.1se
lm1
coef(lmenet, s="lambda.1se")
coef(lmenet, s="lambda.min")
#
plot(lmb) # fitted vs. residuals, qq plot
opar <- par(mfrow=c(2,3))
on.exit(par(opar))
for (i in 2:ncol(lmb$x)) {
  plot(lmb$x[,i], rstudent(lmb), main=colnames(lmb$x)[i])
  lines(lowess(lmb$x[,i], rstudent(lmb)), col="red")
}
#
sdb <- dfbetas(lmb)
for (i in 1:ncol(sdb)) {
  plot(sdb[,i], main=colnames(sdb)[i])
  abline(h=c(-2,2)/sqrt(nrow(sdb)), col="red")
}
# Leverage
opar <- par(mfrow=c(1,1))
on.exit(par(opar))
plot(hatvalues(lmb))
abline(h=(1:3)*ncol(lmb$x)/nrow(lmb$x), col=c("black", "darkred", "red"))
# Cook
plot(cooks.distance(lmb), pch=19, main="Cook's distances", cex=0.5)
abline(h=4/nrow(sdb), col="red")

