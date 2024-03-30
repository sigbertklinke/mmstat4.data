import numpy as np, scipy.stats as stats
Boston <- ghload("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Shapiro Wilk test
res = stats.shapiro(data)
print(res)
