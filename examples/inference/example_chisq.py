import pandas as pd, rpy2, rpy2.robjects.pandas2ri as rop
from scipy.stats import chi2_contingency
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
ctab = pd.crosstab(boston_df['chas'], boston_df['rad'])
print(ctab)
res = chi2_contingency(ctab)
print(res)
