library("MASS")      # for Boston Housing data
library("DescTools") 
tab <- table(Boston$chas, Boston$rad)
Lambda(tab)
#
library("mmstat4")
nom.lambda(tab)