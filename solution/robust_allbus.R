## ------------------------------------------------------------------------------------------------------------------------------
## a
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
nic <- allbus$di05
boxplot(nic, horizontal=TRUE)
# outliers : nic >= 10.000
out <- 10000
library('psych')
describe(nic)
describe(nic[nic<out])
## c
nicmean <- na.omit(nic)
nicmean[nicmean>=out] <- mean(nicmean[nicmean<out])
describe(nicmean)
## d
c(mean(nic, na.rm=TRUE), sd(nic, na.rm=TRUE), 
  mean(nic, na.rm=TRUE, trim=0.2), NA,
  winsor.mean(as.vector(nic)), winsor.sd(as.vector(nic)))
## e
library("MASS")
huber(nic)

