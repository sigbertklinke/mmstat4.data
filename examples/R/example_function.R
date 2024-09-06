test <- function(x, y, ...) {
  op <- par(no.readonly=TRUE)
  on.exit(par(op))
  args <- list(...)
  if (any(is.na(x) | is.na(y))) return(NULL)
  x+y
}

test(c(7,3), c(3,7))
test(c(7,3), c(3,NA))

# short circuit evaluation
isTRUE                  # reference to function
isTRUE("hallo, welt")   # call to function
isTRUE(NA)