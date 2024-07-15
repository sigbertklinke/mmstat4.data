Boston <- mmstat4::ghload("Boston200.rds")
tst <- chisq.test(table(Boston$chas, Boston$rad))
tst
chisq.test(table(Boston$chas, Boston$rad), correct=TRUE)
abs(tst$observed-tst$expected)
