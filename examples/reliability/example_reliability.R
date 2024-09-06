library("psych")
bfi2 <- mmstat4::ghload("data/bfi4.rds")
# extract first factor
fa   <- fa(bfi2)
vars <- abs(fa$loadings)>0.5
# Cronbachs alpha (items not reversed)
alpha(cor(bfi2[,vars]))
# Cronbachs alpha (items reversed)
alpha(cor(bfi2[,vars]), check.keys=T)
# Cronbachs alpha and sum scores
keys <- ifelse (vars, sign(fa$loadings)<0, 0)
si   <- scoreItems(keys, bfi2)
