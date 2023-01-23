library("mmstat4")
staedtemieten <- ghload("staedtemieten.rds")
x  <- staedtemieten[complete.cases(staedtemieten),]
lm <- lm (Miete~Fläche, data=x)
summary(lm)
plot(x$Fläche, residuals(lm))
abline(h=0, col="red")
#
library("lmtest")
bptest(Miete~Fläche, data=x)
