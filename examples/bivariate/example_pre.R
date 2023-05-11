library("mmstat4")
## Nominal data
hec <- apply(HairEyeColor, 1:2, sum) # remove gender from the table
nom.lambda(hec)
nom.uncertainty(hec)
## Ordinal data ep03 = WIRTSCHAFTSLAGE, HEUTE, ep06 = IN 1 JAHR
x <- ghload("data/allbus2018.rds")
ord.gamma(x$ep03, x$ep06)
ord.tau(x$ep03, x$ep06)
ord.somers.d(x$ep03, x$ep06)
## Interval/nominal data
eta(iris$Species, iris$Sepal.Length)
