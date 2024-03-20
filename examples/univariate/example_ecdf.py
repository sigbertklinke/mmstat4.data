import statsmodels.api as sm, scipy.stats as ss
import matplotlib.pyplot as plt
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
medv = boston_df['medv'] 
# ECDF
ecdf = sm.distributions.ECDF(medv)
print(ecdf)
# Summary
print(ss.describe(medv))
# Plot ECDF
plt.step(ecdf.x, ecdf.y, label='ECDF')
plt.show()
