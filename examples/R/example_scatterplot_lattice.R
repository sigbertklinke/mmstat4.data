library("MASS")  # for Boston Housing data
# lattice
library("lattice")
p <- xyplot(medv~lstat, data=Boston)
print(p)  # in interactive mode xyplot(...) is sufficient
