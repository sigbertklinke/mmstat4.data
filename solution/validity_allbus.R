## ------------------------------------------------------------------------------------------------------------------------
library("rio")
allbus <- import("https://shinyapps.wiwi.hu-berlin.de/d/ALLBUS2018.sav")
attributes(allbus$eastwest)
attributes(allbus$land)
table(allbus$eastwest, allbus$land)

