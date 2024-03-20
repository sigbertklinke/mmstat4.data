import pandas as pd, numpy as np, scipy.stats as ss
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
medv_column    = boston_df['medv']
mean_value     = np.mean(medv_column)
variance_value = np.var(medv_column)
moments = ss.moment(medv_column, moment=range(1, 5))
print("Mean:", mean_value)
print("Variance:", variance_value)
print("All Moments:", moments)
