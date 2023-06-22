## ------------------------------------------------------------------------------------------------------------------------------
names(iris)
iris4  <- iris[,-5]
siris4 <- scale(iris4)
## a 
d <- dist(iris4) # euclidean
hl1 <- hclust(d, method="ward.D2")
plot(hl1)
cl3 <- cutree(hl1, 3)
d <- dist(siris4) # euclidean
hl2 <- hclust(d, method="ward.D2")
plot(hl2)
cl4 <- cutree(hl2, 3)
## b
cl1 <- kmeans(iris4, 3)
cl2 <- kmeans(siris4, 3)
table(cl1$cluster, iris[,"Species"])
table(cl2$cluster, iris[,"Species"])
table(cl3, iris$Species)
table(cl3, cl1$cluster)
table(cl4, iris$Species)
table(cl4, cl2$cluster)
## c
d <- dist(iris4, method = "manhattan")
hl5 <- hclust(d)
plot(hl1)
cl5 <- cutree(hl5, 3)
d <- dist(siris4) # euclidean
hl6 <- hclust(d)
plot(hl6)
cl6 <- cutree(hl6, 3)
#
table(cl5, iris$Species)
table(cl6, iris$Species)
table(cl3, cl5)
table(cl4, cl6)
##
library("DescTools")
distm <- c("euclidean", "maximum", "manhattan", "canberra")
agglm <- c("ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid")
coeff <- matrix(NA, nrow=length(distm), ncol=length(agglm))
rownames(coeff) <- distm
colnames(coeff) <- agglm
for (i in seq(distm)) {
  for (j in seq(agglm)) {
    d    <- dist(siris4, distm[i])
    hc   <- hclust(d, agglm[j])
    memb <- cutree(hc, 3)
    coeff[i,j] <- CramerV(table(memb, iris$Species))
  }
}
round(coeff,3)
## d
# go back in the plots
## e
d    <- dist(siris4, "manhattan")
hc   <- hclust(d, "average")
memb <- cutree(hc, 3)
library("psych")
pa <- principal(siris4, 2)
plot(as.data.frame(pa$scores), col=memb)
table(memb, iris$Species)

