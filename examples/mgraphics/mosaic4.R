library("mmstat4")
thousand_songs <- ghload("1000songs.rds")
#
m <- matrix(c(6,4,-10,-2, -2, 4, -4, -2, 6), nrow=3)
tab <- table(thousand_songs$BAND, thousand_songs$THEME)
tab2 <- outer(apply(tab,1,sum), apply(tab,2,sum))/sum(tab)
tab2[4:6,1:3] <- tab2[4:6,1:3]+m
tab2[1:3,5:7] <- tab2[1:3,5:7]+m
pdf("mosaic4.pdf", bg="transparent")
plot(as.table(tab2), col=rainbow(7), las=1, main="")
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/","mosaic4.pdf"))