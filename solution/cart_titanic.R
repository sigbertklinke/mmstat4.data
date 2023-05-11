## -----------------------------------------------------------------------------------------------------------------------
## a
n <- length(dim(Titanic))
for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    tab <- apply(Titanic, c(i,j), sum)
    print(tab)
    print(chisq.test(tab))
  }
} 
#
#install.packages("CHAID", repos="http://R-Forge.R-project.org")
wtab <- as.data.frame(Titanic)
index <- rep(1:nrow(wtab), wtab$Freq)
utab <- wtab[index,]
#
library("CHAID")
chaid(Survived~Class+Sex+Age, data=utab, control=chaid_control(maxheight=1))
chaid(Survived~Class+Sex+Age, data=utab)
## c
library("rpart")
model<-rpart(Survived~Class+Sex+Age, data=utab, control=rpart.control(maxdepth=1))
print(model)
model2<-rpart(Survived~Class+Sex+Age, data=utab, control=rpart.control(cp=0))
print(model2)
model2$cptable
for (cp in model2$cptable[,1]) {
  modelcp <- rpart(Survived~Class+Sex+Age, data=utab, control=rpart.control(cp=cp))
  print(cp)
  print(sum(modelcp$frame$var=="<leaf>"))
}

