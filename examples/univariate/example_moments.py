import pandas as pd, numpy as np, scipy.stats as ss
boston_df = r["MASS::Boston"]
#
medv_column    = boston_df['medv']
mean_value     = np.mean(medv_column)
variance_value = np.var(medv_column)
moments = ss.moment(medv_column, moment=range(1, 5))
print("Mean:", mean_value)
print("Variance:", variance_value)
print("All Moments:", moments)
