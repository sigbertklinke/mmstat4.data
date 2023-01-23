library("xlsx")
data <- system.file("extdata", "kriegsschiffe.xlsx", package="mmstat4")
x <- read.xlsx(data, sheetIndex=1)
dim(x)