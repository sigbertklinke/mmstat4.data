library("effectsize")
data(Boston, package="MASS")
index <- sample(nrow(Boston), 300)
x <- Boston$medv[index]
g <- Boston$rad[index]
# epsilon
kw <- kruskal.test(x, g)
kw
kw$statistic/(length(index)-1)
# for Levene test
library("car")
lt <- leveneTest(x, g)
lt
#
y     <- abs(x-ave(x, g))
model <- aov(y~g) 
eta_squared(model)
# test statistic conversion -> Cohens r
F_to_eta2(lt$F, lt$Df[1], lt$Df[2])
