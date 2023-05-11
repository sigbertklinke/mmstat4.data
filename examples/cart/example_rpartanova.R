library("MASS") # for Boston Housing data
library("rpart")
library("rpart.plot")
model <-rpart(medv~., data=Boston)
print(model)
rpart.plot(model)

