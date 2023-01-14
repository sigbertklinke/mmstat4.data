## -----------------------------------------------------------------------------------------------------
library("mmstat4")
country <- ghload("data/country.rds")
## a
library("olsrr")
library("MASS")
country <- country[complete.cases(country),]
lm1 <- lm(LIFEEXPM~URBAN+LNDOCS+LNBEDS+LNGDP+LNRADIO, data=country, x=TRUE)
summary(lm1)
lmstep <- ols_step_both_p(lm1) # ols_step_both_aic(lm1)
summary(lmstep$model)
## b
plot(cooks.distance(lmstep$model), main="Cooks distance")
n <- nrow(country)
abline(h=4/n, col="red")
#
ind <- which(cooks.distance(lmstep$model)>4/n)
ind
country$COUNTRY[as.integer(names(ind))]
#
SDBETA <- dfbetas(lmstep$model)
opar <- par(mfrow=c(2,3))
on.exit(par(opar))
ind <- c()
for (i in 1:ncol(SDBETA)) {
  plot(abs(SDBETA[,i]), main=names(SDBETA)[i])
  abline(h=2/sqrt(n), col="red")
}
ind <- which(apply(abs(SDBETA)>2/sqrt(n), 1, any))
country$COUNTRY[as.integer(names(ind))]
## d
lmback <- ols_step_backward_aic(lm1, progress=TRUE)

