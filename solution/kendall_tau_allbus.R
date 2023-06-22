## ------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
tab <- table(allbus$ep03, allbus$ep06)
tab
plot(tab)
# b
nrow(allbus)*(nrow(allbus)-1)/2
#c+d
cc <- complete.cases(cbind(allbus$ep03, allbus$ep06))
x <- as.numeric(allbus$ep03[cc])
y <- as.numeric(allbus$ep06[cc])
ox <- order(x)
n <- sum(cc)
print(n*(n-1)/2)
x <- x[ox]
y <- y[ox]
# double loop
start <- Sys.time()
C <- D <- Tx <- Ty <- Txy <- 0
for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    if (x[i]==x[j]) {
      if (y[i]==y[j]) {
        Txy <- Txy+1
      } else {
        Tx <- Tx+1
      }
    }
    if (x[i]<x[j]) {
      if (y[i]==y[j]) Ty <- Ty+1
      if (y[i]<y[j]) C <- C+1
      if (y[i]>y[j]) D <- D+1
    }
  }
}
print(c(C=C, D=D, Tx=Tx, Ty=Ty, Txy=Txy))
print(C+D+Tx+Ty+Txy)
print(Sys.time()-start)
# vectorized
start <- Sys.time()
C <- D <- Tx <- Ty <- Txy <- 0
for (i in 1:(n-1)) {
  ind <- (i+1):n
  Txy <- Txy+sum((x[i]==x[ind])*(y[i]==y[ind]))
  Tx  <- Tx +sum((x[i]==x[ind])*(y[i]!=y[ind]))
  Ty  <- Ty +sum((x[i]<x[ind])*(y[i]==y[ind]))
  C   <- C  +sum((x[i]<x[ind])*(y[i]<y[ind]))
  D   <- D  +sum((x[i]<x[ind])*(y[i]>y[ind]))
}
print(c(C=C, D=D, Tx=Tx, Ty=Ty, Txy=Txy))
print(C+D+Tx+Ty+Txy)
print(Sys.time()-start)
# new algorithm
tab <- table(x, y)
start <- Sys.time()
C <- D <- Tx <- Ty <- Txy <- 0
for (i in 1:nrow(tab)) { # obs 1
  for (j in 1:ncol(tab)) {
    for (k in 1:nrow(tab)) { # obs 2
      for (l in 1:ncol(tab)) {
        t <- tab[i,j]*tab[k,l]
        if (i==k) {
          if (j==l) Txy <- Txy+tab[i,j]*(tab[i,j]-1)/2
          if (j<l)  Tx <- Tx+t
        }
        if (i<k) {
          if (j<l)  C  <- C+t
          if (j==l) Ty <- Ty+t
          if (j>l)  D  <- D+t
        }
      }
    }
  }
}
print(c(C=C, D=D, Tx=Tx, Ty=Ty, Txy=Txy))
print(C+D+Tx+Ty+Txy)
print(Sys.time()-start)
#e
ord.tau(cbind(x, y))

