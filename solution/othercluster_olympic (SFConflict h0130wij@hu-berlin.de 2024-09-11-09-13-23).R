## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
olymp <- ghload("data/olympic.rds")
names(olymp)
dec  <- olymp[,-c(1,12)]
sdec <- scale(dec)
## a
d  <- dist(sdec)
hc <- hclust(d, "ward.D")
plot(hc)
memb    <- cutree(hc, 2)
centers <- rbind(apply(sdec[memb==1,], 2, mean), apply(sdec[memb==2,], 2, mean))
kc <- kmeans(sdec, centers)
table(kc$cluster, memb)
## b
library("mclust")
em <- Mclust(sdec)
plot(em, "BIC")
#
em2 <- Mclust(sdec, G=2, modelNames = "EII")
table(em2$classification, memb)
## c
#devtools::github_install("sigbertklinke/smvgraph")
#library("smvgraph")
#sdbscan(sdec)
## d
library("cluster")
shc <- silhouette(memb, dist(sdec))
plot(shc)
#
skc <- silhouette(kc$cluster, dist(sdec))
plot(skc)
## e: hclust

