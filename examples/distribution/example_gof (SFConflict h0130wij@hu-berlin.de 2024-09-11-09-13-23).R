Boston <- ghload("Boston200.rds")
# test on uniform distribution
chisq.test(table(Boston$rad))
