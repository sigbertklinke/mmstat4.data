import numpy as np, pandas as pd
# Load the Boston Housing dataset
boston_df = r["MASS::Boston"]
# mean
mean_value = np.mean(boston_df['medv'])
print("mean:", mean_value)
# median
median_value = np.median(boston_df['medv'])
print("median:", median_value)
# Pandas' mode can return multiple values
mode_value = boston_df['rad'].mode().iloc[0]  # 
print("Mode:", mode_value)
