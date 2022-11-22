## ------------------------------------------------------------------------------------------------------------------------
## a
salary <- import("https://shinyapps.wiwi.hu-berlin.de/d/salary.sav")
names(salary)
hist(salary$salbeg)
library("psych")
describe(salary$salbeg) # median
## b
quantile(salary$salbeg)

