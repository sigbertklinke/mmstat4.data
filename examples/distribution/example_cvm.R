Boston <- mmstat4::ghload("Boston200.rds")
library("nortest")
cvm.test(Boston$medv)
