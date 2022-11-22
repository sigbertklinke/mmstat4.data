## ------------------------------------------------------------------------------------------------------------------------
library("rio")
allbus <- import("https://shinyapps.wiwi.hu-berlin.de/d/ALLBUS2018.sav")
### a
tab <- table(allbus$ep03, allbus$ep06)
tab
plot(tab)
### b
wlage <- na.omit(cbind(allbus$ep03, allbus$ep06))
n <- nrow(wlage)
n*(n-1)/2
### c+d
C <- D <- Tx <- Ty <- Txy <- 0
olage <- wlage[order(wlage[,1], wlage[,2]),] # avoid n² loop
for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    if ((olage[i,1]<olage[j,1]) && (olage[i,2]<olage[j,2])) C <- C+1
    if ((olage[i,1]<olage[j,1]) && (olage[i,2]>olage[j,2])) D <- D+1    
    if ((olage[i,1]<olage[j,1]) && (olage[i,2]==olage[j,2])) Ty <- Ty+1
    if ((olage[i,1]==olage[j,1]) && (olage[i,2]<olage[j,2])) Tx <- Tx+1
    if ((olage[i,1]==olage[j,1]) && (olage[i,2]==olage[j,2])) Txy<- Txy+1    
  }
}
c(C, D, Tx, Ty, Txy, C+D+Tx+Ty+Txy)
## vectorize
C <- D <- Tx <- Ty <- Txy <- 0
for (i in 1:(n-1)) {
  j   <- (i+1):n
  C   <- C+sum((olage[i,1]<olage[j,1]) & (olage[i,2]<olage[j,2]))
  D   <- D+sum((olage[i,1]<olage[j,1]) & (olage[i,2]>olage[j,2]))
  Ty  <- Ty+sum((olage[i,1]<olage[j,1]) & (olage[i,2]==olage[j,2]))
  Tx  <- Tx+sum((olage[i,1]==olage[j,1]) & (olage[i,2]<olage[j,2]))
  Txy <- Txy+sum((olage[i,1]==olage[j,1]) & (olage[i,2]==olage[j,2]))
}
c(C, D, Tx, Ty, Txy, C+D+Tx+Ty+Txy)
## frequency table 
tab <- table(olage[,1], olage[,2])
tab
ctab <- col(tab)
rtab <- row(tab)
C <- D <- Tx <- Ty <- Txy <- 0
for (i in 1:length(tab)) {
  for (j in 1:length(tab)) {
    if ((rtab[i]<rtab[j]) && (ctab[i]<ctab[j]))   C   <- C  + tab[rtab[i],ctab[i]]*tab[rtab[j],ctab[j]]
    if ((rtab[i]<rtab[j]) && (ctab[i]>ctab[j]))   D   <- D  + tab[rtab[i],ctab[i]]*tab[rtab[j],ctab[j]]
    if ((rtab[i]<rtab[j]) && (ctab[i]==ctab[j]))  Ty  <- Ty  + tab[rtab[i],ctab[i]]*tab[rtab[j],ctab[j]]
    if ((rtab[i]==rtab[j]) && (ctab[i]==ctab[j])) Txy <- Txy + tab[rtab[i],ctab[i]]*(tab[rtab[i],ctab[i]]-1)/2
    if ((rtab[i]==rtab[j]) && (ctab[i]<ctab[j]))  Tx  <- Tx  + tab[rtab[i],ctab[i]]*tab[rtab[j],ctab[j]]
  }
}
c(C, D, Tx, Ty, Txy, C+D+Tx+Ty+Txy)
### e
library("ryouready")
ord.tau(tab)
#
(C-D)/(n*(n-1)/2)               # tau_a
(C-D)/sqrt((C+D+Tx)*(C+D+Ty))   # tau_b
m <- min(dim(tab))
2*m*(C-D)/((m-1)*nrow(olage)^2) # tau_c

