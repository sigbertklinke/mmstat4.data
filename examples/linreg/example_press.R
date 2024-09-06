cumsum_text <- function(x, sep = "+") {
  Reduce(function(a, b) paste(a, b, sep = sep), x, accumulate = TRUE)
}
#
library("olsrr")
bhd   <- MASS::Boston[,-c(4,9)]
model <- cumsum_text(c("1", names(bhd)[-12]))
lmi   <- lm(medv~1, data=bhd)
press <- numeric(0)
for (modeli in model) {
  lmi  <- lm(as.formula(paste0("medv~", modeli)), data=bhd)
  press[modeli] <- ols_press(lmi)
}
press
which.min(press)
