import pandas as pd, scipy.stats as ss
boston_df = r["MASS::Boston"]
#
skewness  = ss.skew(boston_df['medv'])
print("Skewness:", skewness)
