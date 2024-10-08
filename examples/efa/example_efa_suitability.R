library("psych")
library("lattice")
# bfi: 25 personality self report items taken from
# the International Personality Item Pool
bfi <- mmstat4::ghload("data/bfi4.rds")
names(bfi)
# inverse and partial correlations & anti-image
p  <- solve(cor(bfi, use="complete.obs"))
print(levelplot(p, main="Inverse & partial correlations"), split=c(1,1,2,1), more=TRUE)
pr <- -p/sqrt(outer(diag(p), diag(p)))
print(levelplot(pr, main="Anti-Image correlation"), split=c(2,1,2,1), more=FALSE)
# Kaiser-Meyer-Olkin & MSA
KMO(bfi)
# Bartlett test of sphericity
cortest.bartlett(bfi)
