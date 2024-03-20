import numpy as np, pandas as pd
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
# mean
mean_value = np.mean(boston_df['medv'])
print("mean:", mean_value)
# median
median_value = np.median(boston_df['medv'])
print("median:", median_value)
# Pandas' mode can return multiple values
mode_value = boston_df['rad'].mode().iloc[0]  # 
print("Mode:", mode_value)
