import numpy as np, scipy.stats as stats
boston_df = r["mmstat4::ghload"]("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Shapiro Wilk test
res = stats.shapiro(data)
print(res)
