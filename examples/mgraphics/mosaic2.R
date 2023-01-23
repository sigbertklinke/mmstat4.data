library("mmstat4")
thousand_songs <- ghload("1000songs.rds")
thousand_songs <- ghload("1000songs.rds")
#
pdf("mosaic2.pdf", bg="transparent")
plot(table(thousand_songs$THEME, thousand_songs$BAND), col=rainbow(7), las=1, main="")
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/","mosaic2.pdf"))