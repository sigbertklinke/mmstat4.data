## -----------------------------------------------------------------------------------------------------------------------
data("boston", package="spData")
## a
bhd  <- boston.c[,c(6, 8:10, 12:15, 17:20)]
bhds <- scale(bhd)
d    <- dist(bhds)
## a
d  <- dist(bhds)
hc <- hclust(d, "ward.D")
plot(hc, labels = FALSE)
library("NbClust")
NbClust(bhds, method="ward.D")
## b
memb    <- cutree(hc, 2)
centers <- rbind(apply(bhds[memb==1,], 2, mean), apply(bhds[memb==2,], 2, mean))
kc <- kmeans(bhds, centers)
table(kc$cluster, memb)
## c
opar <- par(mfrow=c(1,1))
library("mclust")
em <- Mclust(bhds)
plot(em, "BIC")
#
em2 <- Mclust(bhds, G=2, modelNames = "EII")
table(em2$classification, memb)
## d
#devtools::github_install("sigbertklinke/smvgraph")
#library("smvgraph")
#sdbscan(bhds)
## e
library("cluster")
shc <- silhouette(memb, dist(bhds))
plot(shc)
#
skc <- silhouette(kc$cluster, dist(bhds))
plot(skc)
## e: hclust

