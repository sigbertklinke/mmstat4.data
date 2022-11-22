## ------------------------------------------------------------------------------------------------------------------------
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
## c
ct <- chisq.test(survclass)
sqrt(ct$statistic/sum(survclass) )
## d
survsex <- as.table(apply(Titanic, c(2,4), sum))
survsex
ct <- chisq.test(survsex)
sqrt(ct$statistic/sum(survsex))
#
survchild <- as.table(apply(Titanic, c(3,4), sum))
survchild
ct <- chisq.test(survchild)
sqrt(ct$statistic/sum(survchild))

