import statsmodels.api as sm, scipy.stats as ss
import matplotlib.pyplot as plt, seaborn as sns
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
# ECDF
plt.figure()
sns.ecdfplot(boston_df, x="medv")
plt.show()
