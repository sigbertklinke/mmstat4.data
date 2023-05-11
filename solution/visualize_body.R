## ---- warning=FALSE-----------------------------------------------------------------------------------------------------
## a
library("psych")
library("mmstat4")
body <- ghload("data/body.rds")
describe(body) # units?
body$Age    <- body$Age/12           
body$Height <- 2.54*body$Height     
body$Weight <- 0.453592*body$Weight 
describe(body) # outlier?
## b
gd <- function(v, main="variable") {
  opar <- par(mfrow=c(2,2))
  on.exit(par(opar))
  boxplot(v, main=main, horizontal=TRUE)
  hist(v, main=main)  
  plot(density(v), main=main)
  stripchart(v, method="j", main=main, cex=0.75, pch=19)
}
#
gd(body$Age, "age")
gd(body$Weight, "weight")
gd(body$Height, "height")

