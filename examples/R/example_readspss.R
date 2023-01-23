library("foreign")
data <- system.file("extdata", "BOSTONH.SAV", package="mmstat4")
x    <- read.spss (data, to.data.frame=T)
dim(x)