## ------------------------------------------------------------------------------------------------------------------------------
### a
data("body", package = "mmstat4")
names(body)
opar <- par(mfrow=c(3,1))
on.exit(par(opar))
boxplot(body$Age, horizontal=TRUE)
boxplot(body$Weight, horizontal=TRUE)
boxplot(body$Height, horizontal=TRUE)
### b+c
# Grubbs Test
sapply(body[,-1], function(v) { shapiro.test(v)$p.value})
### d
# https://en.wikipedia.org/wiki/Body_mass_index
bmi <- 703*body$Weight/body$Height^2 
boxplot(bmi, horizontal=TRUE)

