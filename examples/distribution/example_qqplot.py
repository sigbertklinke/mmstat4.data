import matplotlib.pyplot as plt, import statsmodels.api as sm
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
plt.figure()
sm.qqplot(data, line='s') # 's' for standardized line, '45' for a 45-degree line
plt.title('QQ Plot')
plt.show()
