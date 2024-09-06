result <- tryCatch({
  10 / 0
}, warning = function(w) {
  print("Warning occurred")
}, error = function(e) {
  print("Error occurred")
  NA
}, finally = {
  print("Finally block executed")
})