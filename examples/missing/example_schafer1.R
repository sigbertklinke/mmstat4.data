library("MASS")
sig <- matrix(c(625,375,375,625), ncol=2)
n   <- 50
x   <- mvrnorm(n, mu=c(125,125), Sigma=sig)
plot(x)
na_type <- "mcar"     # mcar, mar, or mnar
na <- switch(na_type, mnar=(x[,2]<140), mar=(x[,1]<140), runif(n)<0.6)
na_impute <- "preddist"   # delete, mean subst., hot deck, cond. mean, pred. dist.
lm      <- lm(V2~V1, data=as.data.frame(x[!na,]))
b       <- coefficients(lm)
x[na,2] <- switch(na_impute, rep(NA, sum(na)),
             mean=rep(mean(x[!na,2]), sum(na)),
             hotdeck=sample(x[!na,2], sum(na), replace=TRUE),
             condmean=b[1]+b[2]*x[na,1],
             preddist=b[1]+b[2]*x[na,1]+
               sample(residuals(lm), sum(na), replace=TRUE))
points(x, col="red", pch=19, cex=0.75)
