## -----------------------------------------------------------------------------------------------------
## a
# X~t_3 : E(X)=0, Var(X)=3/(3-2)=3
sample <- rt(25,3)
sample
## b
llikmu <- function(mu, x) {
  n <- length(x)
  -1/4*sum((x-mu)^2)
}
#
mu <- seq(-3, +3, by=0.01)
ll <- rep(NA, length(mu))
for (i in 1:length(mu)) ll[i] <- llikmu(mu[i], sample)
pos <- which.max(ll)
plot(mu, ll, type="l")
text(0, min(ll), sprintf("xmax=%.2f, lsmax=%.3f", mu[pos], ll[pos]))
## c
B   <- 1000
muh <- rep(NA, B)
for (i in 1:B) {
  sample <- rt(25, 3)
  muh[i] <- optimise(llikmu, c(-3,3), x=sample, maximum = TRUE)$maximum
}
hist(muh)
rug(muh)
## d
kldiv <- function(mu) {
  fun <- function(x, mu) {
    dnorm(x, mean=mu, sd=1/sqrt(2))*log(dnorm(x, mean=mu, sd=1/sqrt(2))/dt(x,3))
  }
  integrate(fun, -5, 5, mu=mu)$value
}
#
mu <- seq(-3, 3, by=0.01)
kl <- rep(NA, length(mu))
for (i in 1:length(mu)) kl[i] <- kldiv(mu[i])
plot (mu, kl, type="l", main="Kullback-Leibler Divergenz", ylim=c(0,max(kl)))
## e
llikmu <- function(musig, x) {
  n <- length(x)
  -n/2*log(musig[2])-1/(2*musig[2])*sum((x-musig[1])^2)
}
#
mu    <- seq(-2,2,by=0.1)
sigma <- seq(0.4, 3, by=0.05)
musig <- expand.grid(mu=mu, sigma=sigma)
head(musig)
sample <- rt(25,3)
z <- rep(NA, nrow(musig))
for (i in 1:nrow(musig)) {
  z[i] <- llikmu(as.numeric(musig[i,]), sample)
}
z <- matrix(z, nrow=length(mu))
contour(mu, sigma, z, xlab="mu", ylab="sigma")
pos <- which(z==max(z), arr.ind = TRUE)
points(mu[pos[1]], sigma[pos[2]], pch=19)
## f
contour(mu, sigma, z, xlab="mu", ylab="sigma")
pos  <- which(z==max(z), arr.ind = TRUE)
points(mu[pos[1]], sigma[pos[2]], pch=19)
z[pos[1],pos[2]]
pos  <- which.min((sqrt(2)-sigma)^2)
abline(h=sigma[pos], col="blue")
mpos <- which.max(z[,pos])
z[mpos,pos]
points(mu[mpos], sigma[pos], pch=19, col="blue")

