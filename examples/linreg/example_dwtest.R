library("mmstat4")
fatalities <- ghload("fatalities.rds")
lm <- lm (US~YR, data=fatalities)
summary(lm)
plot(fatalities$YR, fatalities$US)
abline(lm, col="red")
#
library("car")
durbinWatsonTest(lm)
#
library("lmtest")
dwtest(lm)
dwtest(lm, alternative="two.sided")
