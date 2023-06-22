## ------------------------------------------------------------------------------------------------------------------------------
str(Titanic)
### a
sc <- as.table(apply(Titanic, c(1,2), sum))
str(sc)
plot(sc)
### b
scs <- as.table(apply(Titanic, c(4,1,2), sum))
str(scs)
plot(scs)
### c
scs <- as.table(apply(Titanic, c(1,2,4), sum))
str(scs)
plot(scs)

