library("plot.3d")
t <- 2*pi*(0:36)/36
c <- cbind(rep(1/sqrt(2), length(t)), cos(t), sin(t))
obj <- new3d("s", xlab="x1", ylab="x2", zlab="x3", main="projection vectors") %>% 
         lines3d(x=c[,1], y=c[,2], z=c[,3]) %>%
         lines3d(x=-c[,1], y=-c[,2], z=-c[,3])
t <- 2*pi*(0:18)/18
c <- cbind(rep(1/sqrt(2), length(t)), cos(t), sin(t))
for (i in 1:nrow(c)) {
  xi  <- rbind(c[i,], -c[i,])
  obj <- obj %>% lines3d(x=xi[,1], y=xi[,2], z=xi[,3])
}
pdf("andrews_proj.pdf")
plot3d(obj)
dev.off()
