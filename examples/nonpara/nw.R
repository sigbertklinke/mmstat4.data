grid1 <- function (x, n=500) {
  r <- range(x)
  return (r[1]+diff(r)*(0:n)/n)
}

library("np")
data("Boston", package="MASS")
x <- lapply(Boston, as.numeric)
#
xn <- data.frame(lstat=grid1(x$lstat))
pdf("nw.pdf", width=10, height=6)
plot(x$lstat, x$medv, cex=0.5, xlab="Percentage of lower status people", ylab="Median house prices")

nw1 <- npreg(medv~lstat, data=x)
yh  <- predict(nw1, newdata=xn)
lines(xn$lstat, yh, lwd=2)

nw2 <- npreg(medv~lstat, data=x, bws=5*nw1$bw)
yh  <- predict(nw2, newdata=xn)
lines(xn$lstat, yh, lwd=2, col="green")

nw3 <- npreg(medv~lstat, data=x, bws=2.5*nw1$bw)
yh  <- predict(nw3, newdata=xn)
lines(xn$lstat, yh, lwd=2, col="blue")

nw4 <- npreg(medv~lstat, data=x, bws=0.5*nw1$bw)
yh  <- predict(nw4, newdata=xn)
lines(xn$lstat, yh, lwd=2, col="red")

legend("topright", legend=sprintf("h=%.3f", c(nw4$bw, nw1$bw, nw3$bw, nw2$bw)), col=c("red", "black", "blue", "green"), lwd=2)
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/nw.pdf"))
