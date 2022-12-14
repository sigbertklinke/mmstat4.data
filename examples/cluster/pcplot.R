library("cluster")
hc   <- hclust(dist(USArrests))
clus <- cutree(hc, 3)
col  <- c('black', 'blue', 'red')
pdf("pcplot.pdf")
clusplot(USArrests, clus, col.p=col[clus], plotchar=F, pch=19, cex=0.75)
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/pcplot.pdf"))
