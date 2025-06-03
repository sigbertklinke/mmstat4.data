## -------------------------------------------------------------------------------------------------------------------------------------
## a
p <- seq(0,1, by=0.01)
# LS
ep  <- 1-3*p
ls  <- (-1-ep)^2+3*(0-ep)^2+2*(1-ep)^2
pos <- which.min(ls)
plot(p, ls, type="l")
text(0, 25, sprintf("xmin=%.2f, lsmin=%.3f", p[pos], ls[pos]), pos=4)
## b
ls <- function(p, obs) {
  ep <- 1-3*p
  sum(obs[1]*(-1-ep)^2+obs[2]*(0-ep)^2+obs[3]*(1-ep)^2)
}
#
library("extraDistr")
B    <- 1000
phat <- rep(NA, B)
obs  <- rmnom(B, size=6, prob=c(1,1,2)) # E(X) = 1-3*p
# E(X) = -1 *1/4 + 0 * 1/4 + 1 *2/4 = 1/4 <=> p=1/4
head(obs)
for (i in 1:B) phat[i] <- optimise(ls, c(0,1), obs=obs[i,])$minimum
hist(phat)
rug(phat)
## c
B <- 1000
phat <- rep(NA, B)
obs <- rmnom(B, size=6, prob=c(1,7,4)) # E(X) = 1-3*p
# E(X) = -1 *1/12 + 0 * 7/12 + 1 *4/12 = 1/4
head(obs)
for (i in 1:B) phat[i] <- optimise(ls, c(0,1), obs=obs[i,])$minimum
hist(phat)
rug(phat)
## d
llik <- function(p, obs) {
(obs[1]+obs[2])*log(p)+obs[3]*log(1-2*p)
}
#
p <- seq(0, 0.5, by=0.01)
llikp <- llik(p, c(1,3,2))
pos <- which.max(llikp)
plot(p, llikp, type="l")
text(0, -18, sprintf("xmax=%.2f, lsmax=%.3f", p[pos], llikp[pos]), pos=4)
## e
B <- 1000
phat <- rep(NA, B)
obs <- rmnom(B, size=6, prob=c(1,1,2)) # E(X) = 1-3*p
# c(1/4, 1/4, 1/2)
head(obs)
for (i in 1:B) phat[i] <- optimise(llik, c(0, 0.5), obs=obs[i,],maximum = TRUE)$maximum
hist(phat)
rug(phat)
## f
B <- 1000
phat <- rep(NA, B)
obs <- rmnom(B, size=6, prob=c(1,7,4))
# c(1/12, 7/12, 1/3)
head(obs)
for (i in 1:B) phat[i] <- optimise(llik, c(0, 0.5), obs=obs[i,],maximum = TRUE)$maximum
hist(phat)
rug(phat)

