data(Boston, package="MASS")
library("Transform")
out <- yjTransform(Boston$crim)
str(out)