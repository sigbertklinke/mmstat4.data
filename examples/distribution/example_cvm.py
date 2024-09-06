import numpy as np, scipy.stats as stats
boston_df = r["mmstat4::ghload"]("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Anderson-Darling test
res = stats.cramervonmises(data, "norm", args=(np.mean(data), np.std(data)))
print(res)
