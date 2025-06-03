## -------------------------------------------------------------------------------------------------------------------------------------
## a
survclass <- as.table(apply(Titanic, c(1,4), sum))
survclass
ct <- chisq.test(survclass)
sqrt(ct$statistic/sum(survclass) )
## b
survsex <- as.table(apply(Titanic, c(2,4), sum))
survsex
ct <- chisq.test(survsex)
sqrt(ct$statistic/sum(survsex))
survchild <- as.table(apply(Titanic, c(3,4), sum))
survchild
ct <- chisq.test(survchild)
sqrt(ct$statistic/sum(survchild))

