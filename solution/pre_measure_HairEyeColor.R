## ----------------------------------------------------------------------------------------------------------------
#a
library("vcd")
HairEye <- apply(HairEyeColor, 1:2, sum)
assocstats(HairEye)
#b
#nom.lambda(HairEye)
#c
tst<-chisq.test(HairEye)
tst
sqrt(tst$statistic/sum(tst$observed))
#d
HairEyeF <- HairEyeColor[,,'Female']
assocstats(HairEyeF)
HairEyeM <- HairEyeColor[,,'Male']
assocstats(HairEyeM)

