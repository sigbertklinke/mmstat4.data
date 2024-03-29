data(Boston, package="MASS")
lm <- lm (medv~., data=Boston)
library("mctest")
ep <- eigprop(lm)
library("xtable")
tab <- cbind(EV=ep$ev, CI=ep$ci, ep$pi)
xtb <- xtable(tab, digits=2)
writeLines(print(xtb, scalebox = 0.7, print.results = FALSE), "collinearity.tex")