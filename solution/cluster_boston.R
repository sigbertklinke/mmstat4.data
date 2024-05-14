## ---------------------------------------------------------------------------------------------------------------------------------
data("boston", package="spData")
## a
bhd  <- boston.c[,c(6, 8:10, 12:15, 17:20)]
bhds <- scale(bhd)
d    <- dist(bhds)
hc   <- hclust(d, "ward.D2")
plot(hc)  # 2 cluster
## b
c2   <- cutree(hc,2)
km   <- kmeans(bhds, 2)
table(c2, km$cluster)
## c
ctrs <- rbind(colMeans(bhds[c2==1,]), colMeans(bhds[c2==2,]))
kmh  <- kmeans(bhds, ctrs)
table(kmh$cluster, c2)
## d
library("psych")
col <- 1+(c2-1) + 2*(kmh$cluster-1)
pa <- principal(bhds, 2)
plot(as.data.frame(pa$scores), col=col, pch=19, sub="green = different assignment")

