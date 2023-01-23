library("mmstat4")
bank2 <- ghload("bank2.rds")
#
pdf("pca_proj.pdf", width=10, height=6)
np  <- 3
col <- rainbow(3)
layout(matrix(c(1,1,1,2,2,1,1,1,3,3,1,1,1,4,4), 3, 5, byrow=T))
tv <- var(bank2$UPPER)+var(bank2$DIAGONAL)
rg <- range(bank2$UPPER)
xb <- colMeans(cbind(bank2$UPPER, bank2$DIAGONAL))
plot(bank2$UPPER, bank2$DIAGONAL, pch=19, main=sprintf("Total variance: %.2f", tv))
alpha <- vector("list", np)
for (i in 1:np) {
  alphai <- rnorm(2)
  alpha[[i]] <- alphai/sqrt(sum(alphai^2))
  t     <- (rg-xb[1])/alphai[1]
  lines(rg, xb[2]+alphai[2]*t, lwd=2, col=col[i])
}
for (i in 1:np) {
  xta   <- cbind(bank2$UPPER, bank2$DIAGONAL)%*%alpha[[i]]
  dns   <- density(xta)
  plot(dns, main=sprintf("Variance: %.2f", var(xta)), sub=sprintf("Explained variance: %.0f%%", var(xta)/tv*100))
  polygon(dns, col=col[i], border="black")
  rug(xta)
}
dev.off()
