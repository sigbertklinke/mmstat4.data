library("rio")
data("cps78_85", package="mmstat4")
library("car")
lm <- lm (lwage~educ, data=cps78_85, subset=(year==85))
lmboot <- Boot(lm)
summary(lmboot)
confint(lmboot)
hist(lmboot)
