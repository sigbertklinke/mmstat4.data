## ------------------------------------------------------------------------------------------------------------------------
## a
library("rio") 
bank2 <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
## a.i
pairs(bank2, pch=19, cex=0.5)
## a.ii
col <- ifelse((1:200)>100, "red", "blue")
pairs(bank2, col=col, pch=19, cex=0.5)
## b
data("Boston", package="MASS")
## b.i
df <- Boston[, c("rm", "lstat", "medv")]
pairs(df, pch=19, cex=0.5)
cor(df)
## b.ii
pairs(Boston, pch=19, cex=0.25)
df <- Boston[, -c(4,9)]
pairs(df, pch=19, cex=0.3)

