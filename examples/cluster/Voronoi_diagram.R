library("deldir")
y  <- iris$Sepal.Width
x  <- iris$Sepal.Length
pdf('Voronoi_diagram.pdf', width=10)
plot(x,y, type="n", xlab="", ylab="", axes=F, asp=T)
cl <- kmeans(cbind(x,y), 40)
vtess <- deldir(cl$centers[,1], cl$centers[,2])
points(cl$centers[,1], cl$centers[,2], pch=19, col="red", cex=0.75)
points(x, y, pch=19, col="blue", cex=0.5)
plot(vtess, wlines="tess", number=FALSE, add=TRUE,
     cmpnt_col=c(tess="grey"), cmpnt_lty=(tess=1)) # wpoints="none", col="grey")
box()
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/Voronoi_diagram.pdf"))
