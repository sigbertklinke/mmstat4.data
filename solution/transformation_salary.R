## ------------------------------------------------------------------------------------------------------------------------
### a+b
library("rio")
salary <- import("https://shinyapps.wiwi.hu-berlin.de/d/salary.sav")
names(salary)
#
z <- scale(salary$salbeg)
library("psych")
describe(z)
### c+d
describeBy(z, salary$sex, mat=TRUE)
describeBy(salary$salbeg, salary$sex, mat=TRUE) # 0=Male, 1=Female

