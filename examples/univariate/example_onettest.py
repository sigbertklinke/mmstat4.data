import numpy as np, pandas as pd
import rpy2, rpy2.robjects.pandas2ri as rop
from scipy.stats import ttest_1samp
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
res = ttest_1samp(boston_df['medv'], popmean=10)
print(res)
