## -----------------------------------------------------------------------------------------------------------------------
## a
library("HMMpa")
# X~t_3 : E(X)=0, Var(X)=3/(3-2)=3
sample <- rgenpois(25, lambda1=5, lambda2=0.5)
sample
## b
mean(sample)  # = ML estimate for lambda
var(sample)
## c
lliklambda <- function(lambda, x) {
  n <- length(x)
  # skip last term since it is constant 
  -n*lambda+sum(x)*log(lambda)
}
#
lambda <- seq(0.1, 20, by=0.1)
ll <- rep(NA, length(lambda))
for (i in 1:length(lambda)) ll[i] <- lliklambda(lambda[i], sample)
pos <- which.max(ll)
plot(lambda, ll, type="l")
text(mean(lambda), min(ll), sprintf("max=%.2f, lsmax=%.3f", lambda[pos], ll[pos]))
## d
B       <- 1000
lambdah <- rep(NA, B)
for (i in 1:B) {
  sample <- rgenpois(25, lambda1=5, lambda2=0.5)
  lambdah[i] <- optimise(lliklambda, c(0, 20), x=sample, maximum = TRUE)$maximum
}
hist(lambdah)
rug(lambdah)
## d
kldiv <- function(lambda) {
  n <- 100
  f <- dgenpois(0:n, lambda1=5, lambda2=0.5)
  g <- dpois(0:n, lambda)
  sum(f*log(f/g))
}
#
lambda <- seq(0.1, 20, by=0.1)
kl <- rep(NA, length(lambda))
for (i in 1:length(lambda)) kl[i] <- kldiv(lambda[i])
plot (lambda, kl, type="l", main="Kullback-Leibler Divergenz", ylim=c(0,max(kl)))
pos <- which.min(kl)
usr <- par("usr")
text(mean(usr[1:2]), max(kl), sprintf("min=%.2f, klmin=%.3f", lambda[pos], kl[pos]))

