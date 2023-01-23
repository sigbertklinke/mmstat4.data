library("mmstat4")
thousand_songs <- ghload("1000songs.rds")
#
tab <- table(thousand_songs$BAND, thousand_songs$THEME)
tab2 <- outer(apply(tab,1,sum), apply(tab,2,sum))/sum(tab)
pdf("mosaic3.pdf", bg="transparent")
plot(as.table(tab2), col=rainbow(7), las=1, main="")
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/","mosaic3.pdf"))