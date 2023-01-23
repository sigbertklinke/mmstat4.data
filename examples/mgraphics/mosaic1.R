library("mmstat4")
thousand_songs <- ghload("1000songs.rds")
#
pdf("mosaic1.pdf", bg="transparent")
plot(table(thousand_songs$BAND, thousand_songs$THEME), col=rainbow(7), las=1, main="")
if (interactive()) browseURL(paste0(getwd(),"/","mosaic1.pdf"))