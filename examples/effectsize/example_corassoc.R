library("effectsize")
Boston <- mmstat4::ghload("Boston200.rds")
# correlation
abs(cor(Boston$medv, Boston$lstat))
# associations
chisq.test(Boston$rad, Boston$chas)
cohens_w(Boston$rad, Boston$chas)
#phi(Boston$rad, Boston$chas) # only 2x2
cramers_v(Boston$rad, Boston$chas)
tschuprows_t(Boston$rad, Boston$chas)
pearsons_c(Boston$rad, Boston$chas)
