import pandas as pd, scipy.stats as ss
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
skewness  = ss.skew(boston_df['medv'])
print("Skewness:", skewness)
