## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
bank2 <- ghload("data/bank2.rds")
## a.i
library("MASS")
parcoord(bank2)
col <- c(rep(3, 100), rep(2, 100))
parcoord(bank2, col=col)
## a.ii
# devtools::install_github("sigbertklinke/smvgraph")
library("andrews")
andrews(bank2, ymax=NA)
# each datapoint a different color
library("viridisLite")
andrews(bank2, clr=viridis(nrow(bank2)), ymax=NA)
#
andrews(bank2, clr=col, ymax=NA)
## a.iv
o <- order(apply(bank2, 2, IQR), decreasing=TRUE)
o
x <- scale(bank2[,o])
andrews(x, col=col)
## b
data("Boston", package="MASS")
## b.i
library("scagnostics")
s <- scagnostics(Boston)
#s
s["Monotonic",]
which.max(s["Monotonic",])
plot(Boston$nox, Boston$dis)    # 0.760
plot(Boston$lstat, Boston$medv) # 0.749
## b.ii
parcoord(Boston)
## b.iii
andrews(Boston, ymax=NA)
## b.iv
o <- order(apply(bank2, 2, IQR), decreasing=TRUE)
parcoord(Boston[,o])
andrews(Boston[,o], ymax=NA)

