import numpy as np, scipy.stats as stats
Boston <- ghload("Boston200.rds")
data = boston_df['medv'].dropna()
# Perform the Jarque-Bera test
res = stats.jarque_bera(data)
print(res)
