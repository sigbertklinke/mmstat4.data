library("dplyr")
df <- MASS::Boston %>%
  filter(medv < 37) %>%
  select(rm, rad, lstat, medv) %>%
  mutate(medv1 = medv*1000) %>%
  arrange(desc(medv))
head(df)
gf <- df %>%
  group_by(rad) %>%
  summarise(
    ave_medv = mean(medv, na.rm=TRUE),
    .groups = 'drop'  # Prevents grouping in the final output
  )
gf
