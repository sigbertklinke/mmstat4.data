library("MASS") # for Boston Housing data
library("rpart")
library("rpart.plot")
ctrl  <- rpart.control(maxdepth=1)
model <- rpart(medv~., data=Boston, control=ctrl)
print(model)
rpart.plot(model)
