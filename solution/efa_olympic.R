## ------------------------------------------------------------------------------------------------------------------------
library("rio")
olymp <- import("https://shinyapps.wiwi.hu-berlin.de/d/olympic.sav")
names(olymp)
## a
dec <- olymp[,-c(1,12)]
KMO(dec)
## b
fa1 <- principal(dec)
fa1$loadings
# pos: long, poid, perc: viel Kraft in einem kurzen Moment
# neq: @100, @400, @110: Laufen
# zero: haut,disq,jave,@1500(-)

