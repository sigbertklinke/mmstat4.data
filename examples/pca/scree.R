library("mmstat4")
library("psych")
bank2 <- ghload("bank2.rds")
#
pdf("scree.pdf", width=10, height=7, bg="transparent")
par(mfrow=c(1,2))
pc <- prcomp(bank2, scale=T, center=T)
plot(pc$sdev^2, type="b", ylim=c(0, max(pc$sdev^2)), main="Scree plot (handmade)")
scree(bank2, main="Scree plot (psych)")
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/scree.pdf"))

