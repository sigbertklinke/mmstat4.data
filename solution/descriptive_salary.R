## -----------------------------------------------------------------------------------------------------
## a
library("mmstat4")
salary <- ghload("data/salary.rds")
names(salary)
hist(salary$salbeg)
library("psych")
describe(salary$salbeg) # median
## b
quantile(salary$salbeg)

