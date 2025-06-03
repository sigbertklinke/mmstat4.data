## -------------------------------------------------------------------------------------------------------------------------------------
library("MASS")
## a
lmfull <- lm(medv~., data=Boston)
summary(lmfull)
#
lmaic <- stepAIC(lmfull, direction="backward")
summary(lmaic)
lmbic <- stepAIC(lmfull, direction="backward", k=log(nrow(Boston)))
summary(lmbic)
lmaic
lmbic
## b 
lmridge <- lm.ridge(medv~., data=Boston, lambda=seq(0, 10, 0.01))
select(lmridge)
#
plot(lmridge$lambda, lmridge$GCV, type="l", xlab=expression(lambda), ylab="Mean squared error", main="Generalized crossvalidation")
abline(v=lmridge$lambda[which.min(lmridge$GCV)], col="red")
lm.ridge(medv~., data=Boston, lambda=4.26)
## c
pc <- princomp(Boston[,-14])
pcd <- data.frame(medv=Boston$medv, pc$score)
plot(1:13, pc$sdev^2, type="b")

lmpc <- lm(medv~., data=pcd)
summary(lmpc)
## d
library("glmnet")
x <- as.matrix(Boston[,-14])
y <- Boston[,14]
lmlasso <- cv.glmnet(x, y, lambda=seq(0, 1, 0.001))
plot(lmlasso)
lmlasso$lambda.min
lmlasso$lambda.1se
coef(lmlasso, s="lambda.1se")
## e
library("mgcv")
am <- gam(medv~s(crim)+s(zn)+s(indus)+chas+s(nox)+s(rm)+s(age)+s(dis)+rad+s(tax)+s(ptratio)+s(black)+s(lstat), data=Boston)
summary(am)
opar <- par(mfrow=c(3,4))
on.exit(par(opar))
plot(am)
## f
# ridge excluded
yh <- data.frame(full=predict(lmfull), aic=predict(lmbic), bic=predict(lmbic), pc=predict(lmpc),
                 lasso=predict(lmlasso, newx=x, s="lambda.1se"), am=predict(am))
# R^2
1-colSums((yh-Boston$medv)^2)/sum((Boston$medv-mean(Boston$medv))^2)

