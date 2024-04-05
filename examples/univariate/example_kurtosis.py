import pandas as pd, scipy.stats as ss
boston_df = r["MASS::Boston"]
excess   = ss.kurtosis(boston_df['medv'])
print("Excess:", excess)
kurtosis = ss.kurtosis(boston_df['medv'], fisher=False)
print("Kurtosis:", kurtosis)
