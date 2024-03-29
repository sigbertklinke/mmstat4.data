library("foreign")
library("psych")
library("mmstat4")
bank2 <- ghload("bank2.rds")
pc  <- principal(bank2, nfactors = 2, rotate="none")
pcc <- cor(cbind(pc$scores, bank2))[-(1:2),1:2]

pdf("pca_corr.pdf")
par(mfrow=c(1,1))
plot(pcc, xlim=c(-1,1), ylim=c(-1,1), pch=19, asp=1)
symbols(0,0,circles=1, inches=F, add=T)
abline(h=0, v=0)
for(i in 1:6) lines(c(0,pcc[i,1]), c(0,pcc[i,2]), col="gray", lwd=2)
text(pcc, rownames(pcc), pos=1)
dev.off()
#
library("xtable")
xtab <- xtable(pcc, caption="PCA with standardized data")
print(xtab,  file="pcc.tex")
#
if (interactive()) browseURL(paste0(getwd(),"/pca_corr.pdf"))
