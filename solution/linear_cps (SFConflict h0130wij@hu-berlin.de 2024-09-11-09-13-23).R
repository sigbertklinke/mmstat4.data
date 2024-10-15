## ----------------------------------------------------------------------------------------------------------------
library("mmstat4")
cps <- ghload("data/cps.rds")
cps85 <- subset(cps, cps$year==85)
## a
summary(cps85[,c('lwage', 'exper', 'educ')])
pairs(~lwage+exper+educ, data=cps85, pch=19, cex=0.5)
## b-d
lm1 <- lm(lwage~exper, data=cps85)
summary(lm1)
lm2 <- lm(lwage~expersq, data=cps85)
summary(lm2)
lm3 <- lm(lwage~educ, data=cps85)
summary(lm3)
## e
pairs(~exper+expersq+educ, data=cps85, pch=19, cex=0.5)
cor(cps85[,c('lwage', 'exper', 'educ')])
## f
pairs(~exper+educ+age, data=cps85, pch=19, cex=0.5)
cps85$age-cps85$exper-cps85$educ

