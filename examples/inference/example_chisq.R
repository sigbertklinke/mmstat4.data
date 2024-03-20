B200 <- mmstat4::ghload("Boston200.rds")
ctab <- table (B200$chas, B200$rad)
ctab
chisq.test(ctab)
chisq.test(ctab, simulate.p.value=T)
