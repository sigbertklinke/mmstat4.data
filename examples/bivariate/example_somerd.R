library("vcdExtra") # for Accident
library("mmstat4")
Accident$mode <- ordered(Accident$mode, levels=levels(Accident$mode)[c(4,2,3,1)])
tab <- xtabs(Freq~mode+age, data=Accident)
tab
ord.somers.d(tab)