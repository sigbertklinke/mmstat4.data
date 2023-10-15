library("effectsize")
data(Boston, package="MASS")
# one sample
index  <- sample(nrow(Boston), size=100)
d      <- cohens_d(Boston$medv[index], mu=10)
d
interpret_cohens_d(d)
# two samples
xind   <- index[Boston$chas[index]==0]
yind   <- index[Boston$chas[index]==1]
d      <- cohens_d(x=Boston$medv[xind], y=Boston$medv[yind])
d
interpret_cohens_d(d)