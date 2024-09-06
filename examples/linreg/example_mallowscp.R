library("olsrr")
bhd <- MASS::Boston[,-c(4,9)]
lmf <- lm(medv~., data=bhd)
all <- ols_step_all_possible(lmf)[[1]]
lim <- range(all$n)
par(mfrow=c(1,2))
plot(all$n, all$cp, cex=0.5, main="All Cp") #, xlim=lim, ylim=lim)
plot(all$n, all$cp, xlim=lim, ylim=c(1, 2*max(all$n)), main="Cp plot")
lines(lim, lim)
