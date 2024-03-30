Boston <- mmstat4::ghload("Boston200.rds")
t.test(Boston$medv, mu=10)
