## ------------------------------------------------------------------------------------------------------------------------
library("rio") 
bank2 <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
## a.i
library("MASS")
parcoord(bank2)
col <- c(rep(3, 100), rep(2, 100))
parcoord(bank2, col=col)
## a.ii
# devtools::install_github("sigbertklinke/smvgraph")
library("smvgraph")
andrews(bank2)
#
andrews(bank2, col=col)
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
plot(Boston$lstat, Boston$medv)
## b.ii
parcoord(Boston)
## b.iii
andrews(Boston)
## b.iv
o <- order(apply(bank2, 2, IQR), decreasing=TRUE)
parcoord(Boston[,o])
andrews(Boston[,o])

