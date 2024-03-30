import pandas as pd, scipy.stats as ss
boston_df = ghload("Boston", "MASS")
#
skewness  = ss.skew(boston_df['medv'])
print("Skewness:", skewness)
