library("DescTools")
Boston <- mmstat4::ghload("Boston200.rds")
JarqueBeraTest(Boston$medv)
