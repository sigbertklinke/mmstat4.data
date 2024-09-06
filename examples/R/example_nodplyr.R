df <- MASS::Boston
df <- df[df$medv < 37, ]
df <- df[, c("rm", "rad", "lstat", "medv")]
df$medv1 <- df$medv * 1000
df <- df[order(-df$medv), ]
head(df)
aggregate(medv ~ rad, data = df, FUN = function(x) mean(x, na.rm = TRUE))
