import pandas as pd
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
ftab = boston_df['rad'].value_counts()
p = ftab / len(boston_df['rad'])
gini_impurity = sum(p * (1 - p))
print(gini_impurity)
