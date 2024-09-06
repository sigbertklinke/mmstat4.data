x <- c(TRUE, FALSE, NA, TRUE, FALSE, NA, TRUE, FALSE, NA)
y <- c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, NA, NA, NA)
x & y
x[1] && y[1]
x | y
x[1] || y
xor(x,y)
!y
z <- 10
if (z > 15) {
  print("x is greater than 15")
} else if (z > 5) {
  print("z is greater than 5 but less than or equal to 15")
} else {
  print("z is 5 or less")
}