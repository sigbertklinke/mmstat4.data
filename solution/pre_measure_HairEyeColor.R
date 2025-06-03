## -------------------------------------------------------------------------------------------------------------------------------------
#a
library("mmstat4")
library("vcd")
HairEye <- apply(HairEyeColor, 1:2, sum)
assocstats(HairEye)
#b
nom.lambda(HairEye)
#c
tst<-chisq.test(HairEye)
tst
nom.cc(HairEye)
#d
HairEyeF <- HairEyeColor[,,'Female']
assocstats(HairEyeF)
HairEyeM <- HairEyeColor[,,'Male']
assocstats(HairEyeM)

