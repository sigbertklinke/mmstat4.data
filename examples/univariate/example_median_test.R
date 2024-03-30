Boston <- mmstat4::ghload("Boston200.rds")
library("UsingR")
simple.median.test(Boston$medv, mean(Boston$medv))
