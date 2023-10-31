## ----------------------------------------------------------------------------------------------------------------
## a
# 1: use absolute value
# 2: sgn(x_i-xbar)*sgn(y_i-y_bar)
# 3: trim outlying values
## b
trim_sd <- function(x, trim=0.2, ...) {
  z   <- scale(x)
  out <- adjOutlyingness(z, ...)
  out$adjout<quantile(out$adjout, 1-trim)
}
#
library("robustbase")
library("MASS")
bhd <- Boston[,-c(4,9)]
trim<- trim_sd(bhd, ndir=2500, mcEps1 = 1e-9, mcEps2 = 1e-12)
table(trim)
cor(bhd)
cor(bhd[trim,])
cor(bhd)-cor(bhd[trim,])

