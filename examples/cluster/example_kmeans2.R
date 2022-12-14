zfaithful <- apply(faithful, 2, scale)
# k-median
library("flexclust")
cl1 <- kcca(zfaithful, 4, family=kccaFamily('kmedians'))
plot(zfaithful, col=cl1@second)
cl1@centers
# k-medoid
library("cluster")
cl2 <- pam(zfaithful, 5)
plot(zfaithful, col=cl2$clustering)
cl2$medoids