## ------------------------------------------------------------------------------------------------------------------------
## a
library("rio")
bank2 <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
str(bank2)
## Should be metric continuous.
## b
nrow(bank2)
sapply(bank2, function(v) { length(table(v))})
## c
library("psych")
describe(bank2)
## d
options(width=100)
describe(bank2[1:100,])
describe(bank2[101:200,])
## e
sapply(bank2, function(v) {
  c <- cohen.d(v, as.factor(1:length(v)>100))
  list("cohen.d"=c$cohen.d[,"effect"], "cohen.r"=c$r)
})
## f
sapply(bank2, function(v){
  t.test(v[101:200], mu=mean(v[1:100]))[c("statistic", "p.value")]
})
#
sign.test <- function(x, theta0=mean(x), ...) {
  ntie <- sum(x==theta0)
  nlow <- sum(x<theta0)
  nupp <- sum(x>theta0)
  if (nlow<nupp) nlow <- nlow+ntie
  binom.test(nlow, length(x), p=0.5, ...)
}
#
sapply(bank2, function(v){
  sign.test(v[101:200], theta0=median(v[1:100]))[c("statistic", "p.value")]
})

