Boston <- mmstat4::ghload("Boston200.rds")
# Sign test
# H0: pi = pi0
# H1: pi <> pi0
binom.test(sum(Boston$chas==1), length(Boston$chas))
prop.test(sum(Boston$chas==1), length(Boston$chas))
