## ------------------------------------------------------------------------------------------------------------------------
## a
library("rio") 
bank2 <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
sbank2 <- scale(bank2)
var(bank2)
var(sbank2)
## b 
# unstandardized
vvar <- diag(var(bank2))
sum(vvar)
vvar/sum(vvar)
# standardized
vvar <- diag(var(sbank2))
sum(vvar)
vvar/sum(vvar)
## c
# unstandardized
prb <-prcomp(bank2)
cumsum(prb$sdev^2)/sum(prb$sdev^2)
# standardized
prb <-princomp(sbank2)
cumsum(prb$sdev^2)/sum(prb$sdev^2)

