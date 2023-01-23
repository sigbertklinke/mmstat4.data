library("MASS")
q <- 0.2
# MCAR
xmcar <- Boston
mcar  <- (runif(nrow(Boston))<q)
xmcar$medv[mcar] <- NA
# MAR
xmar <- Boston
logl <- scale(log(Boston$lstat))
p    <- 2*q*pnorm(logl)
mar  <- (p>runif(nrow(Boston)))
xmar$medv[mar] <- NA
# MNAR
xmnar <- Boston
q2    <- quantile(xmnar$medv, 1-q)
mnar  <- (xmar$medv>q2)
xmnar$medv[mnar] <- NA
