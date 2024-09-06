class(iris)
# only necessary if you have more than one constructor
myclass <- function(x, ...) { UseMethod("myclass") }
# constructors
myclass.default <- function (x, ...) { structure(x, class="myclass") }
myclass.matrix  <- function (x, ...) { print("x is matrix") }  
myclass.table   <- function (x, ...) { print("x is table") }
# generic
print.myclass   <- function(x, ...)      { str(x) } 
summary.myclass <- function(object, ...) { str(x) } 
plot.myclass    <- function(x, y, ...)   { str(x) } 
# example
obj <- myclass(iris)
print(obj)
plot(obj)
