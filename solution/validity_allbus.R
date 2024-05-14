## ---------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
attributes(allbus$eastwest)
attributes(allbus$land)
table(allbus$eastwest, allbus$land)

