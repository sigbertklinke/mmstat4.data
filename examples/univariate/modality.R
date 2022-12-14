n  <- 1000
x1 <- rnorm(n)
x2 <- c(rnorm(n/2, mean=-2), rnorm(n/2, mean=2))
x3 <- c(rnorm(0.6*n, mean=-3), rnorm(0.2*n, mean=2),  rnorm(0.2*n, mean=6))
set.seed(0)
pdf("modality.pdf", width=10, height=3, bg="transparent")
par(mfrow=c(1,3))
hist(x1, axes=F, xlab="", ylab="", main="Unimodal", cex.main=3)
abline(v=mean(x1), lwd=2, col="red")
rug(x1)
hist(x2, axes=F, xlab="", ylab="", main="Bimodal", cex.main=3)
abline(v=mean(x2), lwd=2, col="red")
rug(x2)
hist(x3, axes=F, xlab="", ylab="", main="Multimodal", cex.main=3)
abline(v=mean(x3), lwd=2, col="red")
rug(x3)
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/modality.pdf"))
