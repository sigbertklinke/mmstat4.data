import numpy as np, scipy.stats as stats
Boston <- r["mmstat4::ghload"]("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Anderson-Darling test
res = stats.anderson(data)
print(res)
