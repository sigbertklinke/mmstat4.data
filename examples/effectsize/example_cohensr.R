library("effectsize")
data(Boston, package="MASS")
index  <- sample(nrow(Boston), 300)
# Cohens r
xind   <- index[Boston$chas[index]==0]
yind   <- index[Boston$chas[index]==1]
d      <- cohens_d(x=Boston$medv[xind], y=Boston$medv[yind])
d
d_to_r(d$Cohens_d, length(xind), length(yind))
#
t <- t.test(x=Boston$medv[xind], y=Boston$medv[yind])
t_to_d(t$statistic, t$parameter)
effectsize(t)  # for htest objects