## ---------------------------------------------------------------------------------------------------------------------------------
### a
library("mmstat4")
gss <- ghload("data/gss.rds")
degree <- names(attr(gss$degree, "labels"))[gss$degree+1]
tapply(gss$rincmdol, degree, mean, na.rm=TRUE)
### b+c
# check number of observations
tapply(gss$rincmdol, degree, length)
# check normality
tapply(gss$rincmdol, degree, shapiro.test)
# check variances
tapply(gss$rincmdol, degree, var, na.rm=TRUE)
# check skewnesss
library("DescTools")
tapply(gss$rincmdol, degree, Skew, na.rm=TRUE)
# ANOVA :(
anova <- aov(gss$rincmdol~degree)
summary(anova)
kruskal.test(gss$rincmdol, degree)
### d
library("agricolae")
scheffe.test(anova, "degree", console=T)

