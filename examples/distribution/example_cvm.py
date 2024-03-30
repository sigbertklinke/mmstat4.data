import numpy as np, scipy.stats as stats
Boston <- ghload("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Anderson-Darling test
res = stats.cramervonmises(data, "norm", args=(np.mean(data), np.std(data)))
print(res)
