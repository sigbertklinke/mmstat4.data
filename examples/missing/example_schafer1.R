library("MASS")
x <- mmstat4::ghload("gs50.rds")
plot(x[,1:2])
df <- data.frame(V1=x$x, V2=x$ymar)  # y, ymcar, ymar, ymnar
lm <- lm(V2~V1, data=df)
b  <- coefficients(lm)
na_impute <- "preddist"   # delete, mean subst., hot deck, cond. mean, pred. dist.
na        <- is.na(df[,2])
df[na,2]  <- switch(na_impute, rep(NA, sum(na)),
               mean=rep(mean(x[!na,2]), sum(na)),
               hotdeck=sample(x[!na,2], sum(na), replace=TRUE),
               condmean=b[1]+b[2]*x[na,1],
               preddist=b[1]+b[2]*x[na,1]+
               sample(residuals(lm), sum(na), replace=TRUE))
points(df, col="red", pch=19, cex=0.75)
