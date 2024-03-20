import statsmodels.api as sm
import matplotlib.pyplot as plt
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
kde = sm.nonparametric.KDEUnivariate(boston_df['medv'].dropna())
kde.fit()
plt.figure()
plt.plot(kde.support, kde.density, label='Kernel Density')
plt.title("Kernel Density Plot for medv")
plt.xlabel("medv"); plt.ylabel("Density")
plt.show()
