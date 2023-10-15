library("effectsize")
data(Boston, package="MASS")
index <- sample(nrow(Boston), 300)
# correlation
abs(cor(Boston$medv[index], Boston$lstat[index]))
# associations
chisq.test(Boston$rad[index], Boston$chas[index])
cohens_w(Boston$rad[index], Boston$chas[index])
#phi(Boston$rad[index], Boston$chas[index]) # only 2x2
cramers_v(Boston$rad[index], Boston$chas[index])
tschuprows_t(Boston$rad[index], Boston$chas[index])
pearsons_c(Boston$rad[index], Boston$chas[index])