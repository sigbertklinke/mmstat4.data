library("mmstat4")
cps78_85 <- ghload("cps.rds")
# select only year=85
x <- cps78_85[cps78_85$year==85,]
#
library("rpart")
library("rpart.plot")
fit<-rpart(lwage~educ+exper, data=x)
pdf("RCART1a.pdf", width=5, height=10)
rpart.plot(fit)
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/RCART1a.pdf"))
