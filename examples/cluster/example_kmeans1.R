x <- mmstat4::ghload("data/bank2.rds")
z <- scale(x)
#
kx <- kmeans(x, c=2)
plot(x$LOWER, x$DIAGONAL, col=kx$cluster,
     main="Unstandardized", pch=19)
kx$centers
scale(kx$centers, center=colMeans(x), scale=apply(x, 2, sd))
#
kz <- kmeans(z, c=2)
plot(x$LOWER, x$DIAGONAL,
     col=kz$cluster, main="Standardized", pch=19)
