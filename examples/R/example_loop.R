for (i in 1:5) {
  print(i)
  if (i==3) break
}
print(i) 
#
x <- 0
while (x <= 5) {
  x <- x + 1
  if (x==3) next
  print(x)
}