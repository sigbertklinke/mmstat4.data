## -------------------------------------------------------------------------------------------------------------------------------------
## a
survclass <- as.table(apply(Titanic, c(1,4), sum))
# crosstable
survclass
# 
wtab <- as.data.frame(survclass)
wtab
#
index <- rep(1:nrow(wtab), wtab$Freq)
utab  <- wtab[index,]
head(utab)
summary(utab)
## b
library("DescTools")
ContCoef(survclass)
library("mmstat4")
nom.cc(survclass)
## c
survsex <- as.table(apply(Titanic, c(2,4), sum))
nom.cc(survsex)
survchild <- as.table(apply(Titanic, c(3,4), sum))
nom.cc(survchild)

