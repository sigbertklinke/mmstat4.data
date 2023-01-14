## -----------------------------------------------------------------------------------------------------
## a
library("datasauRus")
names(datasaurus_dozen)
names(datasaurus_dozen_wide)
## a
tapply(1:nrow(datasaurus_dozen), datasaurus_dozen$dataset, FUN=function(i) {
   c(mean(datasaurus_dozen$x[i]), mean(datasaurus_dozen$y[i]), 
     sd(datasaurus_dozen$x[i]),  sd(datasaurus_dozen$y[i]), 
     cov(datasaurus_dozen$x[i], datasaurus_dozen$y[i]), 
     cor(datasaurus_dozen$x[i], datasaurus_dozen$y[i])) 
  })
## b
tapply(1:nrow(datasaurus_dozen), datasaurus_dozen$dataset, FUN=function(i) {
   y <- datasaurus_dozen$y[i]
   x <- datasaurus_dozen$x[i]
   coefficients(lm(y~x))
  })
## c
opar <- par(mfrow=c(4,4), mar=c(0,0,2,0))
on.exit(par(opar))
tapply(1:nrow(datasaurus_dozen), datasaurus_dozen$dataset, function(i) {
  plot(datasaurus_dozen$x[i], datasaurus_dozen$y[i], main=unique(datasaurus_dozen$dataset[i]), pch=19, cex=0.5, axes=FALSE)
  box()
  length(i)
})

