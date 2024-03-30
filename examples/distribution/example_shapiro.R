Boston <- mmstat4::ghload("Boston200.rds")
shapiro.test(Boston$medv)
#
library("DescTools")
ShapiroFranciaTest(Boston$medv)
