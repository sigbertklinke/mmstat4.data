library("mmstat4")
cps78_85 <- ghload("cps.rds")
xs  <- subset(cps78_85, year==85, c("lwage", "educ"))
lms <- lm (scale(lwage)~scale(educ), data=xs)
summary(lms)
#
library("QuantPsyc")
lm <- lm (lwage~educ, data=xs)
lm.beta(lm)
