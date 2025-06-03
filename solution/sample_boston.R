## -------------------------------------------------------------------------------------------------------------------------------------
## a
# It is not a sample, it is the population!
## b
data("Boston", package="MASS")
mean(Boston$medv)     # population/true mean
median(Boston$medv)   # population/true median
## c
n     <- 100
index <- sample(nrow(Boston), replace = TRUE, size=n)
table(index)
sBoston <- Boston[index,]
mean(sBoston$medv)    # sample mean
median(sBoston$medv)  # sample mean
## d
B <- 100
means <- medians <- rep(NA, B)
for (i in 1:B) {
  index <- sample(nrow(Boston), replace = TRUE, size=n)
  sBoston <- Boston[index,]
  means[i] <- mean(sBoston$medv)
  medians[i] <- median(sBoston$medv)
}
old <- par(mfrow=c(1,2))
on.exit(par(old))
hist(means, main="Means")     # random sampling function Xbar
hist(medians, main="Medians") # random sampling function for median
## e
alpha <- 0.05                 # conf level 1-alpha=0.95
c <- qnorm(1-alpha/2)
B <- 50
means <- upper <- lower <- rep(NA, B)
for (i in 1:B) {
  index   <- sample(nrow(Boston), replace = TRUE, size=100)
  sBoston <- Boston[index,]
  means[i] <- mean(sBoston$medv)
  upper[i] <- means[i]+c*sd(sBoston$medv)/sqrt(n)
  lower[i] <- means[i]-c*sd(sBoston$medv)/sqrt(n)
}
m <- mean(Boston$medv)
sum((lower<=m) & (m<=upper))/B

