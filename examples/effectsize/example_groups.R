library("effectsize")
data(Boston, package="MASS")
# ANOVA
index  <- sample(nrow(Boston), size=300)
model  <- aov(medv~rad, data=Boston[index,])
# 
es <- eta_squared(model)
es
interpret_eta_squared(es)
#
cohens_f(model)