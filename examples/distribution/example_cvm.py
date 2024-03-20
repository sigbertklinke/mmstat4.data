import numpy as np, scipy.stats as stats
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
data = boston_df['medv'].dropna()
# Perform the Anderson-Darling test
res = stats.cramervonmises(data, "norm", args=(np.mean(data), np.std(data)))
print(res)
