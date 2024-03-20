import pandas as pd, scipy.stats as ss
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
excess   = ss.kurtosis(boston_df['medv'])
print("Excess:", excess)
kurtosis = ss.kurtosis(boston_df['medv'], fisher=False)
print("Kurtosis:", kurtosis)
