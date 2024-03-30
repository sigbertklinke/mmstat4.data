Boston <- mmstat4::ghload("Boston200.rds")
library("nortest")
ad.test(Boston$medv)
