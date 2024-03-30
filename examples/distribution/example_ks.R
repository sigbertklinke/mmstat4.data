Boston <- mmstat4::ghload("Boston200.rds")
# Kolmogorov-Smirnov test
ks.test(Boston$medv, "pnorm", mean=mean(Boston$medv),
sd=sd(Boston$medv))
# Lilliefors test
library("nortest")
lillie.test(Boston$medv)
