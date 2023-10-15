library("effectsize")
data(Boston, package="MASS")
index <- sample(nrow(Boston), 300, replace = FALSE)
x <- Boston$medv[index]
g <- Boston$chas[index]
# distributions
ks.test(x[g==0], x[g==1])
# regression
bhd <- Boston[index,]
lm  <- lm(medv~lstat+rm, Boston)
summary(lm)
library("parameters")
lm(scale(medv)~scale(lstat)+scale(rm), Boston)
standardize_parameters(lm)
r2 <- summary(lm)$r.squared
r2/(1-r2)