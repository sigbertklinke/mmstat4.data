## ------------------------------------------------------------------------------------------------------------------------
### a
library('rio')
sas <- import("https://shinyapps.wiwi.hu-berlin.de/d/sas_body.sav")
names(sas)
opar <- par(mfrow=c(3,1))
on.exit(par(opar))
boxplot(sas$Age, horizontal=TRUE)
boxplot(sas$Weight, horizontal=TRUE)
boxplot(sas$Height, horizontal=TRUE)
### b+c
# Grubbs Test
sapply(sas[,-1], function(v) { shapiro.test(v)$p.value})
### d
# https://en.wikipedia.org/wiki/Body_mass_index
bmi <- 703*sas$Weight/sas$Height^2 
boxplot(bmi, horizontal=TRUE)

