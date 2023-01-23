library("boot")
library("mmstat4")
meanboot <- function (x, ind) { return(mean(x[ind])); }
#
set.seed(24961970)
pechstein <- ghload("pechstein.rds")
boot(pechstein$Retikulozyten, meanboot, 999)
