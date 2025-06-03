## -------------------------------------------------------------------------------------------------------------------------------------
## a+b
names(iris)
iris4  <- iris[,-5]
siris4 <- scale(iris4)
#
cl1 <- kmeans(iris4, 3)
pairs(iris4, col=cl1$cluster)
cl2 <- kmeans(siris4, 3)
pairs(siris4, col=cl2$cluster)
## c
table(cl1$cluster, iris[,"Species"])
table(cl2$cluster, iris[,"Species"])
table(cl1$cluster, cl2$cluster)

