library("MASS")
set.seed(0)
index     <- sample(nrow(MASS::Boston), 200, replace = TRUE)
Boston200 <- MASS::Boston[index,]
# 40% mcar missing
mcar <- runif(200)<0.25
# 40% mar missing based on lstat
prob <- 1-(Boston200$lstat-min(Boston200$lstat))/(max(Boston200$lstat)-min(Boston200$lstat))
mar  <- as.logical(rbinom(200, 1, prob/3))
# 40% mar missing based on medv
mnar <- Boston200$medv>quantile(Boston200$medv, 0.75)
#
pdf("missing2.pdf", width=10, height=7)
par(mfrow=c(2,2), mar=c(0,0,3,0))
plot(Boston200$lstat, Boston200$medv, pch=19, cex=0.5, ylim=c(0,max(Boston200$medv)), main="Full sample (x: LSTAT, y: MEDV)", xlab="LSTAT", ylab="MEDV", axes=F)
box()
p    <- 1/4
#mcar <- runif(nrow(Boston))<p
plot(Boston200$lstat, Boston200$medv, pch=19, cex=0.5, ylim=c(0,max(Boston200$medv)), main="MCAR", xlab="LSTAT", ylab="MEDV", col=ifelse(mcar, 'coral', 'black'), axes=F)
box()
rug(Boston200$lstat[mcar], col="coral")
#mar <- abs(Boston200$lstat-median(Boston200$lstat))/IQR(Boston200$lstat)
#mar[mar>1] <- 1
#mar <- runif(nrow(Boston))<(mar*p/mean(mar))
plot(Boston200$lstat, Boston200$medv, pch=19, cex=0.5, ylim=c(0,max(Boston200$medv)), main="MAR", xlab="LSTAT", ylab="MEDV", col=ifelse(mar, 'coral', 'black'), axes=F)
box()
rug(Boston200$lstat[mar], col="coral")
#mnar <- (Boston200$medv>quantile(Boston200$medv, 1-p))
plot(Boston200$lstat, Boston200$medv, pch=19, cex=0.5, ylim=c(0,max(Boston200$medv)), main="MNAR", xlab="LSTAT", ylab="MEDV", col=ifelse(mnar, 'coral', 'black'), axes=F)
box()
rug(Boston200$lstat[mnar], col="coral")
dev.off()
if (interactive()) browseURL("missing2.pdf")
